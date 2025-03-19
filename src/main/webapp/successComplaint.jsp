<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <title>Complaint Registered Successfully</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { 
            font-family: Arial, sans-serif; 
            background-color: #e9f7ef; 
            text-align: center; 
            margin-top: 100px; 
        }
        .message-box {
            background-color: #d4edda;
            color: #155724;
            padding: 20px;
            border: 1px solid #c3e6cb;
            display: inline-block;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }
        p {
            font-size: 18px;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        a:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="message-box">
        <h2>Complaint Registered Successfully!</h2>
        <p>Your complaint ID is: <strong><%= request.getAttribute("complaintId") %></strong></p>
        <p>We will get back to you shortly. Thank you for your patience.</p>
        <a href="dashboard.jsp">Back to Home</a>
    </div>
</body>
</html>