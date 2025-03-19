<%@ page import="java.util.List,com.bean.AdminComplaint" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Include header -->
<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Complaints</title>
    <style>
    .filter-container {
            margin: 20px;
            padding: 10px;
           
            display: flex;
            align-items:center;
            justify-content:center;
        }
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; }
        .container { width: 90%; margin: auto; background: white;margin-top:40px; padding: 20px; border-radius: 5px; box-shadow: 0px 0px 10px rgba(0,0,0,0.1); }
        h2 { text-align: center; color: #333; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: center; }
        th { background-color: #007bff; color: white; }
        tr:nth-child(even) { background-color: #f2f2f2; }
        .btn { text-decoration: none; background: #28a745; color: white; padding: 5px 10px; border-radius: 3px; }
        .btn:hover { background: #218838; }
        #dateError{
        	display:none;
        	color:red;
        	justify-content:center;
        	align-items:center;
        }
    </style>
</head>
<body style="background: linear-gradient(135deg, #71b7e6, #9b59b6); background-repeat: no-repeat; background-attachment: fixed;">

<div class="container">

	<h2>All Complaints</h2>
	<span id="dateError"><h5>End date must be greater than Start Date</h5></span>
	
	<div class="filter-container">
	    <form onsubmit="return validateDateRange()" action="AdminComplaintServlet" method="post">
	        <input type="hidden" name="action" value="filterByDate">
	        <label for="startDate"><b>Start Date:</b></label>
	        <input type="date" id="startDate" name="startDate" required>
	        <label for="endDate"><b>End Date:</b></label>
	        <input type="date" id="endDate" name="endDate" required>
	
	        <button type="submit">Filter</button>
	    </form>
	</div>
    

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
           <!--   <td><a href="complaintDetails.jsp?complaintId=<%= c.getComplaintId() %>" class="btn">View</a></td> -->
        </tr>
        <% } } else { %>
        <tr><td colspan="9">No complaints found.</td></tr>
        <% } %>
    </table>
    <div class="text-center mt-3">
				    <a href="index.jsp" class="btn" style="background: linear-gradient(135deg, #71b7e6, #9b59b6); color: white; padding: 10px 20px; border-radius: 10px; text-decoration: none; display: inline-block;">
				        <i class="fas fa-arrow-left"></i> Back
				    </a>
	</div>
    
    
    <script>
		function validateDateRange() {
		    let startDate = document.getElementById("startDate").value;
		    let endDate = document.getElementById("endDate").value;
		    let errorSpan = document.getElementById("dateError");
		
		    if (startDate && endDate) {
		        let startD = new Date(startDate);
			    let endD = new Date(endDate);
			    console.log(startD > endD);
			    if(startD > endD){			    	
		        	errorSpan.style.display = "flex";
			        return false;  // Prevent form submission
			    }

		    } else {
		        errorSpan.style.display = "none";
		        return true;   // Allow form submission
		    }
		}
	</script>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>