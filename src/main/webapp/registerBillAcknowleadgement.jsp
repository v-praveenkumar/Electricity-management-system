<%@page import="com.bean.AdminBill"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f9;
        }
        .card-header {
            background: #198754;
            color: white;
            border-radius: 0.375rem 0.375rem 0 0 !important;
        }
        .detail-table td {
            padding: 1rem;
            border-color: #e9ecef;
        }
        .detail-table tr:nth-child(odd) {
            background-color: #f8f9fa;
        }
        .status-badge {
            font-size: 0.9em;
            padding: 0.5em 0.75em;
        }
        .action-btn {
            border-radius: 20px;
            padding: 0.5rem 1.5rem;
        }
    </style>
</head>
<body class="container mt-5">
    <div class="text-center mb-5">
        <h1 class="text-success fw-bold display-4">EBS</h1>
        <div class="hr bg-success" style="height: 3px; width: 80px; margin: 0 auto;"></div>
    </div>

    <%
    boolean status = (boolean) request.getAttribute("CHECK");
        if (!status) { 
        AdminBill bill = (AdminBill) request.getAttribute("LIST");
        if(bill != null){
    %>    
    <div class="card shadow-lg border-0 mb-5">
        <div class="card-header">
            <h4 class="mb-0">Bill Generated Successfully!</h4>
        </div>
        <div class="card-body p-4">
            <h3 class="text-center text-success mb-4">Invoice Details</h3>
            
            <table class="table detail-table">
                <tbody>
                    <tr><td class="fw-bold">Bill ID</td><td><%= bill.getBillID() %></td></tr>
                    <tr><td class="fw-bold">Consumer Number</td><td><%= bill.getConsumerNumber() %></td></tr>
                    <tr><td class="fw-bold">Billing Period</td><td><%= bill.getBillingPeriod() %></td></tr>
                    <tr><td class="fw-bold">Bill Date</td><td><%= bill.getBillDate() %></td></tr>
                    <tr><td class="fw-bold">Due Date</td><td><%= bill.getDueDate() %></td></tr>
                    <tr><td class="fw-bold">Disconnection Date</td><td><%= bill.getDisconnectionDate() %></td></tr>
                    <tr><td class="fw-bold">Amount Due</td><td>Rs<%= bill.getAmountDue() %></td></tr>
                    <tr><td class="fw-bold">Payable Amount</td><td>Rs<%= bill.getPayableAmount() %></td></tr>
                    <tr><td class="fw-bold">Payment Status</td><td>
                        <span class="status-badge badge rounded-pill bg-<%= bill.isPaid() ? "success" : "danger" %>">
                            <%= bill.isPaid() ? "Paid" : "Unpaid" %>
                        </span>
                    </td></tr>
                    <tr><td class="fw-bold">Connection Type</td><td><%= bill.getConnectionType() %></td></tr>
                    <tr><td class="fw-bold">Connection Status</td><td><%= bill.getConnectionStatus() %></td></tr>
                </tbody>
            </table>

            <div class="text-center mt-4">
                <button class="btn btn-success action-btn" onclick="downloadInvoice()" id="download">
                    <i class="bi bi-download me-2"></i>Download Invoice
                </button>
               
            </div>
        </div>
    </div>

    <% } else { %>
    <div class="card shadow border-0">
        <div class="card-body text-center py-5">
            <h4 class="text-danger mb-4">Invalid Consumer Details!</h4>
            <div class="d-grid gap-3 d-md-block">
                <a href="index.jsp" class="btn btn-success action-btn px-4">Home</a>
                <a href="registerBill.jsp" class="btn btn-outline-secondary action-btn px-4">Back</a>
            </div>
        </div>
     </div>
    <% }
    }
    else{%>
    <div class="card shadow border-0">
        <div class="card-body text-center py-5">
            <h4 class="text-warning mb-4">Bill Already Exists!</h4>
            <div class="d-grid gap-3 d-md-block">
                <a href="index.jsp" class="btn btn-success action-btn px-4">Home</a>
               
            </div>
        </div>
     </div>  
    <%} %>
    
    <script>
        function downloadInvoice() {
           
            window.print();
            
        }

    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%@ include file="footer.jsp" %>