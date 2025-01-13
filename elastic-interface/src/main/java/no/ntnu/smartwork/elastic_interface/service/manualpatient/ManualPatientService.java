package no.ntnu.smartwork.elastic_interface.service.manualpatient;

import no.ntnu.smartwork.elastic_interface.model.ManualPatient;

import java.util.List;

public interface ManualPatientService {

    /**
     * Method to fetch a manually crafted patient from the database.
     * @return
     */
    public ManualPatient findByPatientId(String patientId);

    /**
     * Method to fetch all manually crafted patients from the database.
     * @return
     */
    public Iterable<ManualPatient> findAllManualPatients();

    /**
     * Method to save a manually crafted Patient data in the database.
     * @param manualPatient
     * @return
     */
    public ManualPatient saveManualPatient(ManualPatient manualPatient);

    /**
     * Method to update a manually crafted Patient data in the database.
     * @param manualPatient
     * @return
     */
    public ManualPatient updateManualPatient(ManualPatient manualPatient);

    /**
     * Method to save the collection of SmartWork manually crafted patient data in the database.
     * @param manualPatients
     * @return
     */
    public Iterable<ManualPatient> saveManualPatients(List<ManualPatient> manualPatients);







}

