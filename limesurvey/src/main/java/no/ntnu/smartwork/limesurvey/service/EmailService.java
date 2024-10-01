package no.ntnu.smartwork.limesurvey.service;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

/**
 * Manages e-Mails from the system .
 */
@Service
@Slf4j
public class EmailService {

    @Autowired
    private JavaMailSender javaMailSender;

    void sendEmail(String emailAdd, String patientID, String patientName ) {

        log.info("Sending email to: {} - patientID: {} - patientName: {}", emailAdd, patientID, patientName);
        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setTo(emailAdd);
        msg.setFrom("smartwork@idi.ntnu.no");

        msg.setSubject("Ny deltager i Smartwork studien " + patientName + " ("+patientID+")");
        msg.setText("Hei, \n\nEn ny pasient har fylt inn data i Smartwork studien:" +
                "\n\nBrukernavn: "+patientID+" Navn: " + patientName +
                "\n\nKlikk her for å slå opp pasienten i Smartwork verktøyet:"+
                "\nhttps://supportprim-fastlege.idi.ntnu.no/"+
                "\n\nHar du noen spørsmål ta kontakt med support: smartwork@idi.ntnu.no / 484 80 211"+
                "\n\n\nVennlig hilsen "+
                "\n\n\nSupportPrim studien: https://www.ntnu.no/supportprim"+
                "\n\nInstitutt for samfunnsmedisin og sykepleie"+
                "\nFakultet for medisin og helsevitenskap, NTNU");

        javaMailSender.send(msg);

        log.info("Sent to: {} ", emailAdd);
    }
}

