package no.ntnu.smartwork.elastic_interface.service.cbrcase;

import no.ntnu.smartwork.elastic_interface.model.CbrCase;

import java.util.List;

public interface CbrCaseService {
    /**
     * Method to save the collection of SmartWork patient data in the database.
     *
     * @param cbrCases
     */
    public void saveCbrCases(List<CbrCase> cbrCases);

    /**
     * Method to fetch all SmartWork patient data from the database.
     *
     * @return
     */
    public Iterable<CbrCase> findAllCbrCases();
}

