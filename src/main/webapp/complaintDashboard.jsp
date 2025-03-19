<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Include header -->
<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Complaint Management Dashboard</title>
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
            width: 50%;
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

        .links {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
            margin-top: 20px;
        }

        .link-btn {
            display: block;
            width: 80%;
            text-align: center;
            background: linear-gradient(135deg, #71b7e6, #9b59b6);
            color: white;
            border: none;
            padding: 12px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .link-btn:hover {
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
    <h2>Complaint Management Dashboard</h2>
    
    <div class="links">
        <a href="AdminComplaintServlet?action=viewAll" class="link-btn">See All Complaints</a>
        <a href="searchComplaintsByCustomerId.jsp" class="link-btn">Search Complaints by Customer ID & Status</a>
        <a href="searchComplaintByConsumerNo.jsp" class="link-btn">Search Complaints by Consumer Number & Status</a>
    </div>

    <!-- Back Button -->
    <div class="text-center mt-3">
        <a href="AdminDashboard.jsp" class="back-btn">
            <i class="fas fa-arrow-left"></i> Back
        </a>
    </div>
</div>

<!-- Include footer -->
<jsp:include page="footer.jsp" />

</body>
</html>