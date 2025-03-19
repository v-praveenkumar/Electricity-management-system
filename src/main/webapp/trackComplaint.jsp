<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <title>Track Complaint</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
         font-family: Arial, sans-serif; text-align: center; background-color: #f4f4f4;
         }
        .form-box {
         	width: 40%; margin: 50px auto; padding: 20px; background: white; border-radius: 5px;
         }
         select, input[type="text"], input[type="submit"]
         {
          	padding: 10px; width: 90%; margin: 10px 0;
         }
        .hidden 
        {
         	display: none; 
        }
        .form-box{
        	display: flex;
        	flex-direction:column;
        	justify-content: center;
        	align-items: center;
        }
    </style>
    <script>
        function toggleInput() {
            var searchType = document.getElementById("searchType").value;
            document.getElementById("complaintIdField").style.display = (searchType === "id") ? "block" : "none";
            document.getElementById("statusField").style.display = (searchType === "status") ? "block" : "none";
        }
    </script>
</head>
<body style="background: linear-gradient(135deg, #71b7e6, #9b59b6); background-repeat: no-repeat; background-attachment: fixed;">
	<%@include file="header.jsp" %>
    <div class="form-box">
        <h2 align="center">Track Your Complaint</h2>
        <form action="ComplaintServlet" method="get">
            <label for="searchType">Search By:</label>
            <select name="searchType" id="searchType" onchange="toggleInput()">
                <option value="id">Complaint ID</option>
                <option value="status">Status</option>
            </select>

            <div id="complaintIdField">
                <label>Enter Complaint ID:</label>
                <input type="text" name="complaintId">
            </div>

            <div id="statusField" class="hidden">
                <label>Select Status:</label>
                <select name="status">
                    <option value="Pending">Pending</option>
                    <option value="In Progress">In Progress</option>
                    <option value="Resolved">Resolved</option>
                    <option value="Closed">Closed</option>
                </select>
            </div>

            <input type="hidden" name="action" value="track">
            <input type="submit" value="Track">
           <div class="text-center mt-3">
			    <a href="dashboard.jsp" class="btn" style="background: linear-gradient(135deg, #71b7e6, #9b59b6); color: white; padding: 10px 20px; border-radius: 10px; text-decoration: none; display: inline-block;">
			        <i class="fas fa-arrow-left"></i> Back
			    </a>
			</div>
        </form>
    </div>
    <%@include file="footer.jsp" %>
</body>
</html>