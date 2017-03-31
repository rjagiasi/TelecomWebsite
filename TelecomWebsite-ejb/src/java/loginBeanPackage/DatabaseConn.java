/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loginBeanPackage;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author rohan
 */
public class DatabaseConn {

    public ArrayList query(String queryString) throws ClassNotFoundException, SQLException {

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/telecom", "root", "");

        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(queryString);
        ArrayList<ArrayList<String>> table = null;

        int nCol = rs.getMetaData().getColumnCount();
        table = new ArrayList<>();
        while (rs.next()) {
            ArrayList<String> row = new ArrayList<>();
            for (int iCol = 1; iCol <= nCol; iCol++) {
                Object obj = rs.getObject(iCol);
                row.add(iCol - 1, (obj == null) ? null : obj.toString());
            }
            table.add(row);
        }

        con.close();
        System.out.println(Arrays.deepToString(table.toArray()));
        return table;
    }
    
    public int updatequery(String queryString) throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/telecom", "root", "");

        Statement stmt = con.createStatement();
        int result = stmt.executeUpdate(queryString);
        
        return result;
    }

}
