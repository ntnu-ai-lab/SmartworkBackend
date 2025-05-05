/**
 * Author: Anuja Vats
 */

package no.ntnu.smartwork.limesurvey.controller;

import lombok.extern.slf4j.Slf4j;
import no.ntnu.smartwork.limesurvey.beans.Appuser;
import jakarta.validation.Valid;
import no.ntnu.smartwork.limesurvey.service.LoginService;
import no.ntnu.smartwork.limesurvey.service.TokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/login")
@Slf4j
public class PasswordResetController {

    @Autowired
    private LoginService loginService;

    @Autowired
    private TokenService tokenService;

    @PostMapping(value = "/app_credentials")
    public ResponseEntity<String> processCredentials(@Valid @RequestBody Appuser user) {
        try {
            log.info("Received credentials request for username: {}", user.getUsername());
            loginService.processAppCredentails(user);
            return ResponseEntity.ok("Password processed successfully");
        } catch (IllegalArgumentException e) {
            log.error("Invalid request: {}", e.getMessage());
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            log.error("Error processing credentials", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Failed to process password: " + e.getMessage());
        }
    }


    @GetMapping("/validate_token")
    public ResponseEntity<?> validateToken(@RequestParam("token") String token) {
        try {
            if (tokenService.validateToken(token)) {
                String patientID = tokenService.getPatientIDFromToken(token);
                return ResponseEntity.ok().body(patientID);
            } else {
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Token expired or invalid");
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid token format");
        }
    }

}