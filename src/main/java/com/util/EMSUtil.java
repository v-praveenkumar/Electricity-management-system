package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EMSUtil {
  
//      private static final String URL = "jdbc:derby:C:\\Users\\2824553\\MyDB;create=true";
      private static final String URL = "jdbc:derby:C:\\Users\\SATHISH\\MyDB;create=true";

      public static Connection createConnection() throws SQLException, ClassNotFoundException {
    	  Class.forName("org.apache.derby.jdbc.EmbeddedDriver"); 
          Connection cn = DriverManager.getConnection(URL);
          return cn;
      }
      
      public static void getConnectionClosed(PreparedStatement ps, Connection cn, ResultSet rs) throws SQLException {
         if(rs!=null) {
           rs.close();
         }
         if(ps!=null) {
           ps.close();
         }
         if(cn!=null) {
           cn.close();
         }
      }

}