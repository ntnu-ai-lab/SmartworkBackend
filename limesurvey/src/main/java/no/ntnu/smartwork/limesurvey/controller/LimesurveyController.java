package no.ntnu.smartwork.limesurvey.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
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
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;
import com.fasterxml.jackson.core.JsonParseException;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.server.ResponseStatusException;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

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
                    @ApiResponse(
                            responseCode = "200",
                            description = "Successful operation",
                            content = @Content(
                                    mediaType = "application/json",
                                    schema = @Schema(implementation = String.class)
                            )
                    )
            })
    @PostMapping(
            value = "questionnaire",
            produces = MediaType.TEXT_PLAIN_VALUE,
            consumes = MediaType.APPLICATION_JSON_VALUE
    )
    public @ResponseBody String postQuestionnaire(@RequestBody String rawPayload) {
        try {
            // Preprocess the raw payload to fix common issues
            String sanitizedPayload = rawPayload
                    .replace("'", "\"")
                    .replace("None", "null");

            // Log the sanitized payload for debugging
            log.debug("Sanitized payload: {}", sanitizedPayload);

            ObjectMapper objectMapper = new ObjectMapper();

            // First try to parse as JsonNode to validate JSON structure
            JsonNode jsonNode = objectMapper.readTree(sanitizedPayload);
            log.debug("JSON structure valid, attempting to map to object");

            // Map to questionnaire object
            CompletedQuestionnaireBean questionnaire = objectMapper.readValue(
                    sanitizedPayload,
                    CompletedQuestionnaireBean.class
            );

            // Process the questionnaire
            questionnaireService.addQuestionnaire(
                    questionnaire.getTid(),
                    questionnaire.getType(),
                    questionnaire.getQuestionnaire()
            );

            log.info("Successfully saved questionnaire with tid: {}", questionnaire.getTid());
            return "OK";

        } catch (JsonProcessingException e) {
            log.error("JSON parsing error: {}", e.getMessage());
            log.error("Error location: {}",
                    e.getLocation() != null ?
                            String.format("line %d, column %d",
                                    e.getLocation().getLineNr(),
                                    e.getLocation().getColumnNr()) :
                            "unknown"
            );
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST,
                    "Invalid JSON format: " + e.getMessage(),
                    e
            );
        } catch (Exception e) {
            log.error("Failed to process questionnaire payload", e);
            throw new ResponseStatusException(
                    HttpStatus.INTERNAL_SERVER_ERROR,
                    "Error processing payload",
                    e
            );
        }
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
