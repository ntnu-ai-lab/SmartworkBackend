package no.ntnu.smartwork.elastic_interface.service.cbrcase;

import no.ntnu.smartwork.elastic_interface.model.CbrCase;

import java.util.List;

public interface CbrCaseService {
    /**
     * Method to save the collection of SupportPrim patient data in the database.
     * @param cbrCases
     */
    public void saveCbrCases(List<CbrCase> cbrCases);

    /**
     * Method to fetch all SmartWork patient data from the database.
     * @return
     */
    public Iterable<CbrCase> findAllCbrCases();

    ///**
    // * Method to fetch the SupportPrim patient data on the basis of birthYear, journalId, and projectId.
    // * @param birthYear
    // * @param journalId
    // * @param projectId
    // * @return
    // */
    //public List<Patient> findByBirthYearAndJournalIdAndProjectId(Integer birthYear, Integer journalId, String projectId);
}

