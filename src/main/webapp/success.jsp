<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Successful</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        background: linear-gradient(135deg, #71b7e6, #9b59b6);
    }

    .success-container {
        background: rgba(255, 255, 255, 0.9);
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2);
        text-align: center;
        max-width: 500px;
        width: 100%;
    }

    .success-container h2 {
        color: #333;
        margin-bottom: 20px;
        font-size: 24px;
    }

    .success-container h3 {
        color: #555;
        margin: 15px 0;
        font-size: 18px;
    }

    .success-container button {
        background: linear-gradient(135deg, #71b7e6, #9b59b6);
        color: white;
        border: none;
        padding: 12px 20px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        margin-top: 20px;
        transition: background 0.3s ease;
    }

    .success-container button:hover {
        background: linear-gradient(135deg, #9b59b6, #71b7e6);
    }
</style>
</head>
<body>
    <div class="success-container">
        <h2>Registration Successful!</h2>
        <% 
            String consumerNumber = (String) session.getAttribute("consumerNumber");
            String userId = (String) session.getAttribute("userId");
            String mail = (String) session.getAttribute("email");
        %>
        <h2>Thank you for registering.</h2>
        <h3>Your Customer Number: <%= consumerNumber %></h3>
        <h3>Your User ID: <%= userId %></h3>
        <h3>Your Email: <%= mail %></h3>
        <a href="index.jsp"><button>Login</button></a>
    </div>
</body>
</html>