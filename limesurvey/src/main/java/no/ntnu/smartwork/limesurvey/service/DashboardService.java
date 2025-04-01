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
    private EmailService emailService;

    public List<LSPatientInfoEntity> getAllPatientInfo() {
        return (List<LSPatientInfoEntity>) lsPatientInfoRepository.findAll();
    }

    public void setPatientGroup(NewPatient Patient){
        log.info("search for patientID: {} , phone: {}, email: {} ",
                Patient.getPatientId(), Patient.getPhone(), Patient.getEmail() );

        PatientEntity existingUser = patientRepository.findByPatientId(Patient.getPatientId());

        if (existingUser == null) {
            log.info("user exists: " + existingUser.getPatientId());
            throw new IllegalStateException("Could not find this Username.");
        }

        final PatientEntity existingPatient = patientRepository.findByPatientId(Patient.getPatientId());
        final PatientEntity updatedPatient = existingPatient.toBuilder()
                                            .rctGroup(Patient.getRctGroup())
                                            .build();
        patientRepository.save(updatedPatient);

        LSPatientInfoEntity existinguser = lsPatientInfoRepository.findByPatientId(Patient.getPatientId());

        if (existinguser == null) {
            log.info("user exists: " + existinguser.getPatientId());
            throw new IllegalStateException("Could not find this Username.");
        }

        final LSPatientInfoEntity existingLSPatient = lsPatientInfoRepository.findByPatientId(Patient.getPatientId());
        final LSPatientInfoEntity updatedLSPatient = existingLSPatient.toBuilder()
                                                        .rctGroup(Patient.getRctGroup())
                                                        .build();
        lsPatientInfoRepository.save(updatedLSPatient);

        //TODO :  Check if RctGroup is intervention,
        // send a mail to user, with link to password-reset webpage, fetch back the password and send to stuart API.
        // sending an e-Mail for resetting passwords
		if (updatedLSPatient.getRctGroup().equalsIgnoreCase("intervention")) {
			log.info("LS - DashboardService - sending email to patientId for appLogin: {}", Patient.getPatientId());
			emailService.sendEmail(Patient.getEmail(), Patient.getPatientId(), updatedLSPatient.getFirstname() + " " + updatedLSPatient.getLastname());
		}

    }


    public void resetPatientGroup(NewPatient Patient){
        log.info("search for patientID: {} , phone: {}, email: {} ",
                Patient.getPatientId(), Patient.getPhone(), Patient.getEmail() );

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
            log.info("LS - DashboardService - sending email to patientId for Resetting password for App: {}", Patient.getPatientId());
            emailService.sendEmail(Patient.getEmail(), Patient.getPatientId(), existinguser.getFirstname() + " " + existinguser.getLastname());
        }

    }


    public void deactivatePatient(NewPatient Patient){
        log.info("search for patientID: {} , phone: {}, email: {} ",
                Patient.getPatientId(), Patient.getPhone(), Patient.getEmail() );
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

}
