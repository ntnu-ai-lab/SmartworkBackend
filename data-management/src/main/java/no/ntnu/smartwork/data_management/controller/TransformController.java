/**
 * Author: Anuja Vats
 */

package no.ntnu.smartwork.data_management.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import no.ntnu.smartwork.data_management.service.TransformerService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/transformer")
public class TransformController {
    private final Log log = LogFactory.getLog(getClass());

    @Autowired
    private TransformerService transformerService;

    @GetMapping("/")
    public String health() {
        return "I am Ok!";
    }

    @PostMapping("/jsonToJson")
    @Operation(summary = "${TransformerController.transformJsonToJson}",
            description = "Sample payload json :---> {'source': {'first_name': 'anuja','last_name': 'vats','address'" +
                    ": {'home': '4B','street': 'ntnu'}},'target': " +
                    "{'first': '<<first_name>>','last': '<<last_name>>','home': " +
                    "'<<address$home>>','street': '<<address$street>>'}}. In the target the values are the source keys " +
                    "separated by dollar, '$', sign, while leading chars with 2 less-than sign ad trailing chars with 2" +
                    " greater-than sign.")
    @ApiResponses({
            @ApiResponse(
                    responseCode = "200",description = "OK_200",content = @Content(mediaType = "application/json", schema = @Schema(implementation = String.class))
            ),
            @ApiResponse(
                    responseCode = "401",
                    description = "UNAUTHORIZED_401"
            ),
            @ApiResponse(
                    responseCode = "403",
                    description = "FORBIDDEN_403"
            ),
            @ApiResponse(
                    responseCode = "404",
                    description = "NOT_FOUND_404"
            ),
            @ApiResponse(
                    responseCode = "500",
                    description = "INTERNAL_SERVER_ERROR_500"
            )
    })
    public ResponseEntity<?> transformJsonToJson(@RequestBody String payloadJson) throws Exception {
        String response = transformerService.transformJsonToJson(payloadJson);
        return ResponseEntity.ok().body(response);
    }


    @PostMapping("/xmlToJson")
    @Operation(summary = "${TransformerController.transformXmlToJson}")
    @ApiResponses({
            @ApiResponse(
                    responseCode = "200",
                    description = "OK_200",
                    content = @Content(mediaType = "application/json", schema = @Schema(implementation = String.class))
            ),
            @ApiResponse(
                    responseCode = "401",
                    description = "UNAUTHORIZED_401"
            ),
            @ApiResponse(
                    responseCode = "403",
                    description = "FORBIDDEN_403"
            ),
            @ApiResponse(
                    responseCode = "404",
                    description = "NOT_FOUND_404"
            ),
            @ApiResponse(
                    responseCode = "500",
                    description = "INTERNAL_SERVER_ERROR_500"
            )
    })

    public ResponseEntity<?> transformXmlToJson( @RequestBody String payloadJson) throws Exception {
        String response = transformerService.transformXmlToJson(payloadJson);
        return ResponseEntity.ok().body(response);
    }


    @PostMapping("/jsonToCbrCase")
    @Operation(summary = "${TransformerController.transformJsonToCbr}",
            description = "Sample payload json :---> {'first_name': 'amar','last_name': 'jaiswal','address'" +
                    ": {'home': '99B','street': 'ntnu'}}")
    @ApiResponses({
            @ApiResponse(
                    responseCode = "200",
                    description = "OK_200",
                    content = @Content(mediaType = "application/json", schema = @Schema(implementation = String.class))
            ),
            @ApiResponse(
                    responseCode = "401",
                    description = "UNAUTHORIZED_401"
            ),
            @ApiResponse(
                    responseCode = "403",
                    description = "FORBIDDEN_403"
            ),
            @ApiResponse(
                    responseCode = "404",
                    description = "NOT_FOUND_404"
            ),
            @ApiResponse(
                    responseCode = "500",
                    description = "INTERNAL_SERVER_ERROR_500"
            )
    })

    public ResponseEntity<?> transformJsonToCbr( @RequestBody String payloadJson) throws Exception {
        String response = transformerService.transformJsonToCbr(payloadJson);
        return ResponseEntity.ok().body(response);
    }
}
