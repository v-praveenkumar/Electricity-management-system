package com.dao;

import com.bean.Complaint;
import com.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ComplaintDao {
    
    // Register a new complaint

	 public static int registerComplaint(Complaint complaint) {
	        int complaintId = -1; // Default value if insertion fails

	        try (Connection conn = DBUtil.createConnection()) {
	            String query = "INSERT INTO Complaints (consumer_number, complainttype, customer_id, complaint_text, status, created_at, updated_at) " +
	                           "VALUES (?, ?, ?, ?, 'Pending', CURRENT_DATE, CURRENT_DATE)";

	            PreparedStatement ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
	            ps.setLong(1, complaint.getConsumerNumber());
	            ps.setString(2, complaint.getComplaintType());
	            ps.setString(3, complaint.getCustomerId());
	            ps.setString(4, complaint.getComplaintText());

	            int rowsAffected = ps.executeUpdate();

	            if (rowsAffected > 0) {
	                ResultSet rs = ps.getGeneratedKeys();
	                if (rs.next()) {
	                    complaintId = rs.getInt(1); // Get the auto-generated complaint_id
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return complaintId; 
	    }
	
	 
    
         
	   
     
    // Retrieve a complaint by ID
    public static Complaint getComplaintById(int complaintId) {
        Complaint complaint = null;
        try (Connection conn = DBUtil.createConnection()) {
            String query = "SELECT * FROM Complaints WHERE complaint_id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, complaintId);
            ResultSet rs = ps.executeQuery();
          
           
     

            if (rs.next()) {
                complaint = new Complaint();
                complaint.setComplaintId(rs.getInt("complaint_id"));
                complaint.setConsumerNumber(rs.getLong("consumer_number"));
                complaint.setComplaintType(rs.getString("complainttype"));
                complaint.setCustomerId(rs.getString("customer_id"));
                complaint.setComplaintText(rs.getString("complaint_text"));
                complaint.setStatus(rs.getString("status"));
                complaint.setCreatedAt(rs.getTimestamp("created_at"));
                complaint.setUpdatedAt(rs.getTimestamp("updated_at"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return complaint;
    }

    // Retrieve all complaints for a specific consumer
    public static List<Complaint> getComplaintsByStatus(String status, String customerId) {
        List<Complaint> complaints = new ArrayList<>();
        try (Connection cn = DBUtil.createConnection()) {
            String query = "SELECT * FROM Complaints WHERE status=? AND customer_id=?";
            PreparedStatement ps = cn.prepareStatement(query);
            ps.setString(1, status);
            ps.setString(2, customerId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Complaint complaint = new Complaint();
                complaint = new Complaint();
                complaint.setComplaintId(rs.getInt("complaint_id"));
                complaint.setConsumerNumber(rs.getLong("consumer_number"));
                complaint.setComplaintType(rs.getString("complainttype"));
                complaint.setCustomerId(rs.getString("customer_id"));
                complaint.setComplaintText(rs.getString("complaint_text"));
                complaint.setStatus(rs.getString("status"));
                complaint.setCreatedAt(rs.getTimestamp("created_at"));
                complaint.setUpdatedAt(rs.getTimestamp("updated_at"));
                
                
                complaints.add(complaint);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return complaints;
    }
    
    public static List<Complaint> getAllComplaints(String customerid) {
        List<Complaint> complaints = new ArrayList<>();
        try (Connection cn = DBUtil.createConnection()) {
            String query = "SELECT * FROM Complaints where customer_id=?";
            PreparedStatement ps = cn.prepareStatement(query);
            ps.setString(1, customerid);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Complaint complaint = new Complaint();
                complaint = new Complaint();
                complaint.setComplaintId(rs.getInt("complaint_id"));
                complaint.setConsumerNumber(rs.getLong("consumer_number"));
                complaint.setComplaintType(rs.getString("complainttype"));
                complaint.setCustomerId(rs.getString("customer_id"));
                complaint.setComplaintText(rs.getString("complaint_text"));
                complaint.setStatus(rs.getString("status"));
                complaint.setCreatedAt(rs.getTimestamp("created_at"));
                complaint.setUpdatedAt(rs.getTimestamp("updated_at"));
                
                
                complaints.add(complaint);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return complaints;
    }

    // Update complaint status
    public static int updateComplaintStatus(int complaintId, String newStatus) {
        int status = 0;
        try (Connection conn = DBUtil.createConnection()) {
            String query = "UPDATE Complaints SET status = ?, updated_at = CURRENT_TIMESTAMP WHERE complaint_id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, newStatus);
            ps.setInt(2, complaintId);
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
   public static void main(String[] args) {
//    	System.out.println(getComplaintById(1));
//    	Complaint c = new Complaint();
//    	c.setComplaintId(6);
//    	c.setComplaintType("Billing Issue");;
//    	c.setCustomerId("CUST100001");
//    	c.setComplaintText("Bill was higher then calculated meter");
//    	int ans = registerComplaint(c);
//    	System.out.println(ans);
 // List<Complaint> ans2 = getComplaintsByStatus("Pending" , "CUST100005");
 //  System.out.println(ans2);
	   
//	  List<Complaint> ans3 = getAllComplaints("CUST100002");
//	   System.out.println(ans3);
   }
    
}