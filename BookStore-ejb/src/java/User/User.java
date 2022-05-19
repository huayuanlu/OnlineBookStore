/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package User;

import javax.ejb.Stateless;

/**
 *
 * @author X
 */
@Stateless
public class User implements UserLocal {
    String Username;
    String Password;

    @Override
    public String Find(String Username, String Password) {
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
            java.sql.Connection conn =	java.sql.DriverManager.getConnection("jdbc:derby://localhost:1527/BookStore", "app", "app");
            java.sql.Statement st = conn.createStatement();
            java.sql.ResultSet rs = st.executeQuery("select * from Login where username= '" + Username + "' and password='" + Password + "'");
            if(rs.next())   return Username;
            else return null;
        }
        catch(Exception e){}
        return null;
    }


    @Override
    public String Find(String Username) {
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
            java.sql.Connection conn =	java.sql.DriverManager.getConnection("jdbc:derby://localhost:1527/BookStore", "app", "app");
            java.sql.Statement st = conn.createStatement();
            java.sql.ResultSet rs = st.executeQuery("select * from Login where username= '" + Username + "'");
            if(rs.next())   return Username;
            else return null;
        }
        catch(Exception e){}
        return null;
    }
}
