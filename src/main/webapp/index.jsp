<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Electricity Billing System</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
        padding-top: 70px; 
    }

    .container {
        width: 40%;
        background: rgba(255, 255, 255, 0.9);
        border-radius: 10px;
        box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2);
        overflow: hidden;
        display: flex;
        flex-direction: column;
    }

    .tabs {
        display: flex;
        justify-content: space-around;
        background: linear-gradient(135deg, #71b7e6, #9b59b6);
    }

    .tabs button {
        flex: 1;
        padding: 15px;
        border: none;
        background: none;
        cursor: pointer;
        font-size: 16px;
        color: white;
        transition: background 0.3s ease;
    }

    .tabs button.active {
        background: rgba(255, 255, 255, 0.2);
    }

    .tabs button:hover {
        background: rgba(255, 255, 255, 0.3);
    }

    .form-container {
        padding: 20px;
    }

    .form-container h1 {
        color: #333;
        margin-bottom: 20px;
        font-size: 24px;
        text-align: center;
    }

    .form-container input[type="text"], 
    .form-container input[type="password"] {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
        transition: border-color 0.3s ease;
    }

    .form-container input[type="text"]:focus, 
    .form-container input[type="password"]:focus {
        border-color: #9b59b6;
        outline: none;
    }

    .form-container input[type="submit"] {
        background: linear-gradient(135deg, #71b7e6, #9b59b6);
        color: white;
        border: none;
        padding: 12px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        margin-top: 10px;
        width: 100%;
        transition: background 0.3s ease;
    }

    .form-container input[type="submit"]:hover {
        background: linear-gradient(135deg, #9b59b6, #71b7e6);
    }

    .form-container p {
        font-size: 14px;
        margin-top: 10px;
        color: #555;
        text-align: center;
    }

    .form-container a {
        color: #9b59b6;
        text-decoration: none;
    }

    .form-container a:hover {
        text-decoration: underline;
    }

    .error-message {
        color: red;
        font-size: 14px;
        margin-top: 10px;
        text-align: center;
    }

    .hidden {
        display: none;
    }

    .validation-error {
        color: red;
        font-size: 12px;
        margin-top: 5px;
    }
</style>
</head>
<body>
    <%@ include file="header.jsp" %> <!-- Include the updated header with session handling -->

    <div class="container" style="width:40%;padding: 0;">
        <!-- Tabs for Customer and Admin -->
        <div class="tabs" style="width:100%">
            <button id="customerTab" class="active" onclick="showCustomerForm()">Customer</button>
            <button id="adminTab" onclick="showAdminForm()">Admin</button>
        </div>

        <!-- Customer Login & Registration Form -->
        <div id="customerForm" class="form-container">
            <form id="customerLoginForm" action="ElectricityServlet?action=login" method="post" class="customer" onsubmit="return validateCustomerForm()">
                <h1>Customer Login</h1>
                <input type="text" name="userId" id="customerUserId" placeholder="User ID"/>
                <div id="customerUserIdError" class="validation-error"></div>
                <input type="password" name="password" id="customerPassword" placeholder="Password"/>
                <div id="customerPasswordError" class="validation-error"></div>
                <input type="submit" value="Login">
    			<!-- Back Button -->
				<div class="text-center mt-3">
				    <a href="landing.jsp" class="btn" style="background: linear-gradient(135deg, #71b7e6, #9b59b6); color: white; padding: 10px 20px; border-radius: 5px; text-decoration: none; display: inline-block;">
				        <i class="fas fa-arrow-left"></i> Back
				    </a>
				</div>

                <p>Don't have an account? <a href="register.jsp">Sign Up</a></p>
            </form>
        </div>

        <!-- Admin Login Form -->
        <div id="adminForm" class="form-container hidden">
            <form id="adminLoginForm" action="AdminLoginServlet" method="post" onsubmit="return validateAdminForm()">
                <h1>Admin Login</h1>
                <input type="text" name="adminId" id="adminId" placeholder="Admin ID" />
                <div id="adminIdError" class="validation-error"></div>
                <input type="password" name="password" id="adminPassword" placeholder="Password" />
                <div id="adminPasswordError" class="validation-error"></div>
                <input type="submit" value="Login">

				<div class="text-center mt-3">
				    <a href="landing.jsp" class="btn" style="background: linear-gradient(135deg, #71b7e6, #9b59b6); color: white; padding: 10px 20px; border-radius: 5px; text-decoration: none; display: inline-block;">
				        <i class="fas fa-arrow-left"></i> Back
				    </a>
				</div>

                
            </form>
            <div class="error-message">
                <% if(request.getParameter("error") != null) { %>
                    <%= request.getParameter("error") %>
                <% } %>
            </div>
        </div>
    </div>
	
	<%@include file="footer.jsp"%>
    <script>
        // Function to show Customer Form
        function showCustomerForm() {
            document.getElementById("customerForm").classList.remove("hidden");
            document.getElementById("adminForm").classList.add("hidden");
            document.getElementById("customerTab").classList.add("active");
            document.getElementById("adminTab").classList.remove("active");
        }

        // Function to show Admin Form
        function showAdminForm() {
            document.getElementById("adminForm").classList.remove("hidden");
            document.getElementById("customerForm").classList.add("hidden");
            document.getElementById("adminTab").classList.add("active");
            document.getElementById("customerTab").classList.remove("active");
        }

        // Validation for Customer Login Form
        function validateCustomerForm() {
            const userId = document.getElementById("customerUserId").value.trim();
            const password = document.getElementById("customerPassword").value.trim();
            let isValid = true;

            // User ID Validation
            if (userId === "") {
                document.getElementById("customerUserIdError").innerText = "User ID is required.";
                isValid = false;
            } else if (userId.length < 4 || userId.length > 20) {
                document.getElementById("customerUserIdError").innerText = "User ID must be between 4 and 20 characters.";
                isValid = false;
            } else {
                document.getElementById("customerUserIdError").innerText = "";
            }

            // Password Validation
            if (password === "") {
                document.getElementById("customerPasswordError").innerText = "Password is required.";
                isValid = false;
            } else if (password.length < 6) {
                document.getElementById("customerPasswordError").innerText = "Password must be at least 6 characters.";
                isValid = false;
            } else {
                document.getElementById("customerPasswordError").innerText = "";
            }

            return isValid;
        }

        // Validation for Admin Login Form
        function validateAdminForm() {
            const adminId = document.getElementById("adminId").value.trim();
            const password = document.getElementById("adminPassword").value.trim();
            let isValid = true;

            // Admin ID Validation
            if (adminId === "") {
                document.getElementById("adminIdError").innerText = "Admin ID is required.";
                isValid = false;
            } else if (adminId.length < 4 || adminId.length > 20) {
                document.getElementById("adminIdError").innerText = "Admin ID must be between 4 and 20 characters.";
                isValid = false;
            } else {
                document.getElementById("adminIdError").innerText = "";
            }

            // Password Validation
            if (password === "") {
                document.getElementById("adminPasswordError").innerText = "Password is required.";
                isValid = false;
            } else if (password.length < 6) {
                document.getElementById("adminPasswordError").innerText = "Password must be at least 6 characters.";
                isValid = false;
            } else {
                document.getElementById("adminPasswordError").innerText = "";
            }

            return isValid;
        }
    </script>
</body>
</html>