package no.ntnu.smartwork.limesurvey.service;


import lombok.extern.slf4j.Slf4j;
import no.ntnu.smartwork.limesurvey.beans.NewPatient;
import no.ntnu.smartwork.limesurvey.db.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.*;

@Service
@Slf4j
public class DashboardService {

    @Autowired
    private LSPatientInfoRepository lsPatientInfoRepository;

    @Autowired
    private PatientRepository patientRepository;

    @Autowired
    private AttributeEncryptor attributeEncryptor;

    @Autowired
    private EmailService emailService;
    @Autowired
    private ElasticsearchService elasticsearchService;

    public List<LSPatientInfoEntity> getAllPatientInfo() {
        return (List<LSPatientInfoEntity>) lsPatientInfoRepository.findAll();
    }

    public void setPatientGroup(NewPatient Patient) {
        log.info("search for patientID: {} , phone: {}, email: {} ",
                Patient.getPatientId(), Patient.getPhone(), Patient.getEmail());

        PatientEntity existingUser = patientRepository.findByPatientId(Patient.getPatientId());

        if (existingUser == null) {
            log.error("User not found with ID: {}", Patient.getPatientId());
            throw new IllegalStateException("Could not find this Username.");
        }

        final PatientEntity existingPatient = patientRepository.findByPatientId(Patient.getPatientId());
        final PatientEntity updatedPatient = existingPatient.toBuilder()
                .rctGroup(Patient.getRctGroup())
                .build();
        patientRepository.save(updatedPatient);
        log.info("Updated PatientEntity with RCT group: '{}'", Patient.getRctGroup());
        LSPatientInfoEntity existinguser = lsPatientInfoRepository.findByPatientId(Patient.getPatientId());

        if (existinguser == null) {
            log.error("LS Patient not found with ID: {}", Patient.getPatientId());
            throw new IllegalStateException("Could not find this Username in LS Patient Info.");
        }

        final LSPatientInfoEntity existingLSPatient = lsPatientInfoRepository.findByPatientId(Patient.getPatientId());
        final LSPatientInfoEntity updatedLSPatient = existingLSPatient.toBuilder()
                .rctGroup(Patient.getRctGroup())
                .build();
        lsPatientInfoRepository.save(updatedLSPatient);

        log.info("group {} updated in LSPatientInfoEntity for {} : ", updatedLSPatient.getPatientId(), updatedLSPatient.getRctGroup());
        log.info("Print RCT group value for debugging : '{}'", Patient.getRctGroup());
        if (updatedLSPatient.getRctGroup().equalsIgnoreCase("intervention")) {
            log.info("LS - DashboardService - sending email to patientId for appLogin: {}", Patient.getPatientId());
            emailService.sendEmail(Patient.getEmail(), Patient.getPatientId(), updatedLSPatient.getFirstname() + " " + updatedLSPatient.getLastname());
        } else if (updatedLSPatient.getRctGroup().equalsIgnoreCase("control")) {
            log.info("LS - DashboardService - sending email to patientId for control group: {}", Patient.getPatientId());
            emailService.sendControlEmail(Patient.getEmail(), Patient.getPatientId(), updatedLSPatient.getFirstname() + " " + updatedLSPatient.getLastname());
        }

    }


    public void resetPatientGroup(NewPatient Patient) {
        log.info("search for patientID: {} , phone: {}, email: {} ",
                Patient.getPatientId(), Patient.getPhone(), Patient.getEmail());

        PatientEntity existingUser = patientRepository.findByPatientId(Patient.getPatientId());

        if (existingUser == null) {
            log.info("user exists: " + existingUser.getPatientId());
            throw new IllegalStateException("Could not find this Username.");
        }

        final PatientEntity existingPatient = patientRepository.findByPatientId(Patient.getPatientId());
        LSPatientInfoEntity existinguser = lsPatientInfoRepository.findByPatientId(Patient.getPatientId());

        if (existinguser == null) {
            log.info("user exists: " + existinguser.getPatientId());
            throw new IllegalStateException("Could not find this Username.");
        }

        // Verify group is intervention
        if (existinguser.getRctGroup().equalsIgnoreCase("intervention")) {
            log.info("LS - DashboardService - sending email to patientID for Resetting password for App: {}", Patient.getPatientId());
            emailService.sendEmail(Patient.getEmail(), Patient.getPatientId(), existinguser.getFirstname() + " " + existinguser.getLastname());
        }
        // Verify group is control
        else if (existinguser.getRctGroup().equalsIgnoreCase("control")) {
            log.info("LS - DashboardService - sending email to patientID for control group: {}", Patient.getPatientId());
            emailService.sendControlEmail(Patient.getEmail(), Patient.getPatientId(), existinguser.getFirstname() + " " + existinguser.getLastname());
        }

    }


    public void deactivatePatient(NewPatient Patient) {
        log.info("search for patientID: {} , phone: {}, email: {} ",
                Patient.getPatientId(), Patient.getPhone(), Patient.getEmail());
        LSPatientInfoEntity existinguser = lsPatientInfoRepository.findByPatientId(Patient.getPatientId());

        if (existinguser == null) {
            log.info("user exists: " + existinguser.getPatientId());
            throw new IllegalStateException("Could not find this Username.");
        }

        final LSPatientInfoEntity existingLSPatient = lsPatientInfoRepository.findByPatientId(Patient.getPatientId());
        final LSPatientInfoEntity updatedLSPatient = existingLSPatient.toBuilder()
                .activeStatus(Patient.getActiveStatus())
                .deactivationComment(Patient.getDeactivationComment())
                .build();
        lsPatientInfoRepository.save(updatedLSPatient);

    }

    /**
     * Checks if user exists and sends a password reset email if criteria are met
     *
     * @param email The email address to check
     * @return boolean True if user exists and email was sent, false otherwise
     */
    public boolean checkUserExists(String email,  String userId) {
        try {
            LSPatientInfoEntity existingUserInfo = null;
            PatientEntity existingPatient = null;

            if (email != null && !email.isEmpty()) {
                existingPatient = findByEmailWithDecryption(email);

                if (existingPatient != null) {
                    log.info("Found user by email with patientID: {}", existingPatient.getPatientId());
                    existingUserInfo = lsPatientInfoRepository.findByPatientId(existingPatient.getPatientId());
                }
            }

            // If not found by email, check by userId if provided
            if (existingUserInfo == null && userId != null && !userId.isEmpty()) {
                existingPatient = patientRepository.findByPatientId(userId);

                if (existingPatient == null) {
                    log.info("User not found by userId: {}", userId);
                    return false;
                }

                existingUserInfo = lsPatientInfoRepository.findByPatientId(userId);
            }

            // If still not found, return false
            if (existingUserInfo == null) {
                log.info("User not found with provided credentials");
                return false;
            }

            // Verify group is intervention
            if (existingUserInfo.getRctGroup().equalsIgnoreCase("intervention")) {
                log.info("Sending password reset email to patientID: {}", existingUserInfo.getPatientId());
                emailService.sendEmail(existingUserInfo.getEmail(), existingUserInfo.getPatientId(),
                        existingUserInfo.getFirstname() + " " + existingUserInfo.getLastname());
                return true;
            } else {
                log.info("User found but not in intervention group: {}", existingUserInfo.getPatientId());
                return false; // User exists but not in intervention group
            }
        } catch (Exception e) {
            log.error("Error in checkUserCredentials for email: {} or userId: {}", email, userId, e);
            return false; // Error occurred during the process
        }
    }

    public PatientEntity findByEmailWithDecryption(String email) {
        // Get all records and decrypt in memory
        Iterable<PatientEntity> patientIterable = patientRepository.findAll();
        List<PatientEntity> allPatients = new ArrayList<>();
        patientIterable.forEach(allPatients::add);

        // Filter after decrypting
        return allPatients.stream()
                .filter(patient -> {
                    String decryptedEmail = patient.getEmail();
                    return email.equalsIgnoreCase(decryptedEmail);
                })
                .findFirst()
                .orElse(null);
    }
}


