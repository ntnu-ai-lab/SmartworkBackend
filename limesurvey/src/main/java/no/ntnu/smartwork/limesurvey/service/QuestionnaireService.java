package no.ntnu.smartwork.limesurvey.service;


import com.fasterxml.jackson.databind.JsonNode;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import lombok.extern.slf4j.Slf4j;
import no.ntnu.smartwork.limesurvey.beans.NewPatient;
import no.ntnu.smartwork.limesurvey.config.Attributes;
import no.ntnu.smartwork.limesurvey.config.QuestionnaireSettings;
import no.ntnu.smartwork.limesurvey.db.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import com.google.gson.JsonElement;


import static no.ntnu.smartwork.limesurvey.config.QuestionnaireSettings.QuestionnaireConfig;
/**
 * Manages surveys and participants.
 */
@Service
@Slf4j
public class QuestionnaireService {
    @Autowired
    private QuestionnaireSettings questionnaireSettings;
    @Autowired
    private LimesurveyService limeSurveyService;
    @Autowired
    private LSPatientInfoRepository patientInfoRepository;
    @Autowired
    private LSQuestionnaireRepository questionnaireRepository;
    @Autowired
    private ElasticsearchService elasticsearchService;

    public static final String OUTCOME_DELETED = "Deleted";
    public static final String FIELD_RESULT = "result";
    public static final String FIELD_STATUS = "status";
    //	there is no way to rename these attributes
    public static final String ATTRIBUTE_SURVEY_TYPE = "attribute_1";
    public static final String ATTRIBUTE_SURVEY_PSFS_NAME = "attribute_2";
    @Autowired
    private PatientRepository patientRepository;

    /**
     * Retrieves patient information saved earlier on baseline activation.
     *
     * @param questionnaire baseline, followup1 or followup2 or followup3
     * @return LimeSurvey ID (tid)
     * @throws Exception
     */
    public String activateFollowup(String patientId, String questionnaire) throws Exception {
        final Optional<LSPatientInfoEntity> patientInfoOpt = patientInfoRepository.findById(patientId);
        if (!patientInfoOpt.isPresent())
            throw new IllegalStateException("Cannot activate followup: patient info is missing in the database.");
        final LSPatientInfoEntity patientInfo = patientInfoOpt.get();
        Map<String, Object> participantData = new HashMap<>();
        participantData.put("email", patientInfo.getEmail());
        participantData.put("firstname", patientInfo.getFirstname());
        participantData.put("lastname", patientInfo.getLastname());
        participantData.put("participant_id", patientInfo.getPatientId());
        participantData.put("nav_id", patientInfo.getNavId());
        participantData.put("language", patientInfo.getLanguage());
        participantData.put(ATTRIBUTE_SURVEY_TYPE, questionnaire);
        participantData.put(ATTRIBUTE_SURVEY_PSFS_NAME, patientInfo.getPSFSAct());
        final QuestionnaireConfig followupConfig = questionnaireSettings.getQuestionnaires().get(questionnaire);
        final ZonedDateTime validUntil = Instant.now()
                .plus(followupConfig.getValidDuration())
                .atZone(ZoneId.systemDefault());
        participantData.put("validuntil",
                DateTimeFormatter.ISO_LOCAL_DATE.format(validUntil));

        final JsonNode result = limeSurveyService.call("add_participants", followupConfig.getSurveyId(), new Object[]{participantData}, true);
        final String tid = result.at("/0/tid").asText();
        inviteParticipant(tid, followupConfig.getSurveyId());
        questionnaireRepository.save(new LSQuestionnaireEntity(
                tid,
                followupConfig.getSurveyId(),
                patientId,
                questionnaire,
                Date.from(validUntil.toInstant()),
                followupConfig.getReminderCount(),
                new Date(),
                null
        ));
        return tid;
    }

    /**
     * This method activates baseline questionnaire for the new patients.
     *
     * @param patient
     * @return
     * @throws Exception
     */
    public Map<String, Object> activateBaseline(NewPatient patient) throws Exception {
        Map<String, Object> participantData = new HashMap<>();
        participantData.put("email", patient.getEmail());
        participantData.put("firstname", patient.getFirstname());
        participantData.put("lastname", patient.getLastname());
        participantData.put("participant_id", patient.getPatientId());
        participantData.put("language", patient.getLanguage());

        final Optional<QuestionnaireConfig> baselineOpt = questionnaireSettings.getFirstQuestionnaire();
        log.info("ACTIVATE BASELINE FUNCTION..");
        log.info("This is baseline Opt : " + baselineOpt);
        if (!baselineOpt.isPresent())
            throw new IllegalStateException("Baseline questionnaire is not configured. It is the questionnairere with 'starts: PT0m'");
        final QuestionnaireConfig baseline = baselineOpt.get();
        log.info("This is baseline : " + baseline);
        final ZonedDateTime validUntil = Instant.now().plus(baseline.getValidDuration()).atZone(ZoneId.systemDefault());
        participantData.put("validuntil",
                DateTimeFormatter.ISO_LOCAL_DATE.format(validUntil));
        participantData.put(ATTRIBUTE_SURVEY_TYPE, baselineOpt.get().getType());
        log.info("Call to RPC add_participants with this data : "+participantData);
        final JsonNode result = limeSurveyService.call("add_participants", baseline.getSurveyId(), new Object[]{participantData}, true);
        final String tid = result.at("/0/tid").asText();
        inviteParticipant(tid, baseline.getSurveyId());
        questionnaireRepository.save(new LSQuestionnaireEntity(
                tid,
                baseline.getSurveyId(),
                patient.getPatientId(),
                baseline.getType(),
                Date.from(validUntil.toInstant()),
                baseline.getReminderCount(),
                new Date(),
                null
        ));

        QuestionnaireConfig followup1 = questionnaireSettings.getQuestionnaires().get("followup1");
        Date followup1StartDay = Date.from(Instant.now().plus(followup1.getStartDay()));
        //log.info("Followup1 Start Day: {}", followup1StartDay.toInstant());

        QuestionnaireConfig followup2 = questionnaireSettings.getQuestionnaires().get("followup2");
        Date followup2StartDay = Date.from(Instant.now().plus(followup2.getStartDay()));
        //log.info("Followup2 Start Day: {}", followup2StartDay.toInstant());

        QuestionnaireConfig followup3 = questionnaireSettings.getQuestionnaires().get("followup3");
        Date followup3StartDay = Date.from(Instant.now().plus(followup3.getStartDay()));

        //Update response in LsPatientInfoEntity Table
        final LSPatientInfoEntity lsPatientInfo = patientInfoRepository.findByPatientId(patient.getPatientId());
        final LSPatientInfoEntity updatedlsPatientInfo = lsPatientInfo.toBuilder()
                                                        .consented(true)
                                                        .activeStatus("active")
                                                        .baselineActivated(Date.from(Instant.now()))
                                                        .follwoup1Date(followup1StartDay)
                                                        .follwoup2Date(followup2StartDay)
                                                        .follwoup3Date(followup3StartDay).build();
        patientInfoRepository.save(updatedlsPatientInfo);



                // Prepare response map with dates
        Map<String, Object> response = new HashMap<>();
        response.put("BaseLineDate", validUntil.toInstant());
        response.put("Followup1Date", followup1StartDay.toInstant());
        response.put("Followup2Date", followup2StartDay.toInstant());
        response.put("Followup3Date", followup3StartDay.toInstant());
        //log.info("Response Map {}", response);
        return response;

        //TODO : Check record in LS-info, and create a flag when baseline is triggered through dashboard.

        // patientInfoRepository.save(LSPatientInfoEntity.builder()
          //      .patientId(patient.getPatientId())
            //    .navId(patient.getNavId())
              //  .firstname(patient.getFirstname())
         //       .lastname(patient.getLastname())
           //     .email(patient.getEmail())
            //    .phone(patient.getPhone())
            //    .language(patient.getLanguage())
             //   .build());


      //  return tid;

    }

    public void inviteParticipant(String tokenID, String surveyId) throws Exception {
        log.info("tokenID: "+ tokenID);
        log.info("surveyId: "+ surveyId);
        final JsonNode result = limeSurveyService.call("invite_participants", surveyId, Collections.singletonList(tokenID));
        if (!result.has(tokenID))
            throw new RuntimeException(result.get(FIELD_STATUS).asText());
    }

    /**
     * Invokes sending a reminder irrespective of how many and when reminders were sent before.
     */
    public void sendReminder(String tokenID, String surveyId) throws Exception {
        log.info("RPC call to Remind participant for token: {} and survey: {}", tokenID, surveyId);

        // 1. Get questionnaire from database
        Optional<LSQuestionnaireEntity> questionnaire = questionnaireRepository.findById(tokenID);
        if (!questionnaire.isPresent()) {
            log.error("Token {} not found in local database", tokenID);
            throw new IllegalStateException("Token not found in database");
        }

        LSQuestionnaireEntity q = questionnaire.get();

        // 2. Get the config for this questionnaire type
        QuestionnaireConfig config = questionnaireSettings.getQuestionnaires().get(q.getType());
        if (config == null) {
            log.error("No configuration found for questionnaire type: {}", q.getType());
            throw new IllegalStateException("Invalid questionnaire type");
        }

        // 3. Check reminders left in our database
        if (q.getRemindersLeft() <= 0) {
            log.warn("No reminders left for token {}. Set maximum is {}",
                    tokenID, config.getReminderCount());
            return;
        }

        // 4. Check reminder interval
        if (q.getLastReminder() != null) {
            Instant nextReminderTime = q.getLastReminder().toInstant()
                    .plus(config.getReminderInterval());
            if (Instant.now().isBefore(nextReminderTime)) {
                log.warn("Too soon to send reminder. Next reminder allowed at: {}", nextReminderTime);
                return;
            }
        }

        // 5. Check if the questionnaire is still valid
        if (Instant.now().isAfter(q.getValidUntil().toInstant())) {
            log.warn("Questionnaire has expired. Valid until: {}", q.getValidUntil());
            return;
        }

        // 6. Now try to send the reminder
        List<String> tokens = Collections.singletonList(tokenID);
        log.info("Calling LimeSurvey API with tokens: {}", tokens);

        final JsonNode result = limeSurveyService.call("remind_participants", surveyId, tokens);
        log.info("Raw LimeSurvey response: {}", result.toString());

        // 7. Process the response
        JsonNode statusNode = result.path("status");
        if (!statusNode.isMissingNode()) {
            String status = statusNode.asText();
            if (status.contains("left to send")) {
                // Success - update the reminder count and last reminder time
                LSQuestionnaireEntity updated = q.toBuilder()
                        .remindersLeft(q.getRemindersLeft() - 1)
                        .lastReminder(Date.from(Instant.now()))
                        .build();
                questionnaireRepository.save(updated);
                log.info("Reminder sent successfully and database updated");
                return;
            }

            if (status.contains("No candidate tokens")) {
                log.warn("LimeSurvey reports no candidate tokens. Checking token status...");
                JsonNode tokenStatus = limeSurveyService.call("get_participant_properties", surveyId, tokenID);
                log.info("Token properties in LimeSurvey: {}", tokenStatus);

                // Check if completed in LimeSurvey but not in our DB
                if (tokenStatus.has("completed") && "Y".equals(tokenStatus.get("completed").asText())
                        && q.getCompletedDate() == null) {
                    log.info("Updating completed status in database");
                    LSQuestionnaireEntity updated = q.toBuilder()
                            .completedDate(new Date())
                            .build();
                    questionnaireRepository.save(updated);
                }
                return;
            }
        }

        throw new IllegalStateException("Unexpected response format from LimeSurvey");
    }

    /**
     * Invokes exporting responses from LS.
     */
    public JsonObject exportResponse(String tokenID, String surveyId) throws Exception {
        // Call the survey service to get the response data
        JsonNode result = limeSurveyService.call("export_responses", surveyId, null, null, Collections.singletonList(tokenID));
        // Extract the base64-encoded string from the JSON node (assuming 'responses' is the base64 encoded field)
        String encodedResult = result.get("responses").asText(); // Ensure 'responses' field contains the base64 string
        // Decode the base64 string
        String resultBase64Decoded = new String(Base64.getDecoder().decode(encodedResult), StandardCharsets.UTF_8);
        // Parse the decoded result into a JSON object (assuming using Gson for JSON parsing)
        JsonObject jsonObject = JsonParser.parseString(resultBase64Decoded).getAsJsonObject();
        // Extract the 'responses' object
        JsonObject responses = jsonObject.getAsJsonObject("responses");
        // Check if the responses contain the tokenID
        if (!responses.has(tokenID)) {
            throw new IllegalStateException("Invalid response status: " + responses.get(FIELD_STATUS).getAsString());
        }
        return responses;
    }


    /**
     * @param tokenIDs note, this not a token itself.
     * @throws Exception if there is no such participant or other problems.
     */
    public void deleteParticipants(String... tokenIDs) throws Exception {

//		TODO: deleting responses
/*
		for (String tid : tokenIDs) {
			final String token = getParticipantProperties(tid).getToken();
			final JsonNode responseResult = call("get_response_ids", questionnaireSettings.getSurveyID(), token);
			List<Integer> responseIDs = new ArrayList<>();
			responseResult.elements().forEachRemaining(jsonNode -> responseIDs.add(jsonNode.asInt()));
		}
*/
        final List<LSQuestionnaireEntity> questionnaires = questionnaireRepository.findAllByTokenIdIn(tokenIDs);
//		questionnaires.stream().map(q->q.getSurveyId()).collect(Collectors.toSet());
        for (final LSQuestionnaireEntity questionnaire : questionnaires) {

            final JsonNode result;
            final String tokenId = questionnaire.getTokenId();
            try {
                result = limeSurveyService.call("delete_participants", questionnaire.getSurveyId(), tokenId);
            } catch (Exception e) {
                throw new RuntimeException(String.format("Error deleting LimeSurvey participant %s: %s", tokenId, e.getMessage()));
            }
//		checking errors
            final Optional<String> outcome = Optional.ofNullable(result.get(tokenId)).map(JsonNode::asText);
            final Optional<String> status = Optional.ofNullable(result.get(FIELD_STATUS)).map(JsonNode::asText);
            if (!outcome.filter(OUTCOME_DELETED::equals).isPresent())
                throw new IllegalStateException(outcome.orElse(status.orElse(result.get(0).asText())));

        }
    }


    /**
     * <ul>
     * <li>
     * Looks at the date when the baseline was completed.
     * </li>
     * <li>
     * Adds number of days specified by {@link QuestionnaireConfig#getStartDay()}.
     * </li>
     * <li>
     * If today is within {@link QuestionnaireConfig#getValidDuration()} days
     * after the found date then activate the appropriate questionnaire.
     * </li>
     * <li>
     *     If the questionnaire is active check if any reminder are due.
     * </li>
     * </ul>
     * <p>See limesurvey section in application.yml</p>
     *
     * @throws Exception
     */

    @Scheduled(cron = "${limesurvey.cron}")
    public void onSchedule() throws Exception {
        log.info("Starting onSchedule execution");

        for (final QuestionnaireConfig config : questionnaireSettings.getQuestionnaires().values()) {
            log.info("Processing questionnaire config: isBaseline={}, type={}, startDay={}, validDuration={}",
                    config.isBaseline(),
                    config.getType(),
                    config.getStartDay(),
                    config.getValidDuration());
            if (!config.isBaseline()) {
//				baselineCompleted + startDay <= now <=baselineCompleted + startDay + validDuration
//				thus:
//				baselineCompleted <= now-startDay
//				now - startDay - validDuration <=baselineCompleted
//				and finally:
//				now - startDay - validDuration <=baselineCompleted <= now-startDay
                log.info("config startDay: {}, getValidDuration: {}", config.getStartDay(), config.getValidDuration());
                final Instant from = Instant.now()
                        .minus(config.getStartDay())
                        .minus(config.getValidDuration());
                final Instant to = Instant.now()
                        .minus(config.getStartDay());
                final Instant now = Instant.now();
                log.info("Searching for baselines in time window: from={}, to={}, current time={}",
                        from, to, now);
//				First, find the patients (via baseline records) that have followup questionnaires due
                final List<LSQuestionnaireEntity> baselines =
                        //log.info("found baselines n= {}, dates: from {} to {}", baselines.size(), startDate, endDate);
                         questionnaireRepository.findAllByCompletedDateBetween(Date.from(from), Date.from(to));
                log.info("found baselines n= {}, dates: from {} to {}, value {}", baselines.size(), from, to, baselines);
                baselines.forEach(baseline -> {
                    log.info("Baseline: patientId={}, completedDate={}, tokenId={}",
                            baseline.getPatientId(),
                            baseline.getCompletedDate(),
                            baseline.getTokenId());
                });

                for (final LSQuestionnaireEntity baseline : baselines) {
                    final String patientId = baseline.getPatientId();
                    log.info("baseline completion date fetch : {})", baseline.getCompletedDate());
                    log.info("Processing baseline for patient={}, checking for followup type={}",
                            patientId, config.getType());
//					Check if there is no active followup questionnaire
                    final Optional<LSQuestionnaireEntity> followupOpt = questionnaireRepository.findByPatientIdAndType(patientId, config.getType());
                    //log.info("Checking followup type in repo: {}", followupOpt);
                    followupOpt.ifPresent(entity ->
                            log.info("Checking followup type in repo - Patient ID: {}, Type: {}, Entity Details: {}",
                                    patientId,
                                    config.getType(),
                                    entity)  // This will use toString() of your entity
                    );
                    if (!followupOpt.isPresent()) {
                        final String tokenId = activateFollowup(patientId, config.getType());
                        log.info("If found, Activated a followup questionnaire for the user {} with token ID = {}", patientId, tokenId);
                    } else {
                        final LSQuestionnaireEntity followup = followupOpt.get();
                        log.info("Existing followup found: completedDate={}, remindersLeft={}, lastReminder={}",
                                followup.getCompletedDate(),
                                followup.getRemindersLeft(),
                                followup.getLastReminder());

                        if (followup.getCompletedDate() == null
                                && followup.getRemindersLeft() > 0
                                && Instant.now().isAfter(
                                followup.getLastReminder().toInstant()
                                        .plus(config.getReminderInterval()))
                        ) {
//						send reminder if there is the active questionnaire and it is not completed
                            log.info("Sending a reminder to user {} with token ID = {}", patientId, followup.getTokenId());
                            sendReminder(followup.getTokenId(), config.getSurveyId());
                            final LSQuestionnaireEntity updatedFollowup = followup.toBuilder()
                                    .remindersLeft(followup.getRemindersLeft() - 1)
                                    .lastReminder(Date.from(Instant.now()))
                                    .build();
                            questionnaireRepository.save(updatedFollowup);
                        }
                    }
                }
            } else {
                // Getting all baselines that are open, have reminders left, and the duration since the last reminder has passed
                final List<LSQuestionnaireEntity> openBaselines
                        = questionnaireRepository.findAllByTypeAndCompletedDateAndLastReminderBefore("baseline", null, Date.from(Instant.now().minus(config.getReminderInterval())));
                for (final LSQuestionnaireEntity openBL : openBaselines) {
                    // check whether there are still reminders allowed to be send, if so, send the reminder
                    // TODO : check for sending reminder after completed date is corrected. Uncomment after editing above.

                    if (openBL.getRemindersLeft() > 0){
                         log.info("Sending baseline reminder to patientID {} with token ID = {}", openBL.getPatientId(), openBL.getTokenId());
                         sendReminder(openBL.getTokenId(), config.getSurveyId());
                         //reduce the reminder counter in the database
                         final LSQuestionnaireEntity updatedBL = openBL.toBuilder()
                                .remindersLeft(openBL.getRemindersLeft() - 1)
                                .lastReminder(Date.from(Instant.now()))
                                .build();
                        questionnaireRepository.save(updatedBL);

                    };


                }

            }
        }
    }

    /**
     * Adds questionnaire responses to ES.
     * Updates PSFS value in the database if it is baseline.
     * The PSFS values is to be passed to the followup questionnaires.
     * @param tokenID a tokeID, not token itself
     * @param questionnaireType    baseline/followup1/followup2/followup3
     * @param answers a map of questionid -> answer
     */
    public void addQuestionnaire(String tokenID, String questionnaireType, Map<String, String> answers) {

        final Optional<LSQuestionnaireEntity> questionnaireOpt = questionnaireRepository.findById(tokenID);
        if (!questionnaireOpt.isPresent())
            throw new IllegalStateException("There is no information about the questionnaire with token ID " + tokenID);
        final LSQuestionnaireEntity questionnaire = questionnaireOpt.get();
        final String patientId = questionnaire.getPatientId();
        final Optional<LSPatientInfoEntity> patientInfoOpt = patientInfoRepository.findById(patientId);
        if (!patientInfoOpt.isPresent())
            throw new IllegalStateException("There is no information about the patient ID " + patientId);
        log.info("Adding questionnaire to the patient {} ({})", patientId, questionnaireType);

      //elasticsearchService.saveQuestionnaire(patientId, null, questionnaireType, answers);
        elasticsearchService.saveQuestionnaire(patientId, questionnaireType, answers);


        final LSQuestionnaireEntity updatedQuestionnaireInfo = questionnaire.toBuilder()
                .completedDate(new Date()).build();
        questionnaireRepository.save(updatedQuestionnaireInfo);

        // Retrieve the patient information to update the corresponding date based on questionnaire type
        final LSPatientInfoEntity patientInfo = patientInfoOpt.get();
        LSPatientInfoEntity updatedPatientInfo = null;

        // Check questionnaire type and update the corresponding completed date
        if (questionnaireType.equals(questionnaireSettings.getFirstQuestionnaire().get().getType())) {
            // Update baseline completed date and PSFSAct
            updatedPatientInfo = patientInfo.toBuilder()
                    .PSFSAct(answers.get(Attributes.PSFSAct))
                    .baselineCompleted(new Date())
                    .build();
        } else if (questionnaireType.equalsIgnoreCase("Followup1")) {
            // Update followup1 completed date
            updatedPatientInfo = patientInfo.toBuilder()
                    .follwoup1Completed(new Date())
                    .build();
        } else if (questionnaireType.equalsIgnoreCase("Followup2")) {
            // Update followup2 completed date
            updatedPatientInfo = patientInfo.toBuilder()
                    .follwoup2Completed(new Date())
                    .build();
        } else if (questionnaireType.equalsIgnoreCase("Followup3")) {
            // Update followup3 completed date
            updatedPatientInfo = patientInfo.toBuilder()
                    .follwoup3Completed(new Date())
                    .build();
        }

        // Save updated patient information if any field was modified
        if (updatedPatientInfo != null) {
            patientInfoRepository.save(updatedPatientInfo);
        }
    }


}

