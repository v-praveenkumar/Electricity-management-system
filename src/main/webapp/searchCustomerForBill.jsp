<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Search</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #71b7e6, #9b59b6);
            background-repeat: no-repeat;
            background-attachment: fixed;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 40%;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .button-container {
            display: flex;
            flex-direction: column;
            gap: 15px;
            align-items: center;
            margin-top: 20px;
        }

        .button {
            width: 80%;
            padding: 12px;
            font-size: 18px;
            font-weight: bold;
            text-align: center;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .search-id {
            background: linear-gradient(135deg, #71b7e6, #9b59b6);
            color: white;
        }

        .search-id:hover {
            background: linear-gradient(135deg, #9b59b6, #71b7e6);
        }

        .search-name {
            background: linear-gradient(135deg, #71b7e6, #9b59b6);
            color: white;
        }

        .search-name:hover {
            background: linear-gradient(135deg, #9b59b6, #71b7e6);
        }

        .back-btn {
            margin-top: 20px;
            display: inline-block;
            padding: 10px 20px;
            background: linear-gradient(135deg, #71b7e6, #9b59b6);
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background 0.3s ease;
        }

        .back-btn:hover {
            background: linear-gradient(135deg, #9b59b6, #71b7e6);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Customer Search</h2>
        <div class="button-container">
            <button class="button search-id" onclick="location.href='searchCustomerByIdForBill.jsp'">Search by Customer ID</button>
            <button class="button search-name" onclick="location.href='searchCustomerByConsumerNoForBill.jsp'">Search by Consumer Number</button>
        </div>
        <!-- Back Button -->
        <div class="text-center mt-3">
            <a href="AdminDashboard.jsp" class="back-btn">
                <i class="fas fa-arrow-left"></i> Back
            </a>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>