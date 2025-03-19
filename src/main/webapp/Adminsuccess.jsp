<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
    <title>Registration Successful - Electricity Management System</title> 
    <style> 
        body { 
            font-family: Arial, sans-serif; 
            margin: 0; 
            padding: 0; 
            background-color: #f4f4f4; 
            text-align: center; 
        } 
        .container { 
            margin: 50px auto; 
            width: 50%; 
            background: white; 
            padding: 20px; 
            border-radius: 8px; 
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
            display: flex; 
            flex-direction: column; 
            align-items: center; 
            justify-content: center; 
        } 
        .heading { 
            font-size: 28px; 
            margin-bottom: 20px; 
            font-weight: bold; 
            color: #28a745; 
        } 
        .message { 
            font-size: 18px; 
            margin-bottom: 15px; 
            color: #333; 
        } 
        .info { 
            font-size: 16px; 
            font-weight: bold; 
            margin-bottom: 10px; 
            color: #555; 
        } 
        .button { 
            background-color: #007BFF; 
            color: white; 
            padding: 10px 15px; 
            border: none; 
            cursor: pointer; 
            font-size: 16px; 
            border-radius: 5px; 
            width: auto; 
            text-decoration: none; 
            display: inline-block; 
            margin-top: 10px; 
        } 
        .button:hover { 
            background-color: #0056b3; 
        } 
    </style> 
</head> 
<body> 
 
    <%@ include file="header.jsp" %> 
 
    <div class="container"> 
    	<% if(request.getParameter("update")== null){ %>
	       <div class="heading">Registration Successful!</div> 
	       <div class="message">The customer has been added successfully.</div> 
	       <div class="info">Customer ID: <strong><%= request.getParameter("customerId") %></strong></div> 
	       <div class="info">Customer Name: <strong><%= request.getParameter("name") %></strong></div> 
	       <div class="info">Email: <strong><%= request.getParameter("email") %></strong></div> 
	       <p>Please add at least one Consumer ID to complete the setup.</p>
	       <a href="consumerRegistration.jsp?id=${param.customerId}" class="button">Add Consumer</a>
	       <a href="index.jsp" class="button">Go to Dashboard</a> 
	     <% } else{ %>
	     	<div class="heading">Updation Successful!</div> 
	       <div class="message">The customer has been updated successfully.</div> 
	       <div class="info">Customer ID: <strong><%= request.getParameter("customerId") %></strong></div> 
	       <div class="info">Customer Name: <strong><%= request.getParameter("name") %></strong></div> 
	       <div class="info">Email: <strong><%= request.getParameter("email") %></strong></div> 
	       <a href="index.jsp" class="button">Go to Dashboard</a> 
	     
	     <%} %>
    </div> 
 
</body> 
</html>