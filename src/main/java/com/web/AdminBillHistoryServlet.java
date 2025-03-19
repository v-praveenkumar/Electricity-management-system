package com.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.bean.AdminBill;
import com.bean.AdminCustomer;
import com.service.AdminBillService;

import javax.servlet.RequestDispatcher; 
import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 

@WebServlet("/BillHistoryServlet")
public class AdminBillHistoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminBillService adminBillService = new AdminBillService(); // Service instance
    


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String billId = request.getParameter("billId");

        if (billId != null) {
            try {
                AdminBill adminBill = adminBillService.getBillDetailsById(Integer.parseInt(billId));
                
                request.setAttribute("billDetails", adminBill);
                RequestDispatcher dispatcher = request.getRequestDispatcher("billDetails.jsp");
                dispatcher.forward(request, response);
               
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Error fetching bill details.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("billHistory.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            request.setAttribute("error", "Invalid bill ID.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("billHistory.jsp");
            dispatcher.forward(request, response);
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println(action + " hi");

        if ("searchById".equals(action)) {
            String customerId = request.getParameter("customerId");
            List<AdminBill> billHistory = null;
            System.out.println(billHistory + " hi");
			try {
				billHistory = adminBillService.getBillHistoryForCustomer(customerId,"id");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

            if (billHistory.size()>0) {
            	System.out.println("hi2"+billHistory);
                request.setAttribute("billHistory", billHistory);
                request.setAttribute("consumerNo", billHistory.get(0).getConsumerNumber());
                RequestDispatcher dispatcher = request.getRequestDispatcher("billHistory.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("error", "Customer ID is Invalid");
                RequestDispatcher rd = request.getRequestDispatcher("searchCustomerByIdForBill.jsp");
                rd.forward(request, response);
            }
        }
        
        if(action.equals("searchByNumber")) {
        	String customerNumber = request.getParameter("consumerNumber");
            List<AdminBill> billHistory = null;
			try {
				billHistory = adminBillService.getBillHistoryForCustomer(customerNumber,"number");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

            if (billHistory.size()>0) {
            	System.out.println("hi2"+billHistory);
                request.setAttribute("billHistory", billHistory);
                request.setAttribute("consumerNo", billHistory.get(0).getConsumerNumber());
                RequestDispatcher dispatcher = request.getRequestDispatcher("billHistory.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("error", "Consumer Number is Invalid");
                RequestDispatcher rd = request.getRequestDispatcher("searchCustomerByNoForBill.jsp");
                rd.forward(request, response);
            }
        }
        
        if(action.equals("filter")) {
        	String isPaid = request.getParameter("isPaid");
        	String customerNumber = request.getParameter("customerNo");
        	System.out.println("hi"+isPaid+customerNumber);
            List<AdminBill> billHistory = null;
			try {
				billHistory = adminBillService.getBillHistoryForCustomer(customerNumber,isPaid);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

        	System.out.println("hi2"+billHistory);
            request.setAttribute("billHistory", billHistory);
            request.setAttribute("consumerNo", customerNumber);
            RequestDispatcher dispatcher = request.getRequestDispatcher("billHistory.jsp");
            dispatcher.forward(request, response);
            
        }
        
        if(action.equals("searchForValidId")) {
        	String customerId = request.getParameter("customerId");
        	System.out.println("hi"+customerId);
        	try {
				AdminCustomer result = adminBillService.checkCustomerExist(customerId);
				System.out.println("hi2"+result);
				if(result!=null) {
					 request.setAttribute("customer", result);
		            RequestDispatcher dispatcher = request.getRequestDispatcher("registerBill.jsp");
		            dispatcher.forward(request, response);
				}
				else {
					 request.setAttribute("error", "Customer Id does not exist");
		            RequestDispatcher dispatcher = request.getRequestDispatcher("generateBillForCustomerById.jsp");
		            dispatcher.forward(request, response);
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	
        	
        }
    }
}
