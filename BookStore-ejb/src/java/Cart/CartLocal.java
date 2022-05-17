/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Cart;

import javax.ejb.Local;

/**
 *
 * @author X
 */
@Local
public interface CartLocal {

    Cart ShowCart(String Username);

    void AddCart(String Username, int ISBN, int num);

    void DeleteCart(String Username, int ISBN);

    void DeleteAll(String Username);
    
}
