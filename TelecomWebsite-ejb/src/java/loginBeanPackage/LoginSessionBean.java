/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loginBeanPackage;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;

/**
 *
 * @author Shubham
 */
@Stateless
public class LoginSessionBean implements LoginSessionBeanLocal {

    public ArrayList<ArrayList<String>> checkLogin(String username, String password) {
        try {
            DatabaseConn dc = new DatabaseConn();
            ArrayList result = dc.query("Select * from users where PhoneNo = '" + username + "' and Password = '" + password + "'");
            System.out.println(Arrays.deepToString(result.toArray()));
            if(result.size() == 1){
                return result;
            }
            return null;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginSessionBean.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LoginSessionBean.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
