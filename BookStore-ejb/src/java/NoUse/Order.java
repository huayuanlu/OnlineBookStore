/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package NoUse;

import Book.BookinfoFacadeLocal;
import Book.Bookinfo;
import Cart.CartLocal;
import Cart.Cart;
import javax.ejb.EJB;
import javax.ejb.Stateless;

/**
 *
 * @author X
 */
@Stateless
public class Order implements OrderLocal {
    @EJB
    private BookinfoFacadeLocal bookinfoFacade;
    @EJB
    private CartLocal cart;
    
    @Override
    public double Check(String Username) {
        double sum = 0;
        Cart c = cart.ShowCart(Username);
        for(int i=0;i<c.getISBN().size();i++){
            Bookinfo b = (Bookinfo)bookinfoFacade.findByISBN(c.getISBN().get(i));
            sum += b.getPrice() * c.getNum().get(i);
        }
        cart.DeleteAll(Username);
        return sum;
    }
    
}
