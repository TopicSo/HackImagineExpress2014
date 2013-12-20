package models;

import play.data.validation.Unique;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Creativo extends BaseModelWithKey{


    public static final String CREATIVO = "CREATIVO";

    public Creativo(String username) {
        super(username, CREATIVO);
    }
}
