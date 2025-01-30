/**
 * Author: Anuja Vats
 */

package no.ntnu.smartwork.data_management.controller;

import no.ntnu.smartwork.data_management.service.ElasticService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/elastic")
public class ElasticController {
    private final Log log = LogFactory.getLog(getClass());

    @Autowired
    private ElasticService elasticService;

    @GetMapping("/")
    public String health() {
        return "I am Ok!";
    }

}

