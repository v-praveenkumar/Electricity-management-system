package com.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Complaint;

import com.service.ComplaintService;

/**
 * Servlet implementation class ComplaintServlet
 */
@WebServlet("/ComplaintServlet")
public class ComplaintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComplaintServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 String action = request.getParameter("action");
		 HttpSession session = request.getSession();
		 String customerId =(String)session.getAttribute("customerId");
		
		 RequestDispatcher rd =null;
		 if ("track".equals(action)) {
	            String searchType = request.getParameter("searchType");

	            if ("id".equals(searchType)) {
	                try {
	                    int complaintId = Integer.parseInt(request.getParameter("complaintId"));
	                    Complaint complaint = ComplaintService.getComplaintById(complaintId);

	                    if (complaint != null) {
	                        request.setAttribute("complaint", complaint);
	                        rd = request.getRequestDispatcher("complaintStatus.jsp");
	                    } else {
	                        response.sendRedirect("errorComplaint.jsp");
	                        return;
	                    }
	                } catch (NumberFormatException e) {
	                    response.sendRedirect("errorComplaint.jsp");
	                    return;
	                }
	            } else if ("status".equals(searchType)) {
	                String status = request.getParameter("status");
	                
	                List<Complaint> complaints = ComplaintService.getComplaintByStatus(status,customerId);

	                if (complaints != null && !complaints.isEmpty()) {
	                    request.setAttribute("complaints", complaints);
	                    rd = request.getRequestDispatcher("complaintStatus.jsp");
	                } else {
	                    response.sendRedirect("errorComplaint.jsp");
	                    return;
	                }
	            }
	             
	        } else if ("history".equals(action)) {
	        	
	            List<Complaint> complaints = ComplaintService.getAllComplaints(customerId);
	           
	            request.setAttribute("complaints", complaints);
	            rd = request.getRequestDispatcher("complaintHistory.jsp");

	        } else if ("viewDetails".equals(action)) {
	            try {
	                int complaintId = Integer.parseInt(request.getParameter("complaintId"));
	                Complaint complaint = ComplaintService.getComplaintById(complaintId);
	                if (complaint != null) {
	                    request.setAttribute("complaint", complaint);
	                    rd = request.getRequestDispatcher("complaintDetails.jsp");
	                } else {
	                    response.sendRedirect("errorComplaint.jsp");
	                    return;
	                }
	            } catch (NumberFormatException e) {
	                response.sendRedirect("errorComplaint.jsp");
	                return;
	            }
	        }	 	                  	 
		    
	        rd.forward(request, response); 
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String action = request.getParameter("action");

	    if ("register".equals(action)) {
	        HttpSession session = request.getSession();

	       
			String customerId =(String)session.getAttribute("customerId");
			long  consumerNumber =(long)session.getAttribute("consumerNo");
			System.out.println("ji"+customerId+consumerNumber);

	        if (customerId == null) {
	            response.sendRedirect("errorComplaint.jsp");
	            return;
	        }

	        // Get form data
	        String complaintType = request.getParameter("complaintType");
	        String complaintText = request.getParameter("description");
	        String contactMethod = request.getParameter("contactMethod");
//	        String contactDetails = request.getParameter("contactDetails");
	        System.out.println("ji"+complaintType+complaintText+contactMethod);
//	        if (complaintType == null || complaintText == null || contactMethod == null || contactDetails == null) 

	        // Validate important fields
	        if (complaintType == null || complaintText == null || contactMethod == null ) {
	            request.setAttribute("errorMessage", "All fields are required.");
	            request.getRequestDispatcher("complaintRegistration.jsp").forward(request, response);
	            return;
	        }

	        // Status always starts as "Pending"
	        String status = "Pending";

	        // Create complaint object
	        Complaint complaint = new Complaint(consumerNumber, complaintType, customerId, complaintText, contactMethod, status);

	        // Pass to service layer
	        int complaintId = ComplaintService.registerComplaint(complaint);

	        if (complaintId > 0) {
	            request.setAttribute("complaintId", complaintId);
	            request.getRequestDispatcher("successComplaint.jsp").forward(request, response);
	        } else {
	            response.sendRedirect("errorComplaint.jsp");
	        }
	    }
	}

//    public static void main(String[] args) {
//       
//        String testCustomerId = "CUST100002"; 
//
//       
//        List<Complaint> complaints = ComplaintService.getAllComplaints(testCustomerId);
//
//       
//        if (complaints != null && !complaints.isEmpty()) {
//            System.out.println("Complaints retrieved successfully:");
//            for (Complaint complaint : complaints) {
//                System.out.println("Complaint ID: " + complaint.getComplaintId());
//                System.out.println("Type: " + complaint.getComplaintType());
//                System.out.println("Status: " + complaint.getStatus());
//                System.out.println("Description: " + complaint.getComplaintText());
//                System.out.println("---------------------------");
//            }
//        } else {
//            System.out.println("No complaints found for customer ID: " + testCustomerId);
//        }
//    }
}
