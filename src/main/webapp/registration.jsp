<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
    <title>Customer Registration - Electricity Management System</title> 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style> 
        body { 
            font-family: Arial, sans-serif; 
            margin: 0; 
            padding: 0; 
            background: linear-gradient(135deg, #71b7e6, #9b59b6); 
            min-height: 100vh; 
            display: flex; 
            flex-direction: column; 
            align-items: center; 
            justify-content: center; 
        } 

        .header { 
            background: linear-gradient(135deg, #71b7e6, #9b59b6); 
            color: white; 
            padding: 15px; 
            width: 100%; 
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2); 
            position: fixed; 
            top: 0; 
            left: 0; 
            z-index: 1000; 
        } 

        .logo { 
            font-size: 24px; 
            font-weight: bold; 
        } 

        .profile { 
            position: relative; 
            cursor: pointer; 
        } 

        .profile-options { 
            display: none; 
            position: absolute; 
            right: 0; 
            background-color: white; 
            border: 1px solid #ccc; 
            width: 150px; 
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); 
            z-index: 1000; 
        } 

        .profile-options a { 
            display: block; 
            padding: 10px; 
            color: #333; 
            text-decoration: none; 
        } 

        .profile-options a:hover { 
            background-color: #f0f0f0; 
        } 

        .container { 
            margin: 100px auto 50px; 
            width: 50%; 
            background: rgba(255, 255, 255, 0.9); 
            padding: 30px; 
            border-radius: 10px; 
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.2); 
        } 

        .heading { 
            font-size: 28px; 
            margin-bottom: 20px; 
            font-weight: bold; 
            color: #333; 
        } 

        .form-group { 
            width: 100%; 
            margin-bottom: 20px; 
            text-align: left; 
        } 

        .form-group label { 
            display: block; 
            font-weight: bold; 
            color: #555; 
        } 

        .form-group input, .form-group select, .form-group textarea { 
            width: 100%; 
            padding: 10px; 
            font-size: 16px; 
            border: 1px solid #ccc; 
            border-radius: 5px; 
            transition: border-color 0.3s ease; 
        } 

        .form-group input:focus, .form-group select:focus, .form-group textarea:focus { 
            border-color: #9b59b6; 
            outline: none; 
        } 

        .form-group textarea { 
            height: 80px; 
            resize: none; 
        } 

        .error-message { 
            color: red; 
            font-weight: bold; 
            margin-top: 5px; /* Adjusted to appear below the input field */
        } 

        .password-container { 
            display: flex; 
            align-items: center; 
        } 

        .password-container input { 
            flex: 1; 
        } 

        .password-toggle { 
            margin-left: 10px; 
            cursor: pointer; 
            color: #9b59b6; 
            font-weight: bold; 
        } 

        .submit-btn { 
            background: linear-gradient(135deg, #71b7e6, #9b59b6); 
            color: white; 
            padding: 12px 20px; 
            border: none; 
            cursor: pointer; 
            font-size: 16px; 
            border-radius: 5px; 
            width: 100%; 
            transition: background 0.3s ease; 
        } 

        .submit-btn:hover { 
            background: linear-gradient(135deg, #9b59b6, #71b7e6); 
        } 

        .footer { 
            background: linear-gradient(135deg, #71b7e6, #9b59b6); 
            color: white; 
            padding: 10px; 
            position: fixed; 
            bottom: 0; 
            width: 100%; 
            text-align: center; 
        } 
    </style> 
   
</head> 
<body> 
    <!-- Header -->
    <div class="header"> 
        <div class="logo">Electricity Management</div> 
        <div class="profile" onclick="toggleProfileOptions()"> 
            Profile &#9662; 
            <div id="profile-options" class="profile-options"> 
                <a href="index.jsp">Dashboard</a> 
                <a href="#">Logout</a> 
            </div> 
        </div> 
    </div> 

    <!-- Main Content -->
    <div class="container"> 
        <div class="heading">Customer Registration</div> 
        <div id="error-message" class="error-message"><% if(request.getAttribute("errorMessage")!=null){ %> <%= request.getAttribute("errorMessage") %> <%} %></div>
        <form name="registrationForm" action="AdminEMSServlet" method="post" onsubmit="validateForm(event)"> 
            <!-- Full Name -->
            <div class="form-group"> 
                <label>Full Name:</label> 
                <input type="text" name="fullname" > 
                <div id="fullnameError" class="error-message"></div>
            </div> 

            <!-- Phone Number -->
            <div class="form-group"> 
                <label>Phone Number:</label> 
                <input type="tel" name="phone" > 
                <div id="phoneError" class="error-message"></div>
            </div> 

            <!-- Email -->
            <div class="form-group"> 
                <label>Email ID:</label> 
                <input type="email" name="email" > 
                <div id="emailError" class="error-message"></div>
            </div> 

            <!-- Consumer Number -->
            <div class="form-group"> 
                <label>Consumer Number:</label> 
                <input type="text" name="consumerNumber" > 
                <div id="consumerNumberError" class="error-message"></div>
            </div> 

            <!-- User ID -->
            <div class="form-group"> 
                <label>User ID:</label> 
                <input type="text" name="userid" minlength="5" maxlength="20" > 
                <div id="useridError" class="error-message"></div>
            </div> 

            <!-- Password -->
            <div class="form-group"> 
                <label>Password:</label> 
                <div class="password-container"> 
                    <input type="password" id="password" name="password" > 
                    <span id="togglePassword" class="password-toggle" onclick="togglePassword()">Show</span> 
                </div> 
                <div id="passwordError" class="error-message"></div>
            </div> 

            <!-- Customer Type -->
            <div class="form-group">
                <label>Customer Type:</label> 
                <select name="customerType" > 
                    <option value="commercial">Commercial</option> 
                    <option value="residential">Residential</option> 
                </select> 
                <div id="customerTypeError" class="error-message"></div>
            </div> 

            <!-- Address -->
            <div class="form-group"> 
                <label>Address:</label> 
                <textarea name="address" ></textarea> 
                <div id="addressError" class="error-message"></div>
            </div>

            <!-- Submit Button -->
            <input type='hidden' class="submit-btn" name="action" value="Register">
            <input type='submit' class="submit-btn" name="" value="Register"> 
        </form> 
         <div class="text-center mt-3">
            <a href="AdminDashboard.jsp" class="btn" style="background: linear-gradient(135deg, #71b7e6, #9b59b6); color: white; padding: 10px 20px; border-radius: 10px; text-decoration: none; display: inline-block;">
                <i class="fas fa-arrow-left"></i> Back
            </a>
        </div>
    </div> 

    <!-- Footer -->
    <div class="footer">&copy; 2025 Electricity Management System</div> 
    
     <script> 
        function togglePassword() { 
            var passwordField = document.getElementById("password"); 
            var toggleButton = document.getElementById("togglePassword"); 
            if (passwordField.type === "password") { 
                passwordField.type = "text"; 
                toggleButton.textContent = "Hide"; 
            } else { 
                passwordField.type = "password"; 
                toggleButton.textContent = "Show"; 
            } 
        } 

        function toggleProfileOptions() { 
            var options = document.getElementById("profile-options"); 
            if (options.style.display === "block") { 
                options.style.display = "none"; 
            } else { 
                options.style.display = "block"; 
            } 
        } 

        function validateForm(event) { 
            event.preventDefault(); 
            let errorMessage = document.getElementById("error-message"); 
            errorMessage.innerText = ""; 

            // Get form fields
            let fullname = document.forms["registrationForm"]["fullname"].value.trim(); 
            let phone = document.forms["registrationForm"]["phone"].value.trim(); 
            let email = document.forms["registrationForm"]["email"].value.trim(); 
            let consumerNumber = document.forms["registrationForm"]["consumerNumber"].value.trim(); 
            let userid = document.forms["registrationForm"]["userid"].value.trim(); 
            let password = document.forms["registrationForm"]["password"].value.trim(); 
            let address = document.forms["registrationForm"]["address"].value.trim(); 

            // Validation rules
            let phoneRegex = /^[6789]\d{9}$/; 
            let emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; 
            let consumerNumberRegex = /^\d{13}$/; 
            let passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$/; 

            // Clear previous error messages
            document.querySelectorAll('.error-message').forEach(function(error) {
                error.textContent = '';
            });

            // Full Name Validation
            if (fullname === "") { 
                document.getElementById("fullnameError").textContent = "Full Name is required."; 
                return false; 
            } else if (fullname.length > 50) { 
                document.getElementById("fullnameError").textContent = "Full Name must be less than 50 characters."; 
                return false; 
            } 

            // Phone Number Validation
            if (phone === "") { 
                document.getElementById("phoneError").textContent = "Phone Number is required."; 
                return false; 
            } else if (!phoneRegex.test(phone)) { 
                document.getElementById("phoneError").textContent = "Phone number must start with 6,7,8, or 9 and be exactly 10 digits."; 
                return false; 
            } 

            // Email Validation
            if (email === "") { 
                document.getElementById("emailError").textContent = "Email is required."; 
                return false; 
            } else if (!emailRegex.test(email)) { 
                document.getElementById("emailError").textContent = "Invalid email format."; 
                return false; 
            } 

            // Consumer Number Validation
            if (consumerNumber === "") { 
                document.getElementById("consumerNumberError").textContent = "Consumer Number is required."; 
                return false; 
            } else if (!consumerNumberRegex.test(consumerNumber)) { 
                document.getElementById("consumerNumberError").textContent = "Consumer number must be exactly 13 digits."; 
                return false; 
            } 

            // User ID Validation
            if (userid === "") { 
                document.getElementById("useridError").textContent = "User ID is required."; 
                return false; 
            } else if (userid.length < 5 || userid.length > 20) { 
                document.getElementById("useridError").textContent = "User ID must be between 5 and 20 characters."; 
                return false; 
            } 

            // Password Validation
            if (password === "") { 
                document.getElementById("passwordError").textContent = "Password is required."; 
                return false; 
            } else if (!passwordRegex.test(password)) { 
                document.getElementById("passwordError").textContent = "Password must be at least 8 characters and contain at least one letter and one number."; 
                return false; 
            } 

            // Address Validation
            if (address === "") { 
                document.getElementById("addressError").textContent = "Address is required."; 
                return false; 
            } 

            // If all validations pass, submit the form
            document.forms["registrationForm"].submit(); 
        } 
    </script> 
</body> 
</html>