/**
 * Author: Anuja Vats
 */

package no.ntnu.smartwork.data_management.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import jakarta.validation.constraints.NotNull;

public class PatientIdGenerator {

    private static final Log LOG = LogFactory.getLog(PatientIdGenerator.class.getName());

    /**
     * Patient ID generator. Currently it is based on Infopad's attribute values as listed below.
     * The ID is generated by concatenating the ordered attribute list,
     * [projectId, journalId, and birthYear], separated by "-" respectively.
     *
     * @param projectId
     * @param journalId
     * @param birthYear
     * @return
     */
    public static String generateId(String projectId, String journalId, String birthYear) {

        String patientId = projectId + "-" + journalId + "-" + birthYear;
        LOG.debug("Patient id : " + patientId);

        return patientId;
    }

    public static String generatePid(@NotNull String journalId, @NotNull String birthYear) {

        String patientId = journalId + "_" + birthYear;
        LOG.debug("Patient id : " + patientId);

        return patientId;
    }
}
