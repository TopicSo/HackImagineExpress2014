package controllers;

import play.*;
import play.mvc.*;

import java.util.*;

import models.*;

public class Application extends Controller {

    public static void index() {

        for(int i =0; i<12 ; i++)
        {
            new Developer("D" + i).save();
            new Creativo("C" + i).save();
            new Business("B" + i).save();
        }
        render();
    }

    public static void getRank(){
        List<Creativo> creativos = Creativo.find("rank <> 0 order by rank desc").fetch();
        List<Business> business = Business.find("rank <> 0 order by rank desc").fetch();

        render(creativos, business);
    }

    public static void getNexts(){

        List<Creativo> creativos = Creativo.find("rank = 0").fetch();
        List<Business> business = Business.find("rank = 0").fetch();

        render(creativos, business);
    }

    public static void postDate(String code, String userId, int rank){
        Logger.info(code);
        Logger.info(userId);
        Logger.info("" + rank);
        if (code.equals(Business.BUSINESS)){
            Business b = Business.findById(userId);
            b.rank = rank;
            b.save();
        }
        else if (code.equals(Developer.DEVELOPER)){
            Developer d = Developer.findById(userId);
            d.rank = rank;
            d.save();
        }
        else if (code.equals(Creativo.CREATIVO)){
            Creativo c = Creativo.findById(userId);
            c.rank = rank;
            c.save();
        }

        render();
    }

    public static void getResult(){


    }
}