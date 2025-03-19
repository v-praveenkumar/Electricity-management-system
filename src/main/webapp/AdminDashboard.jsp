<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
    <title>Admin Panel - Electricity Management System</title> 
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"> 
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #71b7e6, #9b59b6);
            display: flex;
            flex-direction: column;
            scroll: no-scroll;
        }

        .navbar {
            /* background: linear-gradient(135deg, #71b7e6, #9b59b6); */
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }

        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
            color: white !important;
        }

        .dropdown-menu {
            background: rgba(255, 255, 255, 0.9);
            border: none;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }

        .dropdown-item {
            color: #333 !important;
            font-weight: 500;
        }

        .dropdown-item:hover {
            background: linear-gradient(135deg, #71b7e6, #9b59b6);
            color: white !important;
        }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.2);
            border: none;
            color: white;
            font-weight: bold;
        }

        .btn-secondary:hover {
            background: rgba(255, 255, 255, 0.3);
        }

        .container {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.2);
            margin-top: 50px;
            flex: 1;
        }

        h1 {
            color: #333;
            margin-bottom: 30px;
            font-weight: bold;
        }

        .btn-primary {
            background: linear-gradient(135deg, #71b7e6, #9b59b6);
            border: none;
            padding: 15px 30px;
            font-size: 18px;
            font-weight: bold;
            transition: background 0.3s ease;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #9b59b6, #71b7e6);
        }

    </style>
    <script> 
        function toggleProfileOptions() { 
            var options = document.getElementById("profile-options"); 
            if (options.style.display === "block") { 
                options.style.display = "none"; 
            } else { 
                options.style.display = "block"; 
            } 
        } 
    </script> 
</head> 
<body> 
    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-dark"> 
        <div class="container-fluid"> 
            <span class="navbar-brand">Electricity Management</span> 
            <div class="dropdown"> 
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" onclick="toggleProfileOptions()"> 
                    <%= session.getAttribute("userId") %> 
                </button> 
                <div id="profile-options" class="dropdown-menu" aria-labelledby="dropdownMenuButton"> 
                    <a class="dropdown-item" href="">Dashboard</a> 
                    <a class="dropdown-item" href="logout.jsp">Logout</a> 
                </div> 
            </div> 
        </div> 
    </nav> 

    <!-- Main Content -->
    <div class="container mt-5 text-center"> 
        <h1>Admin Panel</h1> 
        <div class="d-grid gap-3 col-6 mx-auto"> 
            <a href="registration.jsp" class="btn btn-primary">Add a Customer</a> 
            <a href="searchCustomer.jsp" class="btn btn-primary">Search Customer By Id or Name</a> 
            <a href="generateBillForCustomerById.jsp" class="btn btn-primary">Generate Bill for a Customer</a> 
            <a href="complaintDashboard.jsp" class="btn btn-primary">View Complaints</a> 
            <a href="searchCustomerForBill.jsp" class="btn btn-primary">Search Bill by Customer ID or Customer Number</a> 
            <a href="AdminComplaintServlet?action=viewAllCustomers" class="btn btn-primary">View All Customers</a> 
        </div> 
    </div> 

    <!-- Footer -->
<!--     <footer class="footer"> 
        <div class="container text-center"> 
            <span>&copy; 2025 Electricity Management System</span> 
        </div> 
    </footer>  -->
    
    <%@include file = "footer.jsp" %>

    <!-- Bootstrap JS (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> 
</body> 
</html>