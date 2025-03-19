package com.dao;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.Bills;
import com.bean.payment;
import com.util.DBUtil;
public class BillsDao {
	
	public List<Bills> getBillsList(Long ConsumerNumber){
		List<Bills> userBills=new ArrayList<Bills>();
		try {
			Connection cn=DBUtil.createConnection();
			PreparedStatement ps=cn.prepareStatement("SELECT * FROM Bills where ConsumerNumber=?");
			ps.setLong(1, ConsumerNumber);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Bills e=new Bills(rs.getInt(1),
						rs.getLong(2),
						rs.getString(3),
						rs.getString(5),
						rs.getString(6),
						rs.getDouble(7),
						rs.getDouble(8),
						rs.getBoolean(9),
						rs.getString(10),
						rs.getString(11),
						rs.getLong(12),
						rs.getString(4));
				userBills.add(e);
			}
			DBUtil.closeAllConnection(cn, ps, rs);
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return userBills;
	}
	public void updateBillPaid(String s) {
		String[] str=s.split(",");
		try {
			Connection cn = DBUtil.createConnection();
			for(int i=0;i<str.length;i++) {
				PreparedStatement ps = cn.prepareStatement("update Bills set isPaid=TRUE where BillId=?");
				ps.setInt(1, Integer.parseInt(str[i]));
				ps.executeUpdate();
				DBUtil.closeAllConnection(cn, ps, null);	
			}
		}catch (SQLException e) {
			System.out.println("e.getMessage()");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	//Payment details
	public boolean insertPaymentDetails(payment ptm) {
		boolean result = false;

		try {
			Connection cn = DBUtil.createConnection();
			PreparedStatement ps = cn.prepareStatement("Insert into payment VALUES(?,?,?,?,?,?,?,?,?)");
			ps.setString(1, ptm.getInvoiceNumber());
			ps.setString(2, ptm.getPaymentId());
			ps.setString(3, ptm.getTransactionId());
			ps.setString(4, ptm.getReceiptNumber());
			ps.setString(5, ptm.getTransactionDate());
			ps.setString(6, ptm.getTransactionType());
			ps.setString(7, ptm.getBillNumber());
			ps.setDouble(8, ptm.getTransactionAmount());
			ps.setString(9, ptm.getTransactionStatus());
			updateBillPaid(ptm.getBillNumber());
			int t = ps.executeUpdate();
			DBUtil.closeAllConnection(cn, ps, null);
			if (t > 0)
				return true;
		} catch (SQLException e) {
			System.out.println("e.getMessage()");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	
	//view Invoice
	
	public static payment viewInvoice(String txnId) {
		payment ptm = null;
		try {
			Connection cn = DBUtil.createConnection();
			PreparedStatement ps = cn.prepareStatement("Select * from payment where transactionId =?");
			ps.setString(1, txnId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				
				ptm = new payment(rs.getString("invoiceNumber"), rs.getString("paytmId"), rs.getString("transactionId"),
						rs.getString("receiptNumber"), rs.getString("transactionDate"), rs.getString("transactionType"),
						rs.getString("billNumber"), rs.getDouble("transactionAmount"), rs.getString("transactionStatus"));
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return ptm;
	}
	
}
//CREATE TABLE payment(invoiceNumber varchar(50),paytmId varchar(50),
//transactionId varchar(50),receiptNumber varchar(50),transactionDate varchar(50),
//transactionType varchar(50), billNumber varchar(100), transactionAmount decimal, transactionStatus varchar(50));
