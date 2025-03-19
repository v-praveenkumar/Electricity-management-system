package com.web;

import java.io.IOException;
import java.util.List;

import com.bean.AdminComplaint;
import com.bean.AdminCustomer;
import com.service.AdminComplaintService;

import javax.servlet.RequestDispatcher; 
import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 

@WebServlet("/AdminComplaintServlet")
public class AdminComplaintServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminComplaintService adminComplaintService;

    @Override
    public void init() throws ServletException {
        adminComplaintService = new AdminComplaintService();  // Initialize the service layer
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("viewAll".equals(action)) {
        	try {
                List<AdminComplaint> adminComplaints = adminComplaintService.getAllComplaints();
                request.setAttribute("complaints", adminComplaints);
                RequestDispatcher dispatcher = request.getRequestDispatcher("viewAllComplaints.jsp");
                dispatcher.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Error fetching complaints: " + e.getMessage());
                RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
                dispatcher.forward(request, response);
            }
        }
        
        if ("viewAllCustomers".equals(action)) {
        	try {
                List<AdminCustomer> adminCustomers = adminComplaintService.getAllCustomers();
                List<String> freeze = adminComplaintService.getAllFreeze();
                request.setAttribute("customers", adminCustomers);
                request.setAttribute("freeze", freeze);
                RequestDispatcher dispatcher = request.getRequestDispatcher("viewAllCustomer.jsp");
                dispatcher.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Error fetching complaints: " + e.getMessage());
                RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
                dispatcher.forward(request, response);
            }
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		String action = request.getParameter("action");
    		System.out.println("post"+action);
    		
    		if(action.equals("filterByDate")) {
    			String startDate = request.getParameter("startDate");
         	    String endDate = request.getParameter("endDate");
         	   System.out.println("post"+startDate+endDate);
         	    List<AdminComplaint> adminComplaints = null;
				try {
					adminComplaints = adminComplaintService.getComplaintsByDateRange(startDate, endDate);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
         	    
 	    	request.setAttribute("complaints", adminComplaints);
      	   
      	    RequestDispatcher dispatcher = request.getRequestDispatcher("viewAllComplaints.jsp");
      	    dispatcher.forward(request, response);
    	}
    	if ("searchByCustomer".equals(action)) {
	        String customerId = request.getParameter("customerId");
	        String status = request.getParameter("status");
	        System.out.println("post"+customerId+status);
	        List<AdminComplaint> adminComplaints = null;
			try {
				adminComplaints = adminComplaintService.getComplaintsByCustomerIdAndStatus(customerId, status);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        request.setAttribute("complaints", adminComplaints);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("complaintList.jsp");
	        dispatcher.forward(request, response);
    	}
    	
    	if("updateStatus".equals(action)) {
    		int complaintId = Integer.parseInt(request.getParameter("complaintId"));
            String newStatus = request.getParameter("newStatus");
            String customerId = request.getParameter("customerId");
            
            System.out.println("hi"+complaintId+newStatus);

            boolean isUpdated = false;
			try {
				isUpdated = adminComplaintService.updateComplaintStatus(complaintId, newStatus);
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

            if (isUpdated) {
                request.getSession().setAttribute("successMessage", "Status updated successfully for Complaint ID " + complaintId);
    	        System.out.println("post"+customerId);
    	        List<AdminComplaint> adminComplaints = null;
    			try {
    				adminComplaints = adminComplaintService.getComplaintsByCustomerIdAndStatus(customerId, "null");
    			} catch (ClassNotFoundException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
    	        request.setAttribute("complaints", adminComplaints);
    	        RequestDispatcher dispatcher = request.getRequestDispatcher("complaintList.jsp");
    	        dispatcher.forward(request, response);
            } 
    	}
    	
    	if(action.equals("searchByConsumer")) {
    		 String consumerNo = request.getParameter("consumerNumber");
 	        String status = request.getParameter("status");
 	        System.out.println("post"+consumerNo+status);
 	        List<AdminComplaint> adminComplaints = null;
 			try {
 				adminComplaints = adminComplaintService.getComplaintsByConsumerNumberAndStatus(consumerNo, status);
 			} catch (ClassNotFoundException e) {
 				// TODO Auto-generated catch block
 				e.printStackTrace();
 			}
 	        request.setAttribute("complaints", adminComplaints);
 	        RequestDispatcher dispatcher = request.getRequestDispatcher("complaintList.jsp");
 	        dispatcher.forward(request, response);
    	}
    	
    	
    	if("updateStatusofFreeze".equals(action)) {
    		
            String customerId = request.getParameter("customerId");
            String status = request.getParameter("newStatus");
            
            System.out.println("hi"+customerId+status);

            boolean isUpdated = false;
			try {
				isUpdated = adminComplaintService.updateCustomerStatus(customerId,status);
				 System.out.println("hi"+customerId+isUpdated);
				
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			}

            if (isUpdated) {
    	        System.out.println("post"+customerId);
    	        try {
                    List<AdminCustomer> adminCustomers = adminComplaintService.getAllCustomers();
                    List<String> freeze = adminComplaintService.getAllFreeze();
                    request.setAttribute("customers", adminCustomers);
                    request.setAttribute("freeze", freeze);
                    System.out.println("hi"+adminCustomers+freeze);
                    request.setAttribute("successMessage", "Status updated successfully for Customer ID " + customerId);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("viewAllCustomer.jsp");
                    dispatcher.forward(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("error", "Error fetching complaints: " + e.getMessage());
                    RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
                    dispatcher.forward(request, response);
                }
    	}
    	   
    	  
    }

    }
}
