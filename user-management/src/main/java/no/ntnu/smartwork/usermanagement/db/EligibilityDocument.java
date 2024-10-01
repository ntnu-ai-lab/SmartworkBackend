package no.ntnu.smartwork.usermanagement.db;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;


/**Elasticsearch document for eligibility answers.
 * To allow term queries all answers have type Keyword. Values are yes/no
 *
 */
@Document(indexName = "eligibility")
//@Document(indexName = "eligibility")
@Builder(toBuilder = true)
@AllArgsConstructor
@Getter
public class EligibilityDocument {

    public final static String YES = "yes";
    public final static String NO = "no";

    @Id
    private String id;

    @Field
    private String patientId;

    @Field(type = FieldType.Keyword)
    private String InclusionAge;

    @Field(type = FieldType.Keyword)
    private String InclusionPain;

    @Field(type = FieldType.Keyword)
    private String InclusionDoctor;

    @Field(type = FieldType.Keyword)
    private String InclusionNorwegian;

    @Field(type = FieldType.Keyword)
    private String InclusionEmployer;

    @Field(type = FieldType.Keyword)
    private String InclusionSmartphone;

    @Field(type = FieldType.Keyword)
    private String InclusionPregnancy;

    @Field(type = FieldType.Keyword)
    private String InclusionSickleave;

}
