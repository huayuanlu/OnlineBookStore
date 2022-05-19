package Book;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2022-05-19T10:37:00")
@StaticMetamodel(Bookinfo.class)
public class Bookinfo_ { 

    public static volatile SingularAttribute<Bookinfo, String> author;
    public static volatile SingularAttribute<Bookinfo, Double> price;
    public static volatile SingularAttribute<Bookinfo, Long> isbn;
    public static volatile SingularAttribute<Bookinfo, String> title;
    public static volatile SingularAttribute<Bookinfo, String> press;

}