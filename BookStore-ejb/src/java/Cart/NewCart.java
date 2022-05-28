/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Cart;

import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import javax.ejb.Stateful;

/**
 *
 * @author X
 */
@Stateful
public class NewCart implements NewCartLocal {
    String Username;
    List<Integer> num;
    List<Integer> ISBN;
    
    public NewCart() {
    }

    public NewCart(String Username, List<Integer> num, List<Integer> ISBN) {
        this.Username = Username;
        this.num = num;
        this.ISBN = ISBN;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public List<Integer> getNum() {
        return num;
    }

    public void setNum(List<Integer> num) {
        this.num = num;
    }

    public List<Integer> getISBN() {
        return ISBN;
    }

    public void setISBN(List<Integer> ISBN) {
        this.ISBN = ISBN;
    }

    
    @Override
    public NewCart ShowCart(String Username) {
        List<Integer> num = new LinkedList<>();
        List<Integer> ISBN = new LinkedList<>();
        NewCart UserCart = new NewCart(Username,num,ISBN);
        UserCart.setUsername(Username);
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            java.sql.Statement st;
            try (java.sql.Connection conn = java.sql.DriverManager.getConnection("jdbc:derby://localhost:1527/NewBookStore", "app", "app")) {
                st = conn.createStatement();
                java.sql.ResultSet rs = st.executeQuery("select ISBN,Num from Cart where Username = '" + Username + "'");
                while(rs.next()){
                    UserCart.getISBN().add(rs.getInt(1));
                    UserCart.getNum().add(rs.getInt(2));
                }
            }
            st.close();
            return UserCart;
        }
        catch(SQLException | ClassNotFoundException e){}
        return null;
    }

    @Override
    public void AddCart(String Username, int ISBN, int num) {
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            java.sql.Statement st;
            try (java.sql.Connection conn = java.sql.DriverManager.getConnection("jdbc:derby://localhost:1527/NewBookStore", "app", "app")) {
                st = conn.createStatement();
                st.execute("insert into Cart values(" + ISBN + ",'" + Username + "'," + num + ")");
            }
            st.close();
        }
        catch(SQLException | ClassNotFoundException e){}
    }

    @Override
    public void DeleteCart(String Username, int ISBN) {
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            java.sql.Statement st;
            try (java.sql.Connection conn = java.sql.DriverManager.getConnection("jdbc:derby://localhost:1527/NewBookStore", "app", "app")) {
                st = conn.createStatement();
                st.execute("delete from Cart where ISBN = " + ISBN + "and Username = '" + Username + "'");
            }
            st.close();
        }
        catch(SQLException | ClassNotFoundException e){}
    }

    @Override
    public void DeleteAll(String Username) {
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            java.sql.Statement st;
            try (java.sql.Connection conn = java.sql.DriverManager.getConnection("jdbc:derby://localhost:1527/NewBookStore", "app", "app")) {
                st = conn.createStatement();
                st.execute("delete from Cart where Username = '" + Username + "'");
            }
            st.close();
        }
        catch(SQLException | ClassNotFoundException e){}
    }

}
