package models;

import play.data.validation.Unique;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Developer extends BaseModelWithKey {

    public static final String DEVELOPER = "DEVELOPER";

    public Developer(String username) {
        super(username, DEVELOPER);
    }
}
