package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.bean.AdminBill;
import com.bean.AdminCustomer;
import com.util.EMSUtil;

public class AdminBillDAO {

    public List<AdminBill> fetchBillHistoryForCustomer(String attribute,String action) throws ClassNotFoundException {
        List<AdminBill> billHistory = new ArrayList<>();

        try {
        	Connection conn = EMSUtil.createConnection();
        	PreparedStatement stmt = null;
        	if(action.equals("id")) {        		
        		 stmt = conn.prepareStatement("SELECT * FROM Bills WHERE ConsumerNumber = (SELECT ConsumerNumber FROM Customers WHERE CustomerID = ?) ORDER BY BillingPeriod DESC");
        		 stmt.setString(1, attribute);
        	}
        	else if(action.equals("number")){
        		long value = Long.parseLong(attribute);
        		stmt = conn.prepareStatement("SELECT * FROM Bills WHERE ConsumerNumber = ? ORDER BY BillingPeriod DESC");
        		stmt.setLong(1, value);
        	}
        	else {
        		long value = Long.parseLong(attribute);
        		System.out.println("value"+value+action);
        		if(action.equals("true")) {
        			stmt = conn.prepareStatement("SELECT * FROM Bills WHERE ConsumerNumber = ? and isPaid = ? ORDER BY BillingPeriod DESC");
            		stmt.setLong(1, value);
            		stmt.setBoolean(2, true);
        		}
        		else if(action.equals("false")) {
        			stmt = conn.prepareStatement("SELECT * FROM Bills WHERE ConsumerNumber = ? and isPaid = ? ORDER BY BillingPeriod DESC");
            		stmt.setLong(1, value);
            		stmt.setBoolean(2, false);
        		}
        		
        		else {
        			stmt = conn.prepareStatement("SELECT * FROM Bills WHERE ConsumerNumber = ? ORDER BY BillingPeriod DESC");
            		stmt.setLong(1, value);
        		}
        		
        	}
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                AdminBill adminBill = new AdminBill(rs.getInt(1),rs.getLong(2),rs.getDate(3),rs.getDate(4),rs.getDate(5),rs.getDate(6),rs.getDouble(7),rs.getDouble(8),rs.getBoolean(9),rs.getString(10),rs.getString(11),rs.getString(12));
                billHistory.add(adminBill);
            }
           EMSUtil.getConnectionClosed(stmt, conn, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return billHistory;
    }
    
    public AdminBill fetchBillDetailsById(int billId) {
        AdminBill adminBill = null;

        try (Connection conn = EMSUtil.createConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Bills WHERE BillID = ?")) {

            stmt.setInt(1, billId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
            	 adminBill = new AdminBill(rs.getInt(1),rs.getLong(2),rs.getDate(3),rs.getDate(4),rs.getDate(5),rs.getDate(6),rs.getDouble(7),rs.getDouble(8),rs.getBoolean(9),rs.getString(10),rs.getString(11),rs.getString(12));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return adminBill;
    }
    
    public AdminCustomer checkCustomerExist(String customerId) throws SQLException, ClassNotFoundException {
    	Connection conn = EMSUtil.createConnection();
    	PreparedStatement stmt = null;
    	  
    	System.out.println("hi3"+customerId);
		 stmt = conn.prepareStatement("SELECT * FROM Customers WHERE CustomerID = ?");
		 stmt.setString(1, customerId);
    	
		 ResultSet rs = stmt.executeQuery();
		 if(rs.next()) {
			 AdminCustomer adminCustomer = new AdminCustomer(rs.getLong(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getBoolean(11));
			 return adminCustomer;
		 }
		 EMSUtil.getConnectionClosed(stmt, conn, rs);
		 return null;
    }
    
    
    public boolean checkBill(long consumerNumber,String billingPeriod) throws ClassNotFoundException, SQLException
	{
		Connection cn = EMSUtil.createConnection();
		PreparedStatement ps;
		int count=0;
		try {
			ps = cn.prepareStatement("SELECT COUNT(*) FROM Bills WHERE BillingPeriod=? and ConsumerNumber=?");
			System.out.println(billingPeriod);
			ps.setString(1,billingPeriod);
			ps.setLong(2, consumerNumber);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				count = rs.getInt(1);
			}
			EMSUtil.getConnectionClosed(ps,cn,rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return (count == 0) ? false : true;
	}
    
    public AdminBill registerBill(AdminBill a) throws ClassNotFoundException, SQLException 
	{
		Connection cn = EMSUtil.createConnection();
		int r = 0;
		ResultSet rs = null;
		AdminBill adminBill = null;
		System.out.println("hi"+a.getBillingPeriod());
		try {
			PreparedStatement ps = cn.prepareStatement("INSERT INTO Bills(ConsumerNumber,BillingPeriod,BillDate,DueDate,DisconnectionDate,AmountDue,PayableAmount,IsPaid,ConnectionType,ConnectionStatus, MobileNumber) VALUES(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setLong(1, a.getConsumerNumber());
			ps.setString(2, String.valueOf( a.getBillingPeriod()));
			ps.setString(3, String.valueOf( a.getBillDate()));
			ps.setString(4, String.valueOf( a.getDueDate()));
			ps.setString(5, String.valueOf( a.getDisconnectionDate()));
			ps.setDouble(6, a.getAmountDue());
			ps.setDouble(7, a.getPayableAmount());
			ps.setBoolean(8, a.isPaid());
			ps.setString(9, a.getConnectionType());
			ps.setString(10, a.getConnectionStatus());
			ps.setString(11, a.getMobileNumber());
			r =ps.executeUpdate();
			System.out.println("hi"+a.getBillingPeriod());
//			EMSUtil.getConnectionClosed(ps, cn, rs);
			if(r > 0)
			{
				ps = cn.prepareStatement("Select * from Bills Where ConsumerNumber = ? and BillingPeriod = ? ");
				ps.setLong(1, a.getConsumerNumber());
				ps.setDate(2, (Date) a.getBillingPeriod());
				rs = ps.executeQuery();
				while(rs.next())
				{
					adminBill = new AdminBill(rs.getInt(1), rs.getLong(2), rs.getDate(3),rs.getDate(4), rs.getDate(5), rs.getDate("DisconnectionDate"),rs.getDouble("AmountDue"),rs.getDouble("PayableAmount"),rs.getBoolean("IsPaid"),rs.getString("ConnectionType"),rs.getString("ConnectionStatus"),rs.getString("MobileNumber"));
					System.out.println(rs);
				}
				EMSUtil.getConnectionClosed(ps, cn, rs);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return adminBill;
	}
	
}
