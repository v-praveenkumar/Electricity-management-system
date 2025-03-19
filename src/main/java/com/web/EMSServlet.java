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

import com.bean.Bills;
import com.bean.payment;
import com.service.EMSService;

/**
 * Servlet implementation class EMSServlet
 */
@WebServlet("/EMSServlet")
public class EMSServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EMSServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 HttpSession session=request.getSession(); 
		 if(session.getAttribute("userId")==null){
			   response.sendRedirect("index.jsp");
			  
		   }
		// String userId=(String)session.getAttribute("userId");
		 long  consumerNumber=(long)session.getAttribute("consumerNo");
		EMSService service=new EMSService();
		String action = request.getParameter("action");
		RequestDispatcher rd=null;
		 if("viewBills".equals(action)) {	
			//String bill_number = request.getParameter("bill_number");
			List<Bills> billsList=service.getBillsList(consumerNumber);
			rd=request.getRequestDispatcher("Bills.jsp");
			request.setAttribute("BILLLIST", billsList);
		}
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String action = request.getParameter("action");
		RequestDispatcher rd = null;
		if ("insertPayment".equals(action)) {
			EMSService service = new EMSService();
			rd = request.getRequestDispatcher("processPayment.jsp");
			String inv = request.getParameter("invoiceNumber");
			String pay = request.getParameter("paymentId");
			String tra = request.getParameter("transactionId");
			String rec = request.getParameter("receiptNumber");
			String date = request.getParameter("transactionDate");
			String type = request.getParameter("transactionType");
			String bill = request.getParameter("billNumber");
			String amt = request.getParameter("transactionAmount");
			String status = request.getParameter("transactionStatus");
			//String[] billsToPay=request.getParameterValues("selectedBills");
			
			
			payment ptm = new payment(inv, pay, tra, rec, date, type, bill, Double.parseDouble(amt),status);
			boolean b=service.insertPaymentDetails(ptm);
            if(b==true) {
            	request.setAttribute("Success", ptm);
            }
			
			rd.forward(request, response);
		} else if ("viewInvoice".equals(action)) {
			EMSService service = new EMSService();
			payment ptm = null;
			rd = request.getRequestDispatcher("viewInvoice.jsp");
			String transactionId = request.getParameter("transactionId");
			ptm = service.viewInvoice(transactionId);
			request.setAttribute("payment", ptm);
			// request.setAttribute("bill",bills);
			rd.forward(request, response);
		}
		// doGet(request, response);
	}
	

}
