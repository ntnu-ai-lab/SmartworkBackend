package no.ntnu.smartwork.elastic_interface.controller;


import no.ntnu.smartwork.elastic_interface.model.CbrCase;
import no.ntnu.smartwork.elastic_interface.service.cbrcase.CbrCaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author: Amar Jaiswal, Anuja Vats
 */
@RestController
@RequestMapping(value= "/cbrCases")
public class CbrCaseController {
    @Autowired
    CbrCaseService cbrCaseService;

    /**
     * Method to save the CBR cases in the database.
     * @param cbrCases
     * @return
     */
    @PostMapping(value= "/saveCbrCase")
    public String savePatientXmls(@RequestBody List<CbrCase> cbrCases) {
        cbrCaseService.saveCbrCases(cbrCases);
        return "Patient data saved in the db.";
    }

    /**
     * Method to fetch all CBR cases from the database.
     * @return
     */
    @GetMapping(value= "")
    public Iterable<CbrCase> getAllPatientXml() {
        return cbrCaseService.findAllCbrCases();
    }
}
