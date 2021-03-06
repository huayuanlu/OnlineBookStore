/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Order;

import java.util.List;
import java.sql.SQLException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author X
 */
@Stateless
public class OrderlistFacade extends AbstractFacade<Orderlist> implements OrderlistFacadeLocal {
    @PersistenceContext(unitName = "BookStore-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OrderlistFacade() {
        super(Orderlist.class);
    }
    
    @Override
    public void Insert(int OrderID, Long ISBN, String Title, int Num, String Username, double Cost, String Date) {
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            java.sql.Statement st;
            try (java.sql.Connection conn = java.sql.DriverManager.getConnection("jdbc:derby://localhost:1527/NewBookStore", "app", "app")) {
                st = conn.createStatement();
                st.execute("insert into Orderlist values(" + OrderID + "," + ISBN + ",'" + Title + "'," +"'" + Username + "'," + Num + ","
                        + Cost + ",'" + Date + "')" );
            }
            st.close();
        }
        catch(ClassNotFoundException | SQLException e){}
    }

    @Override
    public int GetMaxOrderID(){
         try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            java.sql.Statement st;
             int res;
             try (java.sql.Connection conn = java.sql.DriverManager.getConnection("jdbc:derby://localhost:1527/NewBookStore", "app", "app")) {
                 st = conn.createStatement();
                 java.sql.ResultSet rs = st.executeQuery("Select MAX(Orderid) from Orderlist");
                 rs.next();
                 res = rs.getInt(1)+1;
             }
            st.close();
            return res;
        }
        catch(SQLException | ClassNotFoundException e){}
        return 0;
    }

    @Override
    public List<Orderlist> FindAll() {
        return em.createNamedQuery("Orderlist.findAll").getResultList();
    }


    @Override
    public List<Orderlist> FindByUsername(Object Username) {
        return em.createNamedQuery("Orderlist.findByUsername").setParameter("username",Username).getResultList();
    }
    
}
