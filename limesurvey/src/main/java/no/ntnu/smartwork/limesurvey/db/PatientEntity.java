package no.ntnu.smartwork.limesurvey.db;


import jakarta.persistence.*;
import lombok.*;

/***/
@Entity
@Table(name = "Patient")
@Getter
@Setter
@Builder(toBuilder = true)
@NoArgsConstructor
@AllArgsConstructor
public class PatientEntity {
    @Id
    @Column(length = 20)
    private String patientId;
    @Convert(converter = AttributeEncryptor.class)
    @Column(length = 1000)	//larger length since it is encrypted
    private String email;
    @Convert(converter = AttributeEncryptor.class)
    private String phone;
    private String navId;
    private String rctGroup = null;



}






