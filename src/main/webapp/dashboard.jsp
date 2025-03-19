<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

<style>
 <style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Montserrat', sans-serif;
        background: linear-gradient(135deg, #71b7e6, #9b59b6);
        background-repeat: no-repeat;
        min-height: 100vh;
        padding-top: 80px; /* Space for fixed header */
        padding-bottom: 60px; /* Space for fixed footer */
    }

    /* Main Content */
    .main-content {
        max-width: 1200px;
        margin: 20px auto;
        background: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
    }

    /* Welcome Section */
    .welcome-section {
        text-align: center;
        margin-bottom: 40px;
    }

    .welcome-section h2 {
        font-size: 28px;
        font-weight: bold;
        color: #333;
        margin-bottom: 10px;
    }

    .welcome-section p {
        font-size: 16px;
        color: #555;
    }

    /* Feature Links */
    .feature-links {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 20px;
        margin-bottom: 30px;
    }

    .feature-item {
        background: #f8f9fa;
        border-radius: 10px;
        padding: 20px;
        text-align: center;
        text-decoration: none;
        color: #333;
        font-weight: bold;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    }

    .feature-item:hover {
        background: #e9ecef;
        transform: translateY(-5px);
        box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.2);
    }

    .feature-item i {
        font-size: 24px;
        margin-bottom: 10px;
        color: #9b59b6;
    }

    /* Bill Summary */
    .bill-summary {
        background: #f8d7da;
        border: 1px solid #f5c6cb;
        padding: 20px;
        border-radius: 10px;
        margin-bottom: 30px;
    }

    .bill-summary h3 {
        font-size: 20px;
        color: #721c24;
        margin-bottom: 15px;
    }

    .bill-summary p {
        font-size: 16px;
        color: #721c24;
        margin: 8px 0;
    }

    .pay-now-btn {
        display: inline-block;
        padding: 10px 20px;
        background: linear-gradient(135deg, #71b7e6, #9b59b6);
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        font-size: 16px;
        transition: background 0.3s ease;
    }

    .pay-now-btn:hover {
        background: linear-gradient(135deg, #9b59b6, #71b7e6);
    }
</style>

</style>

</head>
<body>
  

	<% 
		String userId=(String)session.getAttribute("userId");
		String fullName=(String)session.getAttribute("fullName");
		long  consumerNumber=(long)session.getAttribute("consumerNo");
		String address=(String)session.getAttribute("address");
		String mail=(String)session.getAttribute("mail");
		String mobileNo=(String)session.getAttribute("MobileNumber");
		String customerId=(String)session.getAttribute("customerId");
		String customerType=(String)session.getAttribute("customerType");
		String billingPeriod="";
		String dueDate="";
		String amountDue="";
		boolean isUnpaid=false;
		
	
		String customerName=(String)session.getAttribute("fullName");
		if(userId==null){
			response.sendRedirect("index.jsp");
			return;
		}
	%>
	
    <%@include file="header.jsp" %>
    <!-- Main Content -->
    <div class="main-content">
        <!-- Welcome Section -->
        <div class="welcome-section">
            <h2>Welcome, <%= fullName %>!</h2>
            <p>Account Number: <%=consumerNumber%></p>
        </div>
        
        <!-- Feature Links -->
        <div class="feature-links">
            <a href="EMSServlet?action=viewBills" class="feature-item">View Bills</a>
            <a href="EMSServlet?action=viewBills" class="feature-item">Pay Bill</a>
            <a href="billHistory.jsp" class="feature-item">Bill History</a>
            <a href="complaintRegistration.jsp" class="feature-item">Register Complaint</a>
            <a href="trackComplaint.jsp"  class="feature-item">Track Complaint Status</a>
            <a href="ComplaintServlet?action=history"  class="feature-item">View Complaint History</a>
            <a href="invoice.jsp" class="feature-item">View Invoice</a>
        </div>
	    <div class="text-center mt-3">
		    <a href="index.jsp" class="btn" style="background: linear-gradient(135deg, #71b7e6, #9b59b6); color: white; padding: 10px 20px; border-radius: 10px; text-decoration: none; display: inline-block;">
		        <i class="fas fa-arrow-left"></i> Back
		    </a>
		</div>
        
    </div>
	<%@include file="footer.jsp" %> 	
	
	
</body>
</html>