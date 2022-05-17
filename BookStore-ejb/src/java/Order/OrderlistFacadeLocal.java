/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Order;

import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author X
 */
@Local
public interface OrderlistFacadeLocal {

    void create(Orderlist orderlist);

    void edit(Orderlist orderlist);

    void remove(Orderlist orderlist);

    Orderlist find(Object id);

    List<Orderlist> findAll();

    List<Orderlist> findRange(int[] range);

    int count();
    
    public void Insert(int OrderID, Long ISBN, String Title, int Num, String Username, double Cost ,String Date);
    
    public int GetMaxOrderID();

    List<Orderlist> FindAll();

    List<Orderlist> FindByUsername(Object Username);
}
