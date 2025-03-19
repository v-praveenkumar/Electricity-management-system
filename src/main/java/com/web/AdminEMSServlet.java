package com.web;

import com.bean.AdminBill;

//import jakarta.servlet.RequestDispatcher;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;

import com.bean.AdminConsumer;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.sql.Date;
import java.util.HashMap;
//import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher; 
import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 


import com.bean.AdminCustomer;
import com.service.AdminBillService;
import com.service.AdminEMSService; 
 
@WebServlet("/AdminEMSServlet") 
public class AdminEMSServlet extends HttpServlet { 
    private static final long serialVersionUID = 1L; 
    private AdminEMSService customerService = new AdminEMSService(); 
    private AdminBillService service = new AdminBillService();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 String action = request.getParameter("action");
    	 System.out.println(action+"hi");
//    	 String customerId1 = request.getParameter("id"); 
//		 System.out.println(action+customerId1+"hi");
//    	 
    	 if(action.equals("searchById")) {
    		 String customerId = request.getParameter("customerId"); 
    		 try {
    			List<AdminCustomer> adminCustomers = customerService.searchCustomerById(customerId);
				List<AdminConsumer> adminConsumers = customerService.searchConsumersById(customerId);
				
				HashMap<String,List<AdminConsumer>> consumerCustomerMapping = new HashMap<>();
				consumerCustomerMapping.put(customerId, adminConsumers);
				if(adminCustomers.size() > 0) {
					request.setAttribute("Customer", adminCustomers);
					request.setAttribute("Consumer", consumerCustomerMapping);
					RequestDispatcher rd = request.getRequestDispatcher("search_result.jsp");
					rd.forward(request, response);
				}
				else {
					request.setAttribute("error", "CustomerId is Invalid");
					RequestDispatcher rd = request.getRequestDispatcher("search_by_id.jsp");
					rd.forward(request, response);
				}
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
    	 }
    	 
    	 if(action.equals("searchByName")) {
    		 String customerName = request.getParameter("customerName"); 
    		 System.out.println(customerName);
    		 try {
    			List<AdminCustomer> adminCustomers = customerService.searchCustomerByName(customerName);
    			HashMap<String,List<AdminConsumer>> consumerCustomerMapping = customerService.searchConsumersByName(adminCustomers);
    			
//    			System.out.println("1"+customers);
//    			System.out.println("2"+consumerCustomerMapping);
				
				if(adminCustomers.size() > 0) {
					request.setAttribute("Customer", adminCustomers);
					request.setAttribute("Consumer", consumerCustomerMapping);
					RequestDispatcher rd = request.getRequestDispatcher("search_result.jsp");
					rd.forward(request, response);
				}
				else {
					request.setAttribute("error", "CustomerName is Invalid");
					RequestDispatcher rd = request.getRequestDispatcher("search_by_name.jsp");
					rd.forward(request, response);
				}
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
    	 }
    	 
    	 if(action.equals("updateCustomer")) {
    		 String customerId = request.getParameter("id"); 
    		 System.out.println(action+customerId+"hi");
    		 try {
    			List<AdminCustomer> adminCustomers = customerService.searchCustomerById(customerId);
    			System.out.println(adminCustomers);
				request.setAttribute("Customer", adminCustomers.get(0));
				RequestDispatcher rd = request.getRequestDispatcher("updateCustomer.jsp");
				rd.forward(request, response);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
    	 }
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
         
    	DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String action = request.getParameter("action");  
        
        if(action.equals("Register")) {   
        String fullName = request.getParameter("fullname"); 
          String address = request.getParameter("address"); 
          String consumerNumber = request.getParameter("consumerNumber"); 
          String phone = request.getParameter("phone"); 
          String email = request.getParameter("email"); 
          String customerType = request.getParameter("customerType"); 
          String userId = request.getParameter("userid"); 
          String password = request.getParameter("password");
           AdminCustomer adminCustomer = new AdminCustomer(Long.parseLong(consumerNumber),fullName,address,email,phone,customerType,userId,password,"Customer","null",true); 
           String result = customerService.registerCustomer(adminCustomer); 
           System.out.println(result.split("/")[0]); 
           if ("SUCCESS".equals(result.split("/")[0])) { 
              response.sendRedirect("Adminsuccess.jsp?name=" + fullName + "&email=" + email + "&customerId=" + result.split("/")[1]); 
           } 
           else { 
              request.setAttribute("errorMessage", result); 
              RequestDispatcher rd = request.getRequestDispatcher("registration.jsp"); 
              rd.forward(request, response); 
           } 
        } 
        
        if(action.equals("addConsumer")) {
          String customerId = request.getParameter("customerId"); 
          String address = request.getParameter("address"); 
          String phone = request.getParameter("phone"); 
          String email = request.getParameter("email"); 
          String customerType = request.getParameter("customerType"); 
          
          AdminConsumer adminConsumer = new AdminConsumer("",customerId,address,phone,email,customerType);
          String result = customerService.registerConsumer(adminConsumer); 
          System.out.println(result.split("/")[0]); 
           if ("SUCCESS".equals(result.split("/")[0])) { 
              response.sendRedirect("consumerAdminsuccess.jsp?consumerId=" + result.split("/")[1] + "&customerId=" + customerId); 
           } 
           else { 
              request.setAttribute("errorMessage", result);
              request.setAttribute("customerId", customerId);
              RequestDispatcher rd = request.getRequestDispatcher("consumerRegistration.jsp"); 
              rd.forward(request, response); 
           } 
        }
        
        if(action.equals("update")) {   
              String fullName = request.getParameter("fullname"); 
              String address = request.getParameter("address"); 
              String consumerNumber = request.getParameter("consumerNumber"); 
              String phone = request.getParameter("phone"); 
              String email = request.getParameter("email"); 
              String customerType = request.getParameter("customerType"); 
              String userId = request.getParameter("userid"); 
              String customerId = request.getParameter("customerId");
               AdminCustomer adminCustomer = new AdminCustomer(Long.parseLong(consumerNumber),fullName,address,email,phone,customerType,userId,"null","Customer",customerId,true); 
               String result = customerService.updateCustomer(adminCustomer); 
               System.out.println(result.split("/")[0]); 
               if ("SUCCESS".equals(result.split("/")[0])) { 
                  response.sendRedirect("Adminsuccess.jsp?name=" + fullName + "&email=" + email + "&customerId=" + result.split("/")[1] +"&update=true"); 
               } 
               else { 
                  request.setAttribute("errorMessage", result); 
                  RequestDispatcher rd = request.getRequestDispatcher("registration.jsp"); 
                  rd.forward(request, response); 
               } 
         } 
        
        if("registerBill".equals(action))
		{	
        	long consumerNumber = Long.parseLong(request.getParameter("consumerNumber"));
        	// Parsing billing period correctly
        	String billingPeriod = request.getParameter("billingYear") + "-" + request.getParameter("billingMonth") + "-01";
        	Date Bp;
			Bp = Date.valueOf(billingPeriod);
			
			System.out.println(Bp);
			LocalDate tempBillDate = LocalDate.now();
			Date billDate = Date.valueOf(tempBillDate);

			LocalDate tempDueDate = tempBillDate.plusDays(15);
			Date dueDate = Date.valueOf(tempDueDate);

			LocalDate tempDisconnectionDate = tempDueDate.plusDays(120);
			Date disconnectionDate = Date.valueOf(tempDisconnectionDate);

			double amountDue = Double.parseDouble(request.getParameter("amountDue"));
			double payableAmount = amountDue;
			boolean isPaid = false;
			String connectionType = request.getParameter("connectionType");
			String connectionStatus = request.getParameter("connectionStatus");
			String mobileNumber = request.getParameter("mobileNumber");

			boolean check;
			try {
				check = service.checkBill(consumerNumber, billingPeriod);
				System.out.println("h2"+check);
				if (!check) {
				    // Pass correctly formatted Date objects to the constructor
				    AdminBill adminBill = new AdminBill(0, consumerNumber, Bp, billDate, dueDate, disconnectionDate, amountDue, payableAmount, isPaid, connectionType, connectionStatus, mobileNumber);
				    System.out.println("h2"+check);
				    AdminBill rs;
					try {
						rs = service.registerBill(adminBill);
						System.out.println(rs);
						RequestDispatcher rd = request.getRequestDispatcher("registerBillAcknowleadgement.jsp");
			    	    request.setAttribute("CHECK", check);
			    	    request.setAttribute("LIST", rs);
			    	    rd.forward(request, response);
					} catch (ClassNotFoundException | SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				    
				} else {
					RequestDispatcher rd = request.getRequestDispatcher("registerBillAcknowleadgement.jsp");
				    request.setAttribute("CHECK", check);
				    rd.forward(request, response);
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

        	// Converting LocalDate to Date
        	
        	
				
		}
	
         
    } 
}