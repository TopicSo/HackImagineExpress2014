package models;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import org.hibernate.annotations.GenericGenerator;

@MappedSuperclass
public abstract class BaseModelWithKey extends BaseModel {

    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid2")
    public String id;

    public String code;

    public String username;

    public String avatar;

    public int rank;

    public BaseModelWithKey(String username, String code) {
        super();

        this.code = code;
        this.username = username;
        this.rank = 0;
    }


    public static List<? extends BaseModelWithKey> sortResultsAccordingToIds(List<? extends BaseModelWithKey> results, final List<String> ids) {

        Collections.sort(results, new Comparator<BaseModelWithKey>() {	

            @Override
            public int compare(BaseModelWithKey model1, BaseModelWithKey model2) {

                Integer position1 = ids.indexOf(model1.id);
                Integer position2 = ids.indexOf(model2.id);

                return position1.compareTo(position2);
            }
        });

        return results;
    }
}
