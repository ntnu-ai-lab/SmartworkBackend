/**
 * Author: Anuja Vats
 */

package no.ntnu.smartwork.data_management.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/mapping")
public class MappingController {
    private final Log log = LogFactory.getLog(getClass());


    @GetMapping("/")
    public String health() {
        return "I am Ok!";
    }
}
