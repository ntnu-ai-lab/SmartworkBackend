package no.ntnu.smartwork.limesurvey.beans;


import com.fasterxml.jackson.annotation.*;
import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * The LimeSurvey RPC API response for {@literal get_participant_properties} method.
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
        "usesleft",
        "completed",
        "tid",
        "participant_id",
        "firstname",
        "lastname",
        "email",
        "emailstatus",
        "token",
        "language",
        "blacklisted",
        "sent",
        "remindersent",
        "remindercount",
        "validfrom",
        "validuntil",
        "mpid",
        "attribute_1"
})
@Getter
@Setter
public class ParticipantPropertiesBean {

    @JsonProperty("usesleft")
    private String usesleft;
    @JsonProperty("completed")
    private String completed;
    @JsonProperty("tid")
    private String tid;
    @JsonProperty("participant_id")
    private String participantId;
    @JsonProperty("firstname")
    private String firstname;
    @JsonProperty("lastname")
    private String lastname;
    @JsonProperty("email")
    private String email;
    @JsonProperty("emailstatus")
    private String emailstatus;
    @JsonProperty("token")
    private String token;
    @JsonProperty("language")
    private String language;
    @JsonProperty("blacklisted")
    private String blacklisted;
    @JsonProperty("sent")
    private String sent;
    @JsonProperty("remindersent")
    private String remindersent;
    @JsonProperty("remindercount")
    private String remindercount;
    @JsonProperty("validfrom")
    private String validfrom;
    @JsonProperty("validuntil")
    private String validuntil;
    @JsonProperty("mpid")
    private String mpid;
    @JsonProperty("attribute_1")
    private String attribute1;
    @JsonIgnore
    private Map<String, String> additionalProperties = new HashMap<String, String>();

    @JsonAnyGetter
    public Map<String, String> getAdditionalProperties() {
        return this.additionalProperties;
    }

    @JsonAnySetter
    public void setAdditionalProperty(String name, String value) {
        this.additionalProperties.put(name, value);
    }


    @JsonIgnore
    public boolean isCompleted() {
        return StringUtils.isNotBlank(completed) && !"N".equals(completed);
    }
}
