package no.ntnu.smartwork.limesurvey.db;


import org.springframework.data.repository.CrudRepository;

import java.util.Date;
import java.util.List;
import java.util.Optional;

public interface LSQuestionnaireRepository extends CrudRepository<LSQuestionnaireEntity, String> {
    public List<LSQuestionnaireEntity> findAllByCompletedDateBetween(Date from, Date to);

    public List<LSQuestionnaireEntity> findAllByTypeAndCompletedDateAndLastReminderBefore(String type, Date completed, Date waitingPeriod);

    public Optional<LSQuestionnaireEntity> findByPatientIdAndType(String patientId, String type);

    public List<LSQuestionnaireEntity> findAllByTokenIdIn(String... tokenId);
}

