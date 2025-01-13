package no.ntnu.smartwork.limesurvey.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import no.ntnu.smartwork.limesurvey.beans.CompletedQuestionnaireBean;
import no.ntnu.smartwork.limesurvey.beans.NewPatient;
import no.ntnu.smartwork.limesurvey.db.LSPatientInfoEntity;
import no.ntnu.smartwork.limesurvey.db.LSPatientInfoRepository;
import no.ntnu.smartwork.limesurvey.service.QuestionnaireService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * Provides registration of new patients.
 */
@RestController
@RequestMapping(value = "/")
@Slf4j
public class LimesurveyController {
    @Autowired
    private QuestionnaireService questionnaireService;
    @Autowired
    private LSPatientInfoRepository patientInfoRepository;

    /**
     * <ul>
     *
     * <li>Activate baseline1 questionnaire for the patient including sending the invitation.</li>
     * <li>Saves the information about the patient for future use.</li>
     * <li>Followup questionnaires will be activated by {@link QuestionnaireService#onSchedule()}</li>
     * </ul>
     *
     */
   // @PostMapping(value = "activate")
 //   public void activatePatient(@Valid @RequestBody NewPatient newPatient) throws Exception {
 //       log.debug("Activating patient {}", newPatient.getPatientId());
  //      questionnaireService.activateBaseline(newPatient);
  //  }


    /**
     * Add questionnaire answers to the ES.
*/
    @Operation(summary = "Post questionnaire",
            responses = {
                    @ApiResponse(responseCode = "200", description = "Successful operation", content = @Content(mediaType = "application/json", schema = @Schema(implementation = String.class)))})

    @PostMapping(value = "questionnaire", produces = "text/plain", consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    String postQuestionnaire(@RequestBody String rawPayload) {
        try {
            // Preprocess the raw payload to fix common issues
            String sanitizedPayload = rawPayload
                    .replace("'", "\"")  // Replace single quotes with double quotes
                    .replace("None", "null");  // Replace Python's None with JSON null

            // Deserialize to CompletedQuestionnaireBean
            ObjectMapper objectMapper = new ObjectMapper();
            CompletedQuestionnaireBean questionnaire = objectMapper.readValue(sanitizedPayload, CompletedQuestionnaireBean.class);

            // Process the questionnaire
            questionnaireService.addQuestionnaire(questionnaire.getTid(), questionnaire.getType(), questionnaire.getQuestionnaire());
            log.info("Save Questionnaire function, Posts this map elastic interface url..." + questionnaire.getQuestionnaire());
        } catch (Exception e) {
            log.error("Failed to process questionnaire payload", e);
            return "Error processing payload";
        }
        return "OK";
    }
   /*
    @PostMapping(value = "questionnaire", produces = "text/plain", consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    String postQuestionnaire(@Parameter(name = "bean", description  = "user details", required = true) @RequestBody
                             CompletedQuestionnaireBean questionnaire) {
        questionnaireService.addQuestionnaire(questionnaire.getTid(), questionnaire.getType(), questionnaire.getQuestionnaire());
        log.info("Save Questionaire function, Posts this map elastic interface url..."+ questionnaire.getQuestionnaire());
        return "OK";
    }
     */


    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public Map<String, String> handleValidationExceptions(
            MethodArgumentNotValidException ex) {
        Map<String, String> errors = new HashMap<>();
        ex.getBindingResult().getAllErrors().forEach((error) -> {
            String fieldName = ((FieldError) error).getField();
            String errorMessage = error.getDefaultMessage();
            errors.put(fieldName, errorMessage);
        });
        return errors;
    }


    @GetMapping("/")
    public String health() {
        return "LimeSurvey service is okay!";
    }
}
