package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.AdminComplaint;
import com.bean.AdminCustomer;
import com.util.EMSUtil;

public class AdminComplaintDAO {

    public List<AdminComplaint> fetchAllComplaints() throws Exception {
        List<AdminComplaint> adminComplaints = new ArrayList<>();

        try (Connection conn = EMSUtil.createConnection()) {
            String query = "SELECT * FROM Complaints ORDER BY created_at DESC";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                AdminComplaint adminComplaint = new AdminComplaint(
                    rs.getInt(1),
                    rs.getLong(2),
                    rs.getString(3),
                    rs.getString(4),
                    String.valueOf(rs.getDate(5)),
                    String.valueOf(rs.getDate(6)),
                    rs.getString(7),
                    rs.getString(8)
                );
                adminComplaints.add(adminComplaint);
            }

            EMSUtil.getConnectionClosed(stmt, conn, rs);
        }
        return adminComplaints;
    }
    
    
    public List<AdminCustomer> fetchAllCustomers() throws Exception {
        List<AdminCustomer> adminCustomers = new ArrayList<>();

        try (Connection conn = EMSUtil.createConnection()) {
            String query = "SELECT * FROM Customers";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
            	AdminCustomer adminCustomer = new AdminCustomer(rs.getLong(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getBoolean(11));
            	adminCustomers.add(adminCustomer);
            }
            System.out.println(adminCustomers);
            EMSUtil.getConnectionClosed(stmt, conn, rs);
        }
        return adminCustomers;
    }
    
    public List<String> getAllFreeze() throws Exception {
        List<String> customers = new ArrayList<>();

        try (Connection conn = EMSUtil.createConnection()) {
            String query = "SELECT * FROM Customers";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
            	System.out.println("hi33"+rs.getBoolean(12));
            	if(rs.getBoolean(12) == true) {
            		customers.add("True");
            	}
            	else {
            		customers.add("False");
            	}
            }

            EMSUtil.getConnectionClosed(stmt, conn, rs);
        }
        return customers;
    }
    
    public List<AdminComplaint> getComplaintsByDateRange(String startDate, String endDate) throws ClassNotFoundException {
        List<AdminComplaint> adminComplaints = new ArrayList<>();
        String query = "SELECT * FROM Complaints WHERE created_at BETWEEN ? AND ? ORDER BY created_at DESC";

        try (Connection conn = EMSUtil.createConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, startDate);
            stmt.setString(2, endDate);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
            	 AdminComplaint adminComplaint = new AdminComplaint(
                         rs.getInt(1),
                         rs.getLong(2),
                         rs.getString(3),
                         rs.getString(4),
                         String.valueOf(rs.getDate(5)),
                         String.valueOf(rs.getDate(6)),
                         rs.getString(7),
                         rs.getString(8)
                     );
            	 adminComplaints.add(adminComplaint);
            }
            EMSUtil.getConnectionClosed(stmt, conn, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return adminComplaints;
    }
    
    public List<AdminComplaint> getComplaintsByCustomerIdAndStatus(String customerId, String status) throws ClassNotFoundException {
        List<AdminComplaint> adminComplaints = new ArrayList<>();
        System.out.println("post"+customerId+status);
        String query = "SELECT * FROM Complaints WHERE customer_id = ?";

        if (!"null".equals(status) && !"".equals(status)) {
            query += " AND status = ?";
        }

        try (Connection conn = EMSUtil.createConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, customerId);
            
            if (!"null".equals(status) && !"".equals(status)) {
            	stmt.setString(2, status);
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
            	AdminComplaint adminComplaint = new AdminComplaint(
                        rs.getInt(1),
                        rs.getLong(2),
                        rs.getString(3),
                        rs.getString(4),
                        String.valueOf(rs.getDate(5)),
                        String.valueOf(rs.getDate(6)),
                        rs.getString(7),
                        rs.getString(8)
                    );
                adminComplaints.add(adminComplaint);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return adminComplaints;
    }
    
    
    public List<AdminComplaint> getComplaintsByConsumerNumberAndStatus(String consumerNo, String status) throws ClassNotFoundException {
        List<AdminComplaint> adminComplaints = new ArrayList<>();
        System.out.println("post"+consumerNo+status);
        String query = "SELECT * FROM Complaints WHERE consumer_number = ?";

        if (!"null".equals(status) && !"".equals(status)) {
            query += " AND status = ?";
        }

        try (Connection conn = EMSUtil.createConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, consumerNo);
            
            if (!"null".equals(status) && !"".equals(status)) {
            	stmt.setString(2, status);
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
            	AdminComplaint adminComplaint = new AdminComplaint(
                        rs.getInt(1),
                        rs.getLong(2),
                        rs.getString(3),
                        rs.getString(4),
                        String.valueOf(rs.getDate(5)),
                        String.valueOf(rs.getDate(6)),
                        rs.getString(7),
                        rs.getString(8)
                    );
                adminComplaints.add(adminComplaint);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return adminComplaints;
    }
    
    public boolean updateComplaintStatus(int complaintId, String newStatus) throws ClassNotFoundException {
        String query = "UPDATE Complaints SET status = ?, updated_at = CURRENT_DATE WHERE complaint_id = ?";

        try (Connection conn = EMSUtil.createConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, newStatus);
            stmt.setInt(2, complaintId);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean updateCustomerStatus(String customerId, String status) throws ClassNotFoundException {
        String query = "UPDATE Customers SET isFreeze = ? where CustomerID = ?";
        try (Connection conn = EMSUtil.createConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
        	
        	System.out.println("hi222"+status.equals("Freeze"));
        	if(status.equals("Freeze")) {
        		 stmt.setBoolean(1, true);
                 stmt.setString(2, customerId);
        	}
        	else {
        		stmt.setBoolean(1, false);
                stmt.setString(2, customerId);
        	}
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
