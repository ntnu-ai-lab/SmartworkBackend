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

    public List<LSPatientInfoEntity> getAllPatientInfo() {
        return (List<LSPatientInfoEntity>) lsPatientInfoRepository.findAll();
    }

    public void setPatientGroup(NewPatient Patient){
        log.info("search for patientID: {} , phone: {}, email: {} ",
                Patient.getPatientId(), Patient.getPhone(), Patient.getEmail() );

        //PatientEntity existingEmail = patientRepository.findByEmail(Patient.getEmail());
        //PatientEntity existingPhone = patientRepository.findByPhone(Patient.getPhone());
        PatientEntity existingUser = patientRepository.findByPatientId(Patient.getPatientId());

        if (existingUser == null) {
            log.info("user exists: " + existingUser.getPatientId());
            throw new IllegalStateException("Could not find this Username.");
        }
        /*
        if (patientRepository.findByEmail(Patient.getEmail()) == null) {
            log.info("email exists: {} for user {}" , existingEmail.getEmail(), existingEmail.getPatientId());
            throw new IllegalStateException("Could not find this email.");
        }
        if (existingPhone == null) {
            log.info("phone exists: {} for user {}" , existingPhone.getPhone(), existingPhone.getPatientId());
            throw new IllegalStateException("Could not find this phone number.");
        }

         */
        final PatientEntity existingPatient = patientRepository.findByPatientId(Patient.getPatientId());
        final PatientEntity updatedPatient = existingPatient.toBuilder()
                                            .rctGroup(Patient.getRctGroup())
                                            .build();
        patientRepository.save(updatedPatient);

        //LSPatientInfoEntity existingmail = lsPatientInfoRepository.findByEmail(Patient.getEmail());
        //LSPatientInfoEntity existingphone = lsPatientInfoRepository.findByPhone(Patient.getPhone());
        LSPatientInfoEntity existinguser = lsPatientInfoRepository.findByPatientId(Patient.getPatientId());

        if (existinguser == null) {
            log.info("user exists: " + existinguser.getPatientId());
            throw new IllegalStateException("Could not find this Username.");
        }
        /*
        if (existingmail == null) {
            log.info("email exists: {} for user {}" , existingEmail.getEmail(), existingEmail.getPatientId());
            throw new IllegalStateException("Could not find this email.");
        }
        if (existingphone == null) {
            log.info("phone exists: {} for user {}" , existingphone.getPhone(), existingphone.getPatientId());
            throw new IllegalStateException("Could not find this phone number.");
        }

         */
        final LSPatientInfoEntity existingLSPatient = lsPatientInfoRepository.findByPatientId(Patient.getPatientId());
        final LSPatientInfoEntity updatedLSPatient = existingLSPatient.toBuilder()
                                                        .rctGroup(Patient.getRctGroup())
                                                        .build();
        lsPatientInfoRepository.save(updatedLSPatient);

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
