package com.service;

import java.util.List;

import com.bean.AdminComplaint;
import com.bean.AdminCustomer;
import com.dao.AdminComplaintDAO;

public class AdminComplaintService {
    private AdminComplaintDAO adminComplaintDAO;

    public AdminComplaintService() {
        adminComplaintDAO = new AdminComplaintDAO();
    }

    public List<AdminComplaint> getAllComplaints() throws Exception {
        return adminComplaintDAO.fetchAllComplaints();
    }
    
    public List<AdminCustomer> getAllCustomers() throws Exception {
        return adminComplaintDAO.fetchAllCustomers();
    }
    
    public List<String> getAllFreeze() throws Exception {
        return adminComplaintDAO.getAllFreeze();
    }
    
    public List<AdminComplaint> getComplaintsByDateRange(String startDate, String endDate) throws ClassNotFoundException {
        return adminComplaintDAO.getComplaintsByDateRange(startDate, endDate);
    }

    public List<AdminComplaint> getComplaintsByCustomerIdAndStatus(String customerId, String status) throws ClassNotFoundException {
        return adminComplaintDAO.getComplaintsByCustomerIdAndStatus(customerId, status);
    }
    
    public List<AdminComplaint> getComplaintsByConsumerNumberAndStatus(String consumerNo, String status) throws ClassNotFoundException {
        return adminComplaintDAO.getComplaintsByConsumerNumberAndStatus(consumerNo, status);
    }
    
    public boolean updateComplaintStatus(int complaintId, String newStatus) throws ClassNotFoundException {
        return adminComplaintDAO.updateComplaintStatus(complaintId, newStatus);
    }
    
    public boolean updateCustomerStatus( String customerId, String status) throws ClassNotFoundException {
        return adminComplaintDAO.updateCustomerStatus(customerId, status);
    }
}
