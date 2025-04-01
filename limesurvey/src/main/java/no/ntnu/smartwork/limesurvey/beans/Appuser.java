/**
 * Author: Anuja Vats
 */

package no.ntnu.smartwork.limesurvey.beans;

import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * Model class for user credentials
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Appuser {
    private String username;
    @Size(min = 8, message = "Password must be at least 8 characters long")
    private String password;
}