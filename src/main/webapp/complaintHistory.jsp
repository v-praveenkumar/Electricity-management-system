<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.List, com.bean.Complaint" %>
<!DOCTYPE html>
<html>
<head>
     <title>Complaint History</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-family: Arial, sans-serif; text-align: center; background-color: #f4f4f4; }
        table { width: 80%; margin: auto; border-collapse: collapse; background: white; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: center; }
        th { background: #007BFF; color: white; }
        .container{
        	max-width: 600px;
            margin: 20px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body style="background: linear-gradient(135deg, #71b7e6, #9b59b6); background-repeat: no-repeat; background-attachment: fixed;">
	<%@include file="header.jsp" %> 
	<div class="container">
    <h2>Complaint History</h2>
    <%
    String customerId=(String)session.getAttribute("customerId");
		long  consumerNumber=(long)session.getAttribute("consumerNo");
        List<Complaint> complaints = (List<Complaint>) request.getAttribute("complaints");
        

        if (complaints != null && !complaints.isEmpty()) {
    %>
    <table>
        <tr>
            <th>Complaint ID</th>
            <th>Type</th>
            <th>Date</th>
            <th>Status</th>
            <th>Details</th>
        </tr>
        <%
            for (Complaint c : complaints) {
        %>
        <tr>
            <td><%= c.getComplaintId() %></td>
            <td><%= c.getComplaintType() %></td>
            <td><%= c.getCreatedAt() %></td>
            <td><%= c.getStatus() %></td>
            <td><a href="ComplaintServlet?action=viewDetails&complaintId=<%= c.getComplaintId() %>">View</a></td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        } else {
            out.println("<p>No complaints found.</p>");
        }
    %>
    
     <div class="text-center mt-3">
				    <a href="dashboard.jsp" class="btn" style="background: linear-gradient(135deg, #71b7e6, #9b59b6); color: white; padding: 10px 20px; border-radius: 10px; text-decoration: none; display: inline-block;">
				        <i class="fas fa-arrow-left"></i> Back
				    </a>
	</div>
	</div>
	<%@include file="footer.jsp" %> 
   
</body>
</html>