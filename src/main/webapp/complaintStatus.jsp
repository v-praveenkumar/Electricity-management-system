<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="com.bean.Complaint" %>
 <%@ page import ="com.util.*" %>
 
 <%@ page import="java.util.List, java.util.ArrayList" %>


 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <title>Complaint Status</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
        body { font-family: Arial, sans-serif; text-align: center; background-color: #f4f4f4; }
        table { width: 80%; margin: auto; border-collapse: collapse; background: white; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: center; }
        th { background: #007BFF; color: white; }         
    </style>
</head>
<body>
	<% 
		String customerId=(String)session.getAttribute("customerId");
		long  consumerNumber=(long)session.getAttribute("consumerNo");
	%>

    <h2>Complaint Status</h2>
    <%
    Complaint complaint = (Complaint) request.getAttribute("complaint");
    List<Complaint> complaints = (List<Complaint>) request.getAttribute("complaints");
        if (complaint != null) {
    %>
    <table border="1">
        <tr><th>Complaint ID</th><th>Submission Date</th><th>Type</th><th>Status</th></tr>
        <tr>
            <td><%= complaint.getComplaintId() %></td>
            <td><%= complaint.getCreatedAt() %></td>
            <td><%= complaint.getComplaintType() %></td>
            <td><%= complaint.getStatus() %></td>
        </tr>
    </table>
    <%
        } else if (complaints != null && !complaints.isEmpty()) {
    %>
    <table border="1">
        <tr><th>Complaint ID</th><th>Submission Date</th><th>Type</th><th>Status</th></tr>
        <%
            for (Complaint c : complaints) {
        %>
        <tr>
            <td><%= c.getComplaintId() %></td>
            <td><%= c.getCreatedAt() %></td>
            <td><%= c.getComplaintType() %></td>
            <td><%= c.getStatus() %></td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        } else {
            out.println("<p>No complaint found.</p>");
        }
    %>
    
     <div class="text-center mt-3">
           <a href="trackComplaint.jsp"  class="btn btn-outline-primary">Back</a>
        </div>
    
</body>
</html>