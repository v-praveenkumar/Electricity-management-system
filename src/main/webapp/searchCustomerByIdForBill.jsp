<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Customer</title>
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

        input[type="text"] {
            width: 80%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        button {
            background: linear-gradient(135deg, #71b7e6, #9b59b6);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background 0.3s ease;
        }

        button:hover {
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
        <h2>Search Customer</h2>
        <form onsubmit="return validateCustomerId()" action="BillHistoryServlet" method="post">
            <span class="error" id="idError">
                <% if(request.getAttribute("error") != null) { %>
                    <%= request.getAttribute("error") %>
                <% } %>
            </span><br>
            <input type="hidden" name="action" value="searchById">
            <input type="text" name="customerId" id="customerId" placeholder="Enter Customer ID">
            <br>
            <button type="submit">Search</button>
        </form>
        <!-- Back Button -->
        <div class="text-center mt-3">
            <a href="AdminDashboard.jsp" class="back-btn">
                <i class="fas fa-arrow-left"></i> Back
            </a>
        </div>
    </div>

    <script>
        function validateCustomerId() {
            let customerId = document.getElementById("customerId").value;
            let idError = document.getElementById("idError");

            if (customerId.length < 6) {
                idError.innerHTML = "Customer ID must be of minimum 6 digits.";
                return false;
            }
            return true;
        }
    </script>

    <%@ include file="footer.jsp" %>
</body>
</html>