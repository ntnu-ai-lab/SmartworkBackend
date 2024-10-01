package no.ntnu.smartwork.elastic_interface.model;

import io.swagger.v3.oas.annotations.media.Schema;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.stereotype.Component;


@Component
@Document(indexName = "cbr_cases")
public class CbrCase {

    @Schema(description="Case ID", required = true)
    private String id;

    private String caze;

    public CbrCase(){}

    public CbrCase(String id, String cbrCase) {
        this.id = id;
        this.caze = cbrCase;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCaze() {
        return caze;
    }

    public void setCaze(String cbrCase) {
        this.caze = cbrCase;
    }

    @Override
    public String toString() {
        return "CbrCase{" +
                "id='" + id + '\'' +
                "cbrCase='" + caze + '\'' +
                '}';
    }
}


