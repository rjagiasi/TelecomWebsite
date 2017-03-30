/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loginBeanPackage;

import java.util.ArrayList;
import javax.ejb.Local;

/**
 *
 * @author Shubham
 */
@Local
public interface LoginSessionBeanLocal {

    ArrayList<ArrayList<String>> checkLogin(String username, String password);
    
}
