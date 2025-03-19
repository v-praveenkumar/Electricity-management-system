package com.dao;

import java.sql.*;

import com.bean.Customer;
import com.util.DBUtil;
import com.util.PasswordUtil;

public class CustomerDao {
	

    public boolean registerCustomer(long ConsumerNumber, String FullName, String Address, String Email, 
                                    String MobileNumber, String CustomerType, String UserID,String PasswordHash) {
        try {
        	System.out.println("insert register customer");
            Connection conn=DBUtil.createConnection();
            String CustomerID=UserID;
            String sql = "INSERT INTO customers (ConsumerNumber,FullName,Address,Email,MobileNumber,CustomerType,UserID,PasswordHash,CustomerID) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setLong(1, ConsumerNumber);
            pstmt.setString(2, FullName);
            pstmt.setString(3, Address);
            pstmt.setString(4, Email);
            pstmt.setString(5, MobileNumber);
            pstmt.setString(6, CustomerType);
            pstmt.setString(7, UserID);
            pstmt.setString(8, PasswordHash);
            pstmt.setString(9, CustomerID);
            int rowsInserted = pstmt.executeUpdate();
            DBUtil.closeAllConnection(conn, pstmt, null);
            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean isUserIdExists(String userId) {
        boolean exists = false;
        try {
            
            Connection conn =DBUtil.createConnection();
            String sql = "SELECT COUNT(*) FROM customers WHERE UserID = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                exists = true;  
            }
            DBUtil.closeAllConnection(conn, pstmt, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exists;
    }
    public boolean isCustomerNumberExists(String consumerNumber) {
        boolean exists = false;
        try {
            
            Connection conn = DBUtil.createConnection();
            String sql = "SELECT COUNT(*) FROM customers WHERE ConsumerNumber = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, consumerNumber);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                exists = true;  
            }
            DBUtil.closeAllConnection(conn, pstmt, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exists;
    }

	public Customer getCustomerByIdAndPassword(String userId, String password) throws ClassNotFoundException{
		String query="SELECT * FROM customers WHERE userId=?";
		Customer customer=null;
		System.out.println("inside getCustomerById and Password");
        try {
			Connection conn = DBUtil.createConnection();
			PreparedStatement psmt=conn.prepareStatement(query);
			psmt.setString(1, userId);
			ResultSet rs=psmt.executeQuery();
			
			if(rs.next()) {
				
				String storedHashedPassword=rs.getString("passwordHash");
				System.out.println(storedHashedPassword.equals(PasswordUtil.hashPassword(password)));
				if(storedHashedPassword.equals(PasswordUtil.hashPassword(password))) {
					
					customer =  new Customer(rs.getLong("ConsumerNumber"),rs.getString("FullName"),rs.getString("Address"),rs.getString("Email"),rs.getString("MobileNumber"),
							rs.getString("CustomerType"),rs.getString("UserID"),rs.getString("CustomerID"));
					System.out.println(customer.getCustomerID());
					
				}			
			}
			System.out.println(""
					+ "");
			
			DBUtil.closeAllConnection(conn, psmt, rs);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
        System.out.println(customer.getCustomerType());
        return customer;
	}

}

