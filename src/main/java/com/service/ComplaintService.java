package com.service;
import java.util.List;

import com.bean.Complaint;
import com.dao.ComplaintDao;

public class ComplaintService {
    public static int registerComplaint(Complaint complaint) {
        return ComplaintDao.registerComplaint(complaint);
    }

    public static Complaint getComplaintById(int complaintId) {
        return ComplaintDao.getComplaintById(complaintId);
    }
    public static List<Complaint> getAllComplaints(String customerid) {
        return ComplaintDao.getAllComplaints(customerid);
    }
    public static List<Complaint> getComplaintByStatus(String status,String customerId){
	return ComplaintDao.getComplaintsByStatus(status,customerId); 
    }
    public static int updateComplaintStatus(int complaintId, String status) {
        return ComplaintDao.updateComplaintStatus(complaintId, status);
    }
  } 