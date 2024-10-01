package no.ntnu.smartwork.elastic_interface.service.patient;


import no.ntnu.smartwork.elastic_interface.model.Patient;

import java.util.List;

public interface PatientService {

    /**
     * Method to fetch a patient from the database.
     * @return
     */
    public Patient findByPatientId(String patientId);


    /**
     * Method to fetch a patient from the database.
     * @return
     */
    public Patient findByQuestionnaireType(String questionnaireType);


    /**
     * Method to fetch all patients from the database.
     * @return
     */
    public List<Patient> findAllPatients();

    /**
     * Method to save a SupportPrim patient data in the database.
     * @param patient
     * @return
     */
    public Patient savePatient(Patient patient);

    /**
     * Method to update a Patient data in the database.
     * @param patient
     * @return
     */
    public Patient updatePatient(Patient patient);

    /**
     * Method to save the collection of SupportPrim patient data in the database.
     * @param patients
     * @return
     */
    public Iterable<Patient> savePatients(List<Patient> patients);

}

