package no.ntnu.smartwork.limesurvey.db;

import org.springframework.data.repository.CrudRepository;

public interface LSPatientInfoRepository extends CrudRepository<LSPatientInfoEntity, String> {
    LSPatientInfoEntity findByPatientId(String patientId);

    LSPatientInfoEntity findByPhone(String phone);

    LSPatientInfoEntity findByEmail(String email);
}
