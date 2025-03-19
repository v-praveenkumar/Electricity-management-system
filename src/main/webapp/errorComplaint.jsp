<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Oops! Something Went Wrong</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            background-color: #f8d7da; 
            text-align: center; 
            margin-top: 100px; 
        }
        .message-box {
            background-color: #f8d7da;
            color: #721c24;
            padding: 20px;
            border: 1px solid #f5c6cb;
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
            background-color: #dc3545;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        a:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div class="message-box">
        <h2>Something Went Wrong!</h2>
        <p>We could not process your complaint at the moment. Please try again later.</p>
        <a href="complaintRegistration.jsp">Go Back to Complaint Form</a>
    </div>
</body>
</html>