<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.*"%>
<%

String[] billsToPay=request.getParameterValues("selectedBills");
String[] paymentMethod=request.getParameterValues("paymentMethod");
String cardName="";
if("credit".equalsIgnoreCase(paymentMethod[0])){
	cardName="Credit Card";
}else{
	cardName="Debit Card";
}
double amount=0;
String billNumber = "";
if (billsToPay == null) {
	out.println("<p>No bills selected. <a href='Bills.jsp'>Go Back</a></p>");
} else {
	try {
		Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
		Connection conn = DriverManager.getConnection("jdbc:derby:C:\\Users\\2731806\\MyDB;create=true");

		for(String billNum:billsToPay){
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM Bills WHERE BillID = ?");
			ps.setString(1, billNum);
			ResultSet rs = ps.executeQuery();
		
			if (rs.next()) {
				double amt = rs.getDouble("PayableAmount");
				amount +=amt ;
				billNumber += billNum+", ";
		 }
			billNumber=billNumber.substring(0,billNumber.length()-2);
			rs.close();
			ps.close();
    }
 conn.close();
	

// change it later
// Simulate Payment ID and Transaction Details
String invoiceNumber = "INV" + System.currentTimeMillis();
String paymentId = "PAY" + System.currentTimeMillis();
String transactionId = "TXN" + System.currentTimeMillis();
String receiptNumber = "REC" + System.currentTimeMillis();
String transactionDate = new java.util.Date().toString();
String transactionType = paymentMethod[0];// Change it later
String transactionStatus = "Success";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Page</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script>

    function expDate(val){
    	let exp=document.getElementById("expiryDate");
    	
    	if(val.length==2){
    		if(exp.value>12){
    			exp.value="";
    		}else
    		  exp.value+="/";	
    	}
    }
	function onlyNumberKey(evt) {
		let ASCIICode = (evt.which) ? evt.which : evt.keyCode
		if (ASCIICode > 31 && (ASCIICode<48||ASCIICode>57))
			return false;
		return true;
	}
	function paymentAlert() {
		let cardNumber = document.getElementById("cardNumber").value;
		let expiryDate = document.getElementById("expiryDate").value;
		let cvv = document.getElementById("cvv").value;
		let amount = document.getElementById("amount").value;
		let errorMessage = ""; // Card Number Validation (Should be 13-19 digits) 
		let cardRegex = /^\d{13,19}$/;
		let cvvRegex = /^\d{3,4}$/;
		if (!cardRegex.test(cardNumber)) {
			errorMessage += "Invalid Card Number. It should be 13 to 19 digits.\n";
		} // Expiry Date Validation (Should be in future) 
		let today = new Date();
		let inputDate = new Date(expiryDate + "-01");
		if (inputDate <= today) {
			errorMessage += "Card is expired.\n";
		}
		// CVV Validation (3 or 4 digits) let cvvRegex = /^\d{3,4}$/; 
		if (!cvvRegex.test(cvv)) {
			errorMessage += "Invalid CVV. It should be 3 or 4 digits.\n";
		}
		// Amount Validation (Should be greater than zero) 

		if (errorMessage !== "") {
			alert(errorMessage);
			return false;
		}
		return confirm("Please confirm your payment details before submission."
				+ errorMessage);
	}
</script>
<style>
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}
</style>
</head>
<body class="container mt-4" style="width: 50%">
	<h2 class="text-center">Secure Payment</h2>
	<form action="EMSServlet" method="post"
		onsubmit="return paymentAlert()">
		<div class="mb-3">
			<label for="cardNumber" class="form-label">Card Number</label> <input
				type="text" maxlength="19" id="cardNumber" name="cardNumber"
				class="form-control" onkeypress="return onlyNumberKey(event)"
				required>
		</div>
		<div class="mb-3">
			<label for="expiryDate" class="form-label">Expiry Date
				</label> <input type="text" id="expiryDate" name="expiryDate" oninput="expDate(this.value)"
				class="form-control" placeholder="--/----" maxlength="7"required>
		</div>
		<div class="mb-3">
			<label for="cvv" class="form-label">CVV</label> <input
				type="password" id="cvv" name="cvv" class="form-control" required
				onkeypress="return onlyNumberKey(event)" maxlength="4">
		</div>
		<div class="mb-3">
			<label for="card" class="form-label">Selected Card </label> <input
				type="text" value=<%=cardName %>  class="form-control" disabled
				 >
		</div>
		<div class="mb-3">
			<label for="amount" class="form-label">Total Amount</label> <input
				type="number" id="amount" name="amount" class="form-control" value=<%=amount %> disabled>
		</div>
		<input type="hidden" name="PaidBillId" value="<%= billsToPay%>">
		<input type="hidden" name="invoiceNumber" value="<%=invoiceNumber%>">
		<input type="hidden" name="paymentId" value="<%=paymentId%>">
		<input type="hidden" name="transactionId" value="<%=transactionId%>">
		<input type="hidden" name="receiptNumber" value="<%=receiptNumber%>">
		<input type="hidden" name="transactionDate"
			value="<%=transactionDate%>"> <input type="hidden"
			name="transactionType" value="<%=transactionType%>"> <input
			type="hidden" name="billNumber" value="<%=billNumber%>"> <input
			type="hidden" name="transactionAmount" value="<%=amount%>"> <input
			type="hidden" name="transactionStatus" value="<%=transactionStatus%>">

		<button type="submit" name="action" value="insertPayment"
			class="btn btn-primary w-100">Pay Now</button>

	</form>

	<%
}catch(Exception e){
	System.out.println(e.getMessage());
	
}
}%>
</body>
</html>
