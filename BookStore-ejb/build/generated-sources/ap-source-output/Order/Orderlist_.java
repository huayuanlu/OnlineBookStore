package Order;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.1.v20130918-rNA", date="2022-05-15T19:42:30")
@StaticMetamodel(Orderlist.class)
public class Orderlist_ { 

    public static volatile SingularAttribute<Orderlist, Double> cost;
    public static volatile SingularAttribute<Orderlist, Integer> orderid;
    public static volatile SingularAttribute<Orderlist, Integer> isbn;
    public static volatile SingularAttribute<Orderlist, Date> time;
    public static volatile SingularAttribute<Orderlist, String> title;
    public static volatile SingularAttribute<Orderlist, Integer> cartnum;
    public static volatile SingularAttribute<Orderlist, String> username;

}