<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bean.AdminBill" %>

<!-- Include header -->
<jsp:include page="header.jsp" />

<%
AdminBill bill = (AdminBill) request.getAttribute("billDetails");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bill Details</title>
    
    <style>
        body { 
            font-family: Arial, sans-serif; 
            margin: 0; 
            padding: 0; 
            background-color: #f4f4f4; 
            text-align: center; 
        } 
        .container {
            width: 50%;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
            margin-top: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .bill-details {
            margin-top: 20px;
        }
        .bill-details table {
            width: 100%;
            border-collapse: collapse;
        }
        .bill-details th, .bill-details td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        .bill-details th {
            background-color: #007bff;
            color: white;
        }
        .download-btn {
            display: block;
            width: 100%;
            text-align: center;
            margin-top: 20px;
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
        }
        .download-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Bill Details</h2>

    <div class="bill-details">
        <table>
            <tr>
                <th>Consumer Number</th>
                <td><%= bill.getConsumerNumber() %></td>
            </tr>
            <tr>
                <th>Billing Period</th>
                <td><%= bill.getBillingPeriod() %></td>
            </tr>
            <tr>
                <th>Bill Date</th>
                <td><%= bill.getBillDate() %></td>
            </tr>
            <tr>
                <th>Due Date</th>
                <td><%= bill.getDueDate() %></td>
            </tr>
            <tr>
                <th>Amount Due</th>
                <td>₹<%= bill.getAmountDue() %></td>
            </tr>
            <tr>
                <th>Payable Amount</th>
                <td>₹<%= bill.getPayableAmount() %></td>
            </tr>
            <tr>
                <th>Payment Status</th>
                <td><%= bill.isPaid() ? "Paid" : "Unpaid" %></td>
            </tr>
            <tr>
                <th>Disconnection Date</th>
                <td><%= (bill.getDisconnectionDate() != null) ? bill.getDisconnectionDate() : "N/A" %></td>
            </tr>
        </table>
    </div>

    <!-- Download Bill Button -->
    <button class="download-btn" onclick="printBill()"> Download Bill</button>
    <script>
    	function printBill(){
    		window.print();
    	}
    </script>
</div>

<!-- Include footer -->
<jsp:include page="footer.jsp" />

</body>
</html>
