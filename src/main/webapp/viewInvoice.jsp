<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bean.payment, com.bean.Bills"%>
<%@ page import="java.util.*"%>

<%
// Retrieve transaction ID from request
String transactionId = request.getParameter("transactionId");

payment payment = null;
Bills bill = null;

if (transactionId != null && !transactionId.isEmpty()) {
    // DAO call will be done separately, assuming objects are fetched and set here
    payment = (payment) request.getAttribute("payment");
    bill = (Bills) request.getAttribute("bill");
}

String fullName = (String) session.getAttribute("fullName");
long consumerNumber = (long) session.getAttribute("consumerNo");
String mobileNo = (String) session.getAttribute("MobileNumber");
String customerType = (String) session.getAttribute("customerType");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Invoice</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-4">
    <h2 class="text-center mb-4">Invoice Details</h2>

    <%
    if (payment != null || bill != null) {
    %>
    <div class="card p-4 mb-4">
        <h3 class="text-success mb-4">Invoice Generated</h3>
        <div class="mb-3">
            <p><strong>Invoice Number:</strong> <%= payment.getInvoiceNumber() %></p>
            <p><strong>Payment ID:</strong> <%= payment.getPaymentId() %></p>
            <p><strong>Transaction ID:</strong> <%= payment.getTransactionId() %></p>
            <p><strong>Receipt Number:</strong> <%= payment.getReceiptNumber() %></p>
        </div>
        <hr>
        <h4 class="mb-3">Consumer Details</h4>
        <div class="mb-3">
            <p><strong>Name:</strong> <%= fullName %></p>
            <p><strong>Customer ID:</strong> <%= consumerNumber %></p>
            <p><strong>Mobile Number:</strong> <%= mobileNo %></p>
            <p><strong>Connection Type:</strong> <%= customerType %></p>
        </div>
        <hr>
        <h4 class="mb-3">Transaction Details</h4>
        <div class="mb-3">
            <p><strong>Transaction Date:</strong> <%= payment.getTransactionDate() %></p>
            <p><strong>Transaction Type:</strong> <%= payment.getTransactionType() %></p>
            <p><strong>Bill Number:</strong> <%= payment.getBillNumber() %></p>
            <p><strong>Transaction Amount:</strong> <%= payment.getTransactionAmount() %></p>
            <p><strong>Transaction Status:</strong> <%= payment.getTransactionStatus() %></p>
        </div>
    </div>
    <div class="text-center">
        <button type="button" class="btn btn-primary" onclick="window.print()">Download Invoice</button>
    </div>
    <%
    } else if (transactionId != null) {
    %>
    <div class="alert alert-danger mt-3">
        No invoice found for Transaction ID: <%= transactionId %>
    </div>
    <%
    }
    %>
</body>
</html>

<%
//  } else {
%>
<script>
    // alert("Invalid Transaction ID. Please enter a valid one.");
    // window.location.href = "invoice.jsp";
</script>
<%
// }
%>