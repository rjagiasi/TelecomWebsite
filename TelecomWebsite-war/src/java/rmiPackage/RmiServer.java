/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rmiPackage;

import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import loginBeanPackage.DatabaseConn;

/**
 *
 * @author rohan
 */
public class RmiServer implements RmiInterface {

    

    @Override
    public Boolean store_form(String query_string) {
        
        DatabaseConn dc = new DatabaseConn();
        System.out.println(query_string);
        
        try {
            int a = dc.updatequery(query_string);
            return true;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RmiServer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(RmiServer.class.getName()).log(Level.SEVERE, null, ex);
        }
                
        return false;
    }
    
    public static void main(String[] args) {
        try {
            RmiServer obj = new RmiServer();
            RmiInterface stub = (RmiInterface) UnicastRemoteObject.exportObject(obj, 0);

            // Bind the remote object's stub in the registry
            Registry registry = LocateRegistry.createRegistry(1099);
            registry.bind("telecom_obj", stub);

            System.out.println("Server ready");
        } catch (Exception e) {
            System.err.println("Server exception: " + e.toString());
            e.printStackTrace();
            System.exit(1);
        }
    }
}
