/**
 * Author: Anuja Vats
 */

package no.ntnu.smartwork.data_management.util;

import org.springframework.http.HttpHeaders;

public class HttpHeaderGenerator {
    public static HttpHeaders getHeaders() {
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer" + "**generated token here**");
        headers.set("Content-Type", "application/json");
        headers.set("Accept", "application/json");
        //headers.set("user-roles", userRoles); // where userRoles= comma separated roles
        return headers;
    }
}
