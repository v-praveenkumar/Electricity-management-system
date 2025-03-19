<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.bean.payment"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Processing payment</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<script>
	
</script>
<%
payment ptm = (payment) request.getAttribute("Success");
%>
<body class="container mt-4" style="width: 50%">

	<div id="paymentDetails" style="display: justify-content">
		<h2 class="text-success text-center">
			<font color="green">Payment Successful!</font>
		</h2>
		<div class="card p-4 mt-3">
			<h4>Transaction Details</h4>
			<p>
				<strong>Payment ID:</strong>
				<%=ptm.getPaymentId()%></p>
			<p>
				<strong>Transaction ID:</strong>
				<%=ptm.getTransactionId()%></p>
			<p>
				<strong>Receipt Number:</strong>
				<%=ptm.getReceiptNumber()%></p>
			<p>
				<strong>Transaction Date:</strong>
				<%=ptm.getTransactionDate()%></p>
			<p>
				<strong>Transaction Type:</strong>
				<%=ptm.getTransactionType()%></p>
			<p>
				<strong>Bill Number:</strong>
				<%=ptm.getBillNumber()%></p>
			<p>
				<strong>Transaction Amount:</strong> $<%=ptm.getTransactionAmount()%></p>
			<p>
				<strong>Transaction Status:</strong>
				<%=ptm.getTransactionStatus()%></p>
		</div>
			<div style="display: block ; margin-top:5%; " align="center" >
			<button type="button" class="btn btn-primary" 
				onclick="window.print()">Download Receipt</button>
			<a href="dashboard.jsp" class="btn btn-primary">Back to Home</a>
			</div>
		
		
	</div>
	<br>
	<hr>
	<a href="payment.jsp"></a>
</body>
</html>