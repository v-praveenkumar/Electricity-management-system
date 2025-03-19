<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.bean.AdminBill" %>
<%
List<AdminBill> billHistory = (List<AdminBill>) request.getAttribute("billHistory");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bill History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body { 
            font-family: Arial, sans-serif; 
            margin: 0; 
            padding: 0; 
            background-color: #f4f4f4; 
            text-align: center; 
        } 
        .container {
            width: 90%;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
            margin-bottom:50px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .filter-section {
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            margin-right: 10px;
        }
        select, input[type="submit"] {
            padding: 8px;
            margin-right: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        .view-btn {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 8px 15px;
            text-decoration: none;
            border-radius: 5px;
        }
        .view-btn:hover {
            background-color: #218838;
        }
        #isPaid{
        	height:40px;
        	width:70px;
        }
        .filter{
        	width:120px;
        	margin-left:20px;
        }
    </style>
</head>
<body>

<%@include file="header.jsp" %> 
<div class="container">
    <h2>Bill History</h2>
    <h5><%
    if(request.getAttribute("error")!=null){
    %><%=request.getAttribute("error")%><%
    }
    %></h5>
    
    <!-- Filter Section -->
    <form action="BillHistoryServlet" method="post" class="filter-section">
        <input type="hidden" name="action" value="filter">
        <input type="hidden" name="customerNo" value=<%=request.getAttribute("consumerNo")%>>
        <label for="isPaid">Filter by Payment Status:</label>
        <select name="isPaid" id="isPaid">
            <option value="All">All</option>
            <option value="true">Paid</option>
            <option value="false">Unpaid</option>
        </select>

       
        <input type="submit" value="Filter" class="filter view-btn">
    </form>

    <!-- Bill History Table -->
    <table>
        <thead>
            <tr>
                <th>Consumer Number</th>
                <th>Bill Date</th>
                <th>Is Paid</th>
                <th>View Details</th>
            </tr>
        </thead>
        <tbody>
            <%
            if (billHistory != null && !billHistory.isEmpty()) { 
                            for (AdminBill bill : billHistory) {
            %>
                    <tr>
                        <td><%= bill.getConsumerNumber() %></td>
                        <td><%= bill.getBillDate() %></td>
                        <td><%= bill.isPaid() ? "Yes" : "No" %></td>
                        <td>
                            <a href="BillHistoryServlet?billId=<%= bill.getBillID() %>" class="new view-btn">View Details</a>
                        </td>
                    </tr>
                <% } 
            } else { %>
                <tr>
                    <td colspan="4">No bills found.</td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<div class="text-center mt-3">
				    <a href="dashboard.jsp" class="btn" style="background: linear-gradient(135deg, #71b7e6, #9b59b6); color: white; padding: 10px 20px; border-radius: 10px; text-decoration: none; display: inline-block;">
				        <i class="fas fa-arrow-left"></i> Back
				    </a>
	</div>

<!-- Include footer -->
<%@include file="footer.jsp" %> 

</body>
</html>