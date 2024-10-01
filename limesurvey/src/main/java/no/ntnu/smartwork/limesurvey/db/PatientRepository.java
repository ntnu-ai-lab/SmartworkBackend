package no.ntnu.smartwork.limesurvey.db;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PatientRepository extends CrudRepository<PatientEntity, String > {

    PatientEntity findByEmail(String email);

    PatientEntity findByPhone(String phone);

    PatientEntity findByPatientId(String patientId);

    PatientEntity findByNavId(String navId);
}