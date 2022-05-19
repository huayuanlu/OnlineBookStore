/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package User;

import javax.ejb.Local;

/**
 *
 * @author X
 */
@Local
public interface UserLocal {

    String Find(String Username, String Password);

    String Find(String Username);
    
}
