/**
 * Author: Anuja Vats
 */

package no.ntnu.smartwork.data_management.service;


import no.ntnu.smartwork.data_management.util.HttpHeaderGenerator;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class TransformerService {

    private final Log log = LogFactory.getLog(getClass());

    @Qualifier("getRestTemplate")
    @Autowired
    private RestTemplate restTemplate;

    @Value("${transformer.post.jsonToJson.url}")
    private String transformerPostJsonToJsonUrl;

    @Value("${transformer.post.xmlToJson.url}")
    private String transformerPostXmlToJsonUrl;

    @Value("${transformer.post.jsonToCbrCase.url}")
    private String transformerPostJsonToCbrCase;

    @Value("${transformer.post.xmlToXml.url}")
    private String transformerPostXmlToXmlUrl;


    public String transformJsonToJson(String payload) {
        log.info("Transforming Json to Json");
        return performTransformation(payload, transformerPostJsonToJsonUrl);
    }

    public String transformJsonToCbr(String payload) {
        log.info("Transforming Json to CBR case");
        return performTransformation(payload, transformerPostJsonToCbrCase);
    }

    public String transformXmlToJson(String payload) {
        log.info("Transforming XML to JSON");
        log.info("PAYLOAD: " + payload);
        return performTransformation(payload, transformerPostXmlToJsonUrl);
    }

    public String transformXmlToXml(String payload) {
        log.info("Transforming XML to Xml");
        return performTransformationForXml(payload, transformerPostXmlToXmlUrl);
    }

    private String performTransformation(String payload, String transformerUrl) {
        String response = "null";

        HttpHeaders headers = HttpHeaderGenerator.getHeaders();
        headers.setContentType( MediaType.APPLICATION_JSON);
        HttpEntity<String> request = new HttpEntity<String>(payload, headers);
        log.info("Transporter-Service base URL: " + transformerUrl);
        log.debug("The post body for Transporter-Service is:" + payload);
        response = restTemplate.postForObject(transformerUrl, request, String.class);
        log.debug("Response from the transporter-service : " + response);

        return response;
    }

    private String performTransformationForXml(String payload, String transformerUrl) {
        String response = "null";

        HttpHeaders headers = HttpHeaderGenerator.getHeaders();
        headers.setContentType(MediaType.APPLICATION_XML);
        HttpEntity<String> request = new HttpEntity<String>(payload, headers);
        log.info("Transporter-Service base URL: " + transformerUrl);
        log.debug("The post body for Transporter-Service is:" + payload);
        response = restTemplate.postForObject(transformerUrl, request, String.class);
        log.debug("Response from the transporter-service : " + response);

        return response;
    }
}
