/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package NoUse;
import java.util.LinkedList;
import javax.ejb.Stateless;

/**
 *
 * @author X
 */
@Stateless
public class Book implements BookLocal {
    int Bookid;
    String Name;
    String Writer;
    int Price;
    int Num;

    public int getBookid() {
        return Bookid;
    }

    public void setBookid(int Bookid) {
        this.Bookid = Bookid;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getWriter() {
        return Writer;
    }

    public void setWriter(String Writer) {
        this.Writer = Writer;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public int getNum() {
        return Num;
    }

    public void setNum(int Num) {
        this.Num = Num;
    }

    public Book() {
    }

    public Book(int Bookid, String Name, String Writer, int Price, int Num) {
        this.Bookid = Bookid;
        this.Name = Name;
        this.Writer = Writer;
        this.Price = Price;
        this.Num = Num;
    }
    
    
    @Override
    public LinkedList<Book> SearchBook(String name) {
        LinkedList<Book> b = new LinkedList();
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
            java.sql.Connection conn =	java.sql.DriverManager.getConnection("jdbc:derby://localhost:1527/BookStore", "app", "app");
            java.sql.Statement st = conn.createStatement();
            java.sql.ResultSet rs = st.executeQuery("select Bookid from Book where Name like '%" + name + "%'"); 
            while(rs.next()){
                b.add(Getbook(rs.getInt(1)));
            }  
            conn.close();
            st.close();
        }
        catch(Exception e){}
        return b;
    }

    /**
     *
     * @param Bookid
     * @return
     */
    @Override
    public Book Getbook(int Bookid) {
        Book mybook = new Book();
        try{ 
            Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
            java.sql.Connection conn =	java.sql.DriverManager.getConnection("jdbc:derby://localhost:1527/BookStore", "app", "app");
            java.sql.Statement st = conn.createStatement();
            java.sql.ResultSet rs = st.executeQuery("select * from Book where Bookid =" + Bookid);
            if(rs.next()){
                mybook.setBookid(Bookid);
                mybook.setName(rs.getString(2));
                mybook.setWriter(rs.getString(3));
                mybook.setPrice(rs.getInt(4));
                mybook.setNum(rs.getInt(5));
            } 
            conn.close();
            st.close();
        }
        catch(Exception e){}
        return mybook;
    }

         

}
