package no.ntnu.smartwork.elastic_interface.service.patientxml;

import no.ntnu.smartwork.elastic_interface.common.Constants;
import no.ntnu.smartwork.elastic_interface.model.PatientXml;
import no.ntnu.smartwork.elastic_interface.repository.PatientXmlRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
public class PatientXmlServiceImpl implements PatientXmlService {
    // The dao repository will use the Elastic-Search-Repository to perform the database operations.
    @Autowired
    private PatientXmlRepository patientXmlDao;

    /* (non-Javadoc)
     * @see no.ntnu.supportprim.elastic.service.patientXml.PatientXmlService#savePatientXml(java.util.List)
     */
    @Override
    public PatientXml savePatientXml(PatientXml patient) {
        patient.setDateUpdated(OffsetDateTime.now().format(DateTimeFormatter.ofPattern(Constants.DATE_PATTERN)));
        return patientXmlDao.save(patient);
    }

    /* (non-Javadoc)
     * @see no.ntnu.supportprim.elastic.service.patientXml.PatientXmlService#savePatientXmls(java.util.List)
     */
    @Override
    public Iterable<PatientXml> savePatientXmls(List<PatientXml> patientXmls) {
        for (PatientXml patient: patientXmls)
            patient.setDateUpdated(OffsetDateTime.now().format(DateTimeFormatter.ofPattern(Constants.DATE_PATTERN)));
        return patientXmlDao.saveAll(patientXmls);
    }

    /* (non-Javadoc)
     * @see no.ntnu.supportprim.elastic.service.patientXml.PatientXmlService#findAllPatientXmls()
     */
    @Override
    public Iterable<PatientXml> findAllPatientXmls() {
        return patientXmlDao.findAll();
    }
}
