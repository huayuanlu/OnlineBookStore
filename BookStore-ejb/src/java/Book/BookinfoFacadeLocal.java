/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Book;

import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author X
 */
@Local
public interface BookinfoFacadeLocal {

    void create(Bookinfo bookinfo);

    void edit(Bookinfo bookinfo);

    void remove(Bookinfo bookinfo);

    Bookinfo find(Object id);

    List<Bookinfo> findAll();

    List<Bookinfo> findRange(int[] range);

    int count();
    
    List<Bookinfo> findByTitle(Object title);
    
    List<Bookinfo> SearchByTitle(Object title);
    
    Object findByISBN(Object ISBN);
}
