/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loginBeanPackage;

import javax.ejb.Stateless;

/**
 *
 * @author Shubham
 */
@Stateless
public class LoginSessionBean implements LoginSessionBeanLocal {

    @Override
    public Boolean checkLogin(String username, String password) {
        if(username.equals("rohan") && password.equals("jagiasi")){
            return true;
        }
        return false;
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
