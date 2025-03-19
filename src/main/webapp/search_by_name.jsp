<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Customer by Name</title>
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

        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
            text-align: left;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        input[type="submit"] {
            background: linear-gradient(135deg, #71b7e6, #9b59b6);
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 15px;
            font-size: 18px;
            font-weight: bold;
            padding: 12px;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background: linear-gradient(135deg, #9b59b6, #71b7e6);
        }

        .error {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
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
        <h2>Search Customer by Name</h2>
        <form onsubmit="return validateCustomerName()" action="AdminEMSServlet" method="get">
            <span class="error" id="idError">
                <% if(request.getAttribute("error") != null) { %>
                    <%= request.getAttribute("error") %>
                <% } %>
            </span><br>
            <label for="customerName">Enter Customer Name:</label>
            <input type="text" name="customerName" id="customerName" required>
            <input type="hidden" name="action" value="searchByName">
            <input type="submit" value="Search">
        </form>
        <!-- Back Button -->
        <div class="text-center mt-3">
            <a href="AdminDashboard.jsp" class="back-btn">
                <i class="fas fa-arrow-left"></i> Back
            </a>
        </div>
    </div>

    <script>
        function validateCustomerName() {
            let customerName = document.getElementById("customerName").value;
            let idError = document.getElementById("idError");

            if (customerName.length < 4) {
                idError.innerHTML = "Customer Name must be of minimum 4 characters.";
                return false;
            }
            return true;
        }
    </script>

    <%@ include file="footer.jsp" %>
</body>
</html>