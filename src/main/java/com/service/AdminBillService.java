package com.service;

import java.sql.SQLException;
import java.util.List;

import com.bean.AdminBill;
import com.bean.AdminCustomer;
import com.dao.AdminBillDAO;

public class AdminBillService {
    private AdminBillDAO adminBillDAO = new AdminBillDAO(); // DAO instance

    public List<AdminBill> getBillHistoryForCustomer(String atrribute,String action) throws ClassNotFoundException {
        return adminBillDAO.fetchBillHistoryForCustomer(atrribute,action);
    }
    
    public AdminBill getBillDetailsById(int billId) {
        return adminBillDAO.fetchBillDetailsById(billId);
    }
    
    public AdminCustomer checkCustomerExist(String customerId) throws ClassNotFoundException, SQLException {
    	 return adminBillDAO.checkCustomerExist(customerId);
    }
    
    public boolean checkBill(long consumerNumber,String billingPeriod) throws ClassNotFoundException, SQLException
	{
		AdminBillDAO dao = new AdminBillDAO();
		return dao.checkBill(consumerNumber, billingPeriod);
	}
    
    public AdminBill registerBill(AdminBill a) throws ClassNotFoundException, SQLException 
	{
		AdminBillDAO dao = new AdminBillDAO();
		return dao.registerBill(a);
	}
}