package com.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Customer;
import com.dao.CustomerDao;
import com.util.PasswordUtil;
import com.util.Validation;

@WebServlet("/ElectricityServlet")
public class ElectricityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ElectricityServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action = request.getParameter("action");
		if ("register".equals(action)) {
			handleRegistration(request, response);
		} else if ("login".equalsIgnoreCase(action)) {
			handleCustomerLogin(request, response);
		} 
		
	}

	private void handleRegistration(HttpServletRequest request, HttpServletResponse response) {

		

		String consumerNumber = request.getParameter("consumerNumber");
		String fullName = request.getParameter("fullName");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String mobileNumber = request.getParameter("mobile");
		String customerType = request.getParameter("customerType");
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		
		System.out.println(consumerNumber);

		if (!Validation.passwordStrengthValidate(password)) {

			request.setAttribute("errorMessage", "Weak Password!");
			try {
				request.getRequestDispatcher("register.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return;

		}

		if (!password.equals(confirmPassword)) {
			request.setAttribute("errorMessage", "Passwords do not match!");
			try {
				request.getRequestDispatcher("register.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return;
		}

		if (!Validation.emailValidation(email)) {
			request.setAttribute("errorMessage", "Invalid Email Id!");
			try {
				request.getRequestDispatcher("register.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return;
		}

		if (!Validation.mobileValidate(mobileNumber)) {
			request.setAttribute("errorMessage", "Invalid Mobile Number!");
			try {
				request.getRequestDispatcher("register.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return;
		}

		CustomerDao customer = new CustomerDao();

		if (customer.isUserIdExists(userId)) {
			request.setAttribute("errorMessage", "UserId Already Exist!");
			try {
				request.getRequestDispatcher("register.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return;
		}

		if (customer.isCustomerNumberExists(consumerNumber)) {
			request.setAttribute("errorMessage", "CustomerNumber Already Exist!");
			try {
				request.getRequestDispatcher("register.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return;
		}

		String hashedPassword = PasswordUtil.hashPassword(password);

		Boolean success = customer.registerCustomer(Long.parseLong(consumerNumber), fullName, address, email,
				mobileNumber, customerType, userId, hashedPassword);
		if (success) {
			HttpSession session = request.getSession();
			session.setAttribute("consumerNumber", consumerNumber);
			session.setAttribute("customerId", userId);
			session.setAttribute("userId", userId);
			session.setAttribute("email", email);
			try {
				request.getRequestDispatcher("success.jsp").forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		} else {
			request.setAttribute("errorMessage", "Registration failed Try again later");
			try {
				request.getRequestDispatcher("register.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	private void handleCustomerLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String userId = request.getParameter("userId");
	        String password = request.getParameter("password");
	        System.out.println(password);
	        
	        
	        CustomerDao dao = new CustomerDao();
	        Customer customer=null;
			try {
				customer = dao.getCustomerByIdAndPassword(userId, password);
				
				System.out.print(customer != null);
				  if (customer != null) {
					  
				HttpSession session = request.getSession();
	            session.setAttribute("userId", customer.getUserID());
	            session.setAttribute("consumerNo", customer.getConsumerNumber());
	            session.setAttribute("fullName", customer.getFullName());
	            session.setAttribute("address", customer.getAddress());
	            session.setAttribute("email", customer.getEmail());
	            session.setAttribute("MobileNumber",customer.getMobileNumber());
	            session.setAttribute("customerId", customer.getCustomerID());
	            session.setAttribute("customerType", customer.getCustomerType());
	            
	            RequestDispatcher rd=request.getRequestDispatcher("dashboard.jsp");
	            rd.forward(request, response);
	            
	            System.out.println(customer.getFullName());
	            System.out.println(customer.getUserID());
	            System.out.println(customer.getConsumerNumber());
	            System.out.println(customer.getAddress());
	            System.out.println(customer.getEmail());
	            System.out.println(customer.getMobileNumber());
	            System.out.println(customer.getCustomerType());
	            System.out.println(customer.getCustomerID());
				  }else {
		            request.setAttribute("errorMessage", "Invalid UserID or Password!");
		           
						request.getRequestDispatcher("index.jsp").forward(request, response);
		        }
			} catch (ClassNotFoundException e1) {
				e1.printStackTrace();
			}
			catch(Exception e) {
				System.out.println(e.getMessage());
			}
	         
	    }

	
}
