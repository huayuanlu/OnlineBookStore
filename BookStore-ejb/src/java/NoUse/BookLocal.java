/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package NoUse;

import java.util.LinkedList;
import javax.ejb.Local;

/**
 *
 * @author X
 */
@Local
public interface BookLocal {

    LinkedList<Book> SearchBook(String name);

    Book Getbook(int Bookid);

    
}
