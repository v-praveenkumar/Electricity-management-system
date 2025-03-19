<%@ page import="com.bean.Complaint" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Complaint Details</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <style>
        body { font-family: Arial, sans-serif; text-align: center; background-color: #f4f4f4; }
        table { width: 80%; margin: auto; border-collapse: collapse; background: white; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: center; }
        th { background: #007BFF; color: white; }
        
        
        	
       
        
    </style>
</head>
<body>
    <h2>Complaint Details</h2>
    <%
    	String customerId=(String)session.getAttribute("customerId");
   		long  consumerNumber=(long)session.getAttribute("consumerNo");
        Complaint complaint = (Complaint) request.getAttribute("complaint");

        if (complaint != null) {
    %>
    <table border="1">
        <tr><th>Complaint ID</th><td><%= complaint.getComplaintId() %></td></tr>
        <tr><th>Type</th><td><%= complaint.getComplaintType() %></td></tr>
        <tr><th>Submission Date</th><td><%= complaint.getCreatedAt() %></td></tr>
        <tr><th>Status</th><td><%= complaint.getStatus() %></td></tr>
        <tr><th>Description</th><td><%= complaint.getComplaintText() %></td></tr>
    </table>
    <%
        } else {
            out.println("<p>No details available.</p>");
        }
    %>
    
    <div class="text-center mt-3">
            <a href="ComplaintServlet?action=history" class="btn btn-outline-primary">Back to Home</a>
        </div>
    
</body>
</html>
