package com.dao; 
 
import java.sql.*;
import java.util.ArrayList;
//import java.security.MessageDigest; 
//import java.security.NoSuchAlgorithmException; 
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import com.bean.AdminConsumer;
import com.bean.AdminCustomer; 
import com.util.EMSUtil; 
 
public class AdminEMSDao { 
 
    public boolean isEmailExists(String email, String table) throws SQLException, ClassNotFoundException { 
        Connection con = EMSUtil.createConnection(); 
        String query;
        if(table.equals("Customers")) {          
          query = "SELECT COUNT(*) FROM Customers WHERE Email = ?"; 
        }
        else {
          query = "SELECT COUNT(*) FROM Consumers WHERE email = ?"; 
        }
        PreparedStatement ps = con.prepareStatement(query); 
        ps.setString(1, email); 
        ResultSet rs = ps.executeQuery(); 
        rs.next(); 
        boolean result = rs.getInt(1) > 0; 
        EMSUtil.getConnectionClosed(ps, con, rs); 
        return result; 
         
//         
    } 
    
    
    public boolean isEmailSame(String id, String email) throws SQLException, ClassNotFoundException { 
        Connection con = EMSUtil.createConnection(); 
        String query;
        query = "SELECT Email FROM Customers WHERE CustomerID = ?"; 
        PreparedStatement ps = con.prepareStatement(query); 
        ps.setString(1, id); 
        ResultSet rs = ps.executeQuery(); 
        rs.next(); 
        boolean result = rs.getString(1).equals(email); 
        EMSUtil.getConnectionClosed(ps, con, rs); 
        return result; 
         
//         
    } 
    
 
    public boolean isConsumerNumberExists(long l) throws SQLException, ClassNotFoundException { 
      Connection con = EMSUtil.createConnection(); 
        String query = "SELECT COUNT(*) FROM Customers WHERE ConsumerNumber = ?"; 
        PreparedStatement ps = con.prepareStatement(query); 
        ps.setLong(1, l); 
        ResultSet rs = ps.executeQuery(); 
        rs.next(); 
        boolean result = rs.getInt(1) > 0; 
        EMSUtil.getConnectionClosed(ps, con, rs); 
        return result; 
    } 
 
    public static String encryptPassword(String password) { 
        return Base64.getEncoder().encodeToString(password.getBytes()); 
    } 
 
//    public static String decryptPassword(String encryptedPassword) { 
//        return new String(Base64.getDecoder().decode(encryptedPassword)); 
//    } 
 
 
    public String generateCustomerId(String category) throws ClassNotFoundException, SQLException { 
        Connection con = EMSUtil.createConnection(); 
        Random random = new Random(); 
        if(category.equals("CustomerId")) {
          String id =  "CUST" + (100000 + random.nextInt(900000)); // Generates CUST123456 
            String query = "Select CustomerID from Customers where CustomerID = ?"; 
            PreparedStatement ps = con.prepareStatement(query); 
            ps.setString(1,id); 
            ResultSet rs = ps.executeQuery(); 
             
            if(rs.next() && rs.getString(1).length()>0) { 
               EMSUtil.getConnectionClosed(ps, con, rs); 
               generateCustomerId(category); 
            } 
            EMSUtil.getConnectionClosed(ps, con, rs); 
            return id; 
        }
        else {
          String id =  "CONS" + (100000 + random.nextInt(900000)); // Generates CONS123456 
            String query = "Select consumer_id from Consumers where consumer_id = ?"; 
            PreparedStatement ps = con.prepareStatement(query); 
            ps.setString(1,id); 
            ResultSet rs = ps.executeQuery(); 
             
            if(rs.next() && rs.getString(1).length()>0) { 
               EMSUtil.getConnectionClosed(ps, con, rs); 
               generateCustomerId(category); 
            } 
            EMSUtil.getConnectionClosed(ps, con, rs); 
            return id; 
        }
    } 
 
    public String addCustomer(AdminCustomer adminCustomer) throws SQLException, ClassNotFoundException { 
      Connection con = EMSUtil.createConnection(); 
       
         
        if (isEmailExists(adminCustomer.getEmail(), "Customers")) { 
            throw new SQLException("Email already exists."); 
        } 
        if (isConsumerNumberExists(adminCustomer.getConsumerNumber())) { 
            throw new SQLException("Consumer number already exists."); 
        } 
 
        String query = "INSERT INTO Customers (ConsumerNumber, FullName, Address, Email, MobileNumber, CustomerType, UserID, PasswordHash, Role, CustomerID,isAdminCreated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; 
        PreparedStatement ps = con.prepareStatement(query); 
        String customerId = generateCustomerId("CustomerId");
        adminCustomer.setCustomerID(customerId); 
 
        ps.setLong(1, adminCustomer.getConsumerNumber()); 
        ps.setString(2, adminCustomer.getFullName()); 
        ps.setString(3, adminCustomer.getAddress()); 
        ps.setString(4, adminCustomer.getEmail()); 
        ps.setString(5, adminCustomer.getMobileNumber()); 
        ps.setString(6, adminCustomer.getCustomerType()); 
        ps.setString(7, adminCustomer.getUserID()); 
        ps.setString(8, encryptPassword(adminCustomer.getPasswordHash())); 
        ps.setString(9, adminCustomer.getRole()); 
        ps.setString(10, adminCustomer.getCustomerID()); 
        ps.setBoolean(11,adminCustomer.getIsAdminCreated()); 
 
        int rows = ps.executeUpdate(); 
        if( rows > 0) { 
         EMSUtil.getConnectionClosed(ps, con, null); 
         return "SUCCESS" + "/" + customerId; 
        } 
        EMSUtil.getConnectionClosed(ps, con, null); 
        return "Fail"; 
    } 
    
    public String addConsumer(AdminConsumer adminConsumer) throws SQLException, ClassNotFoundException { 
        Connection con = EMSUtil.createConnection(); 
         
           
          if (isEmailExists(adminConsumer.getEmail(),"Consumers")) { 
              throw new SQLException("Email already exists."); 
          } 
   
          String query = "INSERT INTO Consumers (consumer_id, customer_id, address, phone, email, customer_type) VALUES (?, ?, ?, ?, ?, ?)"; 
          PreparedStatement ps = con.prepareStatement(query); 
          String consumerId = generateCustomerId("ConsumerId"); 
          adminConsumer.setConsumerId(consumerId); 
   
          ps.setString(1, adminConsumer.getConsumerId());
          ps.setString(2, adminConsumer.getCustomerId()); 
          ps.setString(3, adminConsumer.getAddress()); 
          ps.setString(4, adminConsumer.getPhone()); 
          ps.setString(5, adminConsumer.getEmail()); 
          ps.setString(6, adminConsumer.getCustomerType()); 
   
          int rows = ps.executeUpdate(); 
          if( rows > 0) { 
           EMSUtil.getConnectionClosed(ps, con, null); 
           return "SUCCESS" + "/" + consumerId; 
          } 
          EMSUtil.getConnectionClosed(ps, con, null); 
          return "Fail"; 
      } 
    
    public ArrayList<AdminCustomer> searchCustomerById(String id) throws ClassNotFoundException, SQLException {
    	Connection con = EMSUtil.createConnection(); 
    	String sql = "SELECT * FROM Customers WHERE CustomerID = ?";
    	PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, id);
        
        ResultSet rs = ps.executeQuery();
        
        ArrayList<AdminCustomer> customerArray = new ArrayList<>();
        if(rs.next()) {
        	AdminCustomer adminCustomer = new AdminCustomer(rs.getLong(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getBoolean(11));
            EMSUtil.getConnectionClosed(ps, con, rs); 
            customerArray.add(adminCustomer);
        }
        
        return customerArray;
        
    }
    
    public ArrayList<AdminConsumer> searchConsumersById(String id) throws ClassNotFoundException, SQLException {
    	Connection con = EMSUtil.createConnection(); 
    	String sql = "SELECT * FROM Consumers WHERE customer_id = ?";
    	PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, id);
        
        ResultSet rs = ps.executeQuery();
        
        ArrayList<AdminConsumer> consumerArray = new ArrayList<>();
        while(rs.next()) {
        	AdminConsumer adminConsumer = new AdminConsumer(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
        	consumerArray.add(adminConsumer);
        }
        EMSUtil.getConnectionClosed(ps, con, rs); 
        return consumerArray;
        
    }
    
    public ArrayList<AdminCustomer> searchCustomerByName(String name) throws ClassNotFoundException, SQLException {
    	Connection con = EMSUtil.createConnection(); 
    	String sql = "SELECT * FROM Customers WHERE FullName Like ?";
    	PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, "%" + name + "%");
        
        ResultSet rs = ps.executeQuery();
        
        ArrayList<AdminCustomer> customerArray = new ArrayList<>();
        while(rs.next()) {
        	AdminCustomer adminCustomer = new AdminCustomer(rs.getLong(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getBoolean(11));
            customerArray.add(adminCustomer);
        }
        EMSUtil.getConnectionClosed(ps, con, rs);         
        return customerArray;
    }
    
    public HashMap<String,List<AdminConsumer>> searchConsumersByName(List<AdminCustomer> adminCustomers) throws ClassNotFoundException, SQLException {
    	
    	Connection con = EMSUtil.createConnection(); 
    	PreparedStatement ps = null;
    	ResultSet rs = null;
    	HashMap<String,List<AdminConsumer>> consumerCustomerMapping = new HashMap<>();
    	for(AdminCustomer adminCustomer : adminCustomers) {
        	String sql = "SELECT * FROM Consumers WHERE customer_id = ?";
        	ps = con.prepareStatement(sql);
    		String id = adminCustomer.getCustomerID();
    		ps.setString(1, id);
    		rs = ps.executeQuery();
            
            ArrayList<AdminConsumer> consumerArray = new ArrayList<>();
            while(rs.next()) {
            	AdminConsumer adminConsumer = new AdminConsumer(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
            	consumerArray.add(adminConsumer);
            }
            
            consumerCustomerMapping.put(id, consumerArray);
    	}        
    	EMSUtil.getConnectionClosed(ps, con, rs); 
        return consumerCustomerMapping;

    }
    
    
    public String updateCustomer(AdminCustomer adminCustomer) throws SQLException, ClassNotFoundException { 
        Connection con = EMSUtil.createConnection(); 
         
          if(!isEmailSame(adminCustomer.getCustomerID(),adminCustomer.getEmail())) { 
        	  if (isEmailExists(adminCustomer.getEmail(), "Customers")) { 
        		  throw new SQLException("Email already exists."); 
        	  } 
          }
       
   
          String query = "Update Customers set FullName =?, Address =?, Email=?, MobileNumber=?, CustomerType=? where CustomerID = ?"; 
          PreparedStatement ps = con.prepareStatement(query); 
       
          ps.setString(1, adminCustomer.getFullName()); 
          ps.setString(2, adminCustomer.getAddress()); 
          ps.setString(3, adminCustomer.getEmail()); 
          ps.setString(4, adminCustomer.getMobileNumber()); 
          ps.setString(5, adminCustomer.getCustomerType()); 
          ps.setString(6, adminCustomer.getCustomerID()); 
     
          int rows = ps.executeUpdate(); 
          if( rows > 0) { 
           EMSUtil.getConnectionClosed(ps, con, null); 
           return "SUCCESS" + "/" + adminCustomer.getCustomerID(); 
          } 
          EMSUtil.getConnectionClosed(ps, con, null); 
          return "Fail"; 
      } 
}