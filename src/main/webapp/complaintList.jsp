<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<%@ page import="java.util.List,com.bean.AdminComplaint" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Complaints List</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; }
        .container { width: 90%; margin: auto; background: white; padding: 20px; margin-top: 20px; border-radius: 5px; box-shadow: 0px 0px 10px rgba(0,0,0,0.1); }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: center; }
        th { background-color: #007bff; color: white; }
        .btn { padding: 5px 10px; border: none; cursor: pointer; }
        .btn-progress { background-color: orange; color: white; margin-bottom:5px}
        .btn-resolved { background-color: green; color: white; }
        .btn:hover { opacity: 0.8; }
    </style>
</head>
<body>

<div class="container">
	<%
	String successMessage = (String) session.getAttribute("successMessage");
		    String errorMessage = (String) session.getAttribute("errorMessage");
		    if (successMessage != null) {
	%>
	    <div style="color: green; text-align: center; margin-top: 10px;"><%=successMessage%></div>
	<%
	session.removeAttribute("successMessage");
		    }
		    if (errorMessage != null) {
	%>
	    <div style="color: red; text-align: center; margin-top: 10px;"><%=errorMessage%></div>
	<%
	session.removeAttribute("errorMessage");
		    }
	%>

    <h2>Complaints List</h2>

    <table>
        <tr>
            <th>Complaint ID</th>
            <th>Customer ID</th>
            <th>Consumer Number</th>
            <th>Complaint Type</th>
            <th>Complaint Text</th>
            <th>Date Submitted</th>
            <th>Last Updated</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>

        <%
        List<AdminComplaint> complaints = (List<AdminComplaint>) request.getAttribute("complaints");
                    if (complaints != null && !complaints.isEmpty()) {
                        for (AdminComplaint c : complaints) {
        %>
            <tr>
                 <td><%= c.getComplaintId() %></td>
	             <td><%= c.getCustomerId() %></td>
	            <td><%= c.getConsumerNumber() %></td>
	            <td><%= c.getComplaintType() %></td>
	            <td><%= c.getComplaintText() %></td>
	             <td><%= c.getCreatedAt() %></td>
	            <td><%= c.getUpdatedAt() %></td>
	             <td><%= c.getStatus() %></td>
                <td>
                    <% if ("Pending".equals(c.getStatus())) { %>
                        <form action="AdminComplaintServlet" method="post">
                            <input type="hidden" name="action" value="updateStatus">
                            <input type="hidden" name="complaintId" value="<%= c.getComplaintId() %>">
                             <input type="hidden" name="customerId" value="<%= c.getCustomerId() %>">
                            <button type="submit" name="newStatus" value="In Progress" class="btn btn-progress">In Progress</button>
                            <button type="submit" name="newStatus" value="Resolved" class="btn btn-resolved">Resolved</button>
                        </form>
                    <% } else if ("In Progress".equals(c.getStatus())) { %>
                        <form action="AdminComplaintServlet" method="post">
                            <input type="hidden" name="action" value="updateStatus">
                            <input type="hidden" name="complaintId" value="<%= c.getComplaintId() %>">
                            <input type="hidden" name="customerId" value="<%= c.getCustomerId() %>">
                            <button type="submit" name="newStatus" value="Resolved" class="btn btn-resolved">Resolved</button>
                        </form>
                    <% } %>
                </td>
            </tr>
        <% } } else { %>
            <tr><td colspan="9">No complaints found.</td></tr>
        <% } %>
    </table>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>
