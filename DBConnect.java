
package dbms.project;

import java.io.*;
import java.sql.*;

public class DBConnect {
    
    public static Connection establishConnection() throws ClassNotFoundException, SQLException
    {
        Connection con = null;
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/projectdb";
            con = (Connection) DriverManager.getConnection(url, "root", "yaalimadad110");
        }
        
        catch(SQLException ex)
        {
            System.out.println("Message: " + ex.getMessage());
            ex.printStackTrace();
        }
        
        return con;
    }
    
    
    
    
}
