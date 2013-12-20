package models;

import java.util.Date;

import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

import play.data.validation.Required;
import play.db.jpa.GenericModel;
import play.db.jpa.JPABase;

@MappedSuperclass
public abstract class BaseModel extends GenericModel {

    @Required
    public long new_created;

    @Required
    public long new_updated;

    @Transient
    public static final int NO_LIMIT_PAGINATION			= -1;

    @Transient
    public static final int DEFAULT_RECS_PER_PAGE		= 20;
    
    public BaseModel() {
        this.new_created = new Date().getTime();
        this.new_updated = new Date().getTime();
    }

    @Override
    public <T extends JPABase> T save() {

        new_updated = new Date().getTime();

        return super.save();
    }
}
