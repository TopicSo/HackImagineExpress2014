package models;

import play.data.validation.Unique;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Business extends BaseModelWithKey {


    public static final String BUSINESS = "BUSINESS";

    public Business(String username) {
        super(username, BUSINESS);
    }
}
