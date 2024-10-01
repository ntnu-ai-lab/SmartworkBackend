package no.ntnu.smartwork.usermanagement.db;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.encrypt.TextEncryptor;

import javax.crypto.NoSuchPaddingException;
import jakarta.persistence.AttributeConverter;
import java.security.NoSuchAlgorithmException;

/**
 * Mark entities field to encrypt them on writing to the database. Takes care of decryption also.
 * Usage example:
 * <pre>{@code
 * @Entity
 * public class SomeEntity {
 *   ...
 *   @Convert(converter = AttributeEncryptor.class)
 *   private String someField;
 * }
 * </pre>
 */
@Configuration
@Slf4j
public class AttributeEncryptor implements AttributeConverter<String, String> {

    private final TextEncryptor textEncryptor;
    private String password;
    private String salt;

    public AttributeEncryptor(@Value("${spring.jpa.field-encryption.password}")String password, @Value("${spring.jpa.field-encryption.salt}")String salt) throws NoSuchPaddingException, NoSuchAlgorithmException {
        this.password = password;
        this.salt = salt;
        textEncryptor = Encryptors.text(this.password, this.salt);
    }

    @Override
    public String convertToDatabaseColumn(String attribute) {
        return textEncryptor.encrypt(attribute);
    }

    @Override
    public String convertToEntityAttribute(String dbData) {
        return textEncryptor.decrypt(dbData);
    }
}