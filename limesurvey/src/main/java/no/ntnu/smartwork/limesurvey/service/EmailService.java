package no.ntnu.smartwork.limesurvey.service;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

    @Autowired
    private TokenService tokenService;

    @Value("${PASSWORD_RESET_URL}")
    private String passwordResetLink;

    void sendEmail(String emailAdd, String patientID, String patientName ) {

        log.info("Sending email to: {} - patientID: {} - patientName: {}", emailAdd, patientID, patientName);

        // Generate secure token that expires after 3 weeks
        String token = tokenService.generateToken(patientID);

        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setTo(emailAdd);
        msg.setFrom("survey@smartwork.no");

        msg.setSubject("Research project SmaRTWork – NTNU ");
        msg.setText("Hei, " + patientName  +
                "\n\nDu er trukket ut til intervensjonsgruppen i SmaRTWork prosjektet. " +
                "\n\nDet betyr at du får tilgang til SmaRTWork appen. Slik kommer du i gang: "+
                "\n\nAppen laster du ned via [sett inn ]."+
                "\n\nBrukernavnet ditt er : "+patientID +
                "\n\nVennligst opprett et passord her: "+ passwordResetLink + "?token=" + token +
                "\nBeskrivelse og video om hvordan du installerer appen finner du på prosjektets hjemmeside" +
                " https://www.smartwork.no/teknisk-hjelp/"+
                "\n\nHvis du har spørsmål, kan du svare på denne e-posten."+
                "\n\n\nVennlig hilsen "+
                "\n\n\nSmaRTWork: https://www.smartwork.no/"+
                "\nNTNU");

        javaMailSender.send(msg);

        log.info("Sent to: {} ", emailAdd);
    }


    void sendControlEmail(String emailAdd, String patientID, String patientName ) {

        log.info("Sending email to: {} - patientID: {} - patientName: {}", emailAdd, patientID, patientName);

        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setTo(emailAdd);
        msg.setFrom("survey@smartwork.no");

        msg.setSubject("Research project SmaRTWork – NTNU ");
        msg.setText("Hei, " + patientName +
                "\n\nDu er trukket ut til kontrollgruppen i SmaRTWork prosjektet. " +
                "\n\n Det betyr at du fortsetter med den vanlige oppfølgingen som du har hos fastlege, NAV og eventuelt annet helsepersonell.  "+
                "\n\nVi setter stor pris på at du ønsker å delta i SmaRTWork prosjektet."+
                "\n\nDu vil motta spørreskjema fra studien etter 3, 6 og 12 måneder.  " +
                "\nSelv om du er i kontrollgruppen er det like viktig at du besvarer disse skjemaene." +
                "\nDu får en epost med lenke til spørreskjema når det nærmer seg. "+
                "\n\nHvis du har spørsmål, kan du svare på denne e-posten."+
                "\n\n\nVennlig hilsen "+
                "\n\n\nSmaRTWork: https://www.smartwork.no/"+
                "\nNTNU");

        javaMailSender.send(msg);

        log.info("Sent to: {} ", emailAdd);
    }
}

