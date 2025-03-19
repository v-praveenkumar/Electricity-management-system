<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Registration</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(135deg, #71b7e6, #9b59b6);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .container {
        background: rgba(255, 255, 255, 0.9);
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.2);
        max-width: 600px;
        width: 100%;
    }

    .title {
        font-size: 24px;
        font-weight: bold;
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    .input-box {
        margin-bottom: 15px;
    }

    .input-box span {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        color: #555;
    }

    .input-box input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
        transition: border-color 0.3s ease;
    }

    .input-box input:focus {
        border-color: #9b59b6;
        outline: none;
    }

    .customer-type {
        margin-bottom: 20px;
    }

    .customer-type .customer-title {
        font-weight: bold;
        display: block;
        margin-bottom: 10px;
        color: #555;
    }

    .category {
        display: flex;
        gap: 20px;
    }

    .category label {
        display: flex;
        align-items: center;
        gap: 5px;
        color: #555;
    }

    .button {
        text-align: center;
    }

    .button input[type="submit"] {
        background: linear-gradient(135deg, #71b7e6, #9b59b6);
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        font-weight: bold;
        transition: background 0.3s ease;
    }

    .button input[type="submit"]:hover {
        background: linear-gradient(135deg, #9b59b6, #71b7e6);
    }

    .error {
        color: red;
        font-size: 12px;
        margin-top: 5px;
    }
</style>
<script>
    // Function to allow only numbers in input fields
    function onlyNumberKey(evt) {
        let ASCIICode = (evt.which) ? evt.which : evt.keyCode;
        if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57))
            return false;
        return true;
    }

    // Function to validate the form
    function validateForm() {
        // Clear previous error messages
        document.querySelectorAll('.error').forEach(function(error) {
            error.textContent = '';
        });

        let isValid = true;

        // Full Name Validation
        const fullName = document.querySelector("input[name='fullName']").value.trim();
        if (fullName === "") {
            document.getElementById("fullNameError").textContent = "Full Name is required.";
            isValid = false;
        } else if (!/^[A-Za-z\s]+$/.test(fullName)) {
            document.getElementById("fullNameError").textContent = "Full Name should contain only letters and spaces.";
            isValid = false;
        }

        // Consumer Number Validation
        const consumerNumber = document.querySelector("input[name='consumerNumber']").value.trim();
        if (consumerNumber === "") {
            document.getElementById("consumerNumberError").textContent = "Consumer Number is required.";
            isValid = false;
        } else if (consumerNumber.length !== 13 || !/^\d+$/.test(consumerNumber)) {
            document.getElementById("consumerNumberError").textContent = "Consumer Number must be 13 digits.";
            isValid = false;
        }

        // Email Validation
        const email = document.querySelector("input[name='email']").value.trim();
        if (email === "") {
            document.getElementById("emailError").textContent = "Email is required.";
            isValid = false;
        } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
            document.getElementById("emailError").textContent = "Invalid email format.";
            isValid = false;
        }

        // Phone Number Validation
        const mobile = document.querySelector("input[name='mobile']").value.trim();
        if (mobile === "") {
            document.getElementById("mobileError").textContent = "Phone Number is required.";
            isValid = false;
        } else if (mobile.length !== 10 || !/^\d+$/.test(mobile)) {
            document.getElementById("mobileError").textContent = "Phone Number must be 10 digits.";
            isValid = false;
        }

        // Address Validation
        const address = document.querySelector("input[name='address']").value.trim();
        if (address === "") {
            document.getElementById("addressError").textContent = "Address is required.";
            isValid = false;
        }

        // Password Validation
        const password = document.querySelector("input[name='password']").value.trim();
        if (password === "") {
            document.getElementById("passwordError").textContent = "Password is required.";
            isValid = false;
        } else if (password.length < 8) {
            document.getElementById("passwordError").textContent = "Password must be at least 8 characters.";
            isValid = false;
        }

        // Confirm Password Validation
        const confirmPassword = document.querySelector("input[name='confirmPassword']").value.trim();
        if (confirmPassword === "") {
            document.getElementById("confirmPasswordError").textContent = "Confirm Password is required.";
            isValid = false;
        } else if (confirmPassword !== password) {
            document.getElementById("confirmPasswordError").textContent = "Passwords do not match.";
            isValid = false;
        }

        // Customer Type Validation
        const customerType = document.querySelector("input[name='customerType']:checked");
        if (!customerType) {
            document.getElementById("customerTypeError").textContent = "Customer Type is required.";
            isValid = false;
        }

        return isValid;
    }
</script>
</head>
<body>
    <%@page import="java.util.Random" %>
    <%
        Random rand = new Random();
        StringBuilder customerId = new StringBuilder("CUST");
        for (int i = 0; i < 6; i++) {
            customerId.append(rand.nextInt(10));
        }
    %>    
    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
    <% if (errorMessage != null) { %>
        <div style="color: red; font-weight: bold;">
            <%= errorMessage %>
        </div>
    <% } %>

    <%@include file="header.jsp" %> 
    <div class="container">
        <div class="title">Registration</div>
        <div class="content">
            <form action="ElectricityServlet" method="post" onsubmit="return validateForm()">
                <input type="hidden" name="action" value="register">
                <div class="user-details">
                    <!-- Full Name -->
                    <div class="input-box">
                        <span class="details">Full Name</span>
                        <input type="text" name="fullName" placeholder="Enter your name">
                        <div id="fullNameError" class="error"></div>
                    </div>
                    <!-- Consumer Number -->
                    <div class="input-box">
                        <span class="details">Consumer Number</span>
                        <input type="text" name="consumerNumber" maxlength="13" onkeypress="return onlyNumberKey(event)" placeholder="Enter 13-digit consumerNumber">
                        <div id="consumerNumberError" class="error"></div>
                    </div>
                    <!-- Email -->
                    <div class="input-box">
                        <span class="details">Email</span>
                        <input type="email" name="email" placeholder="Enter your email">
                        <div id="emailError" class="error"></div>
                    </div>
                    <!-- Phone Number -->
                    <div class="input-box">
                        <span class="details">Phone Number</span>
                        <input type="text" name="mobile" maxlength="10" placeholder="Enter your number" onkeypress="return onlyNumberKey(event)">
                        <div id="mobileError" class="error"></div>
                    </div>
                    <!-- User ID -->
                    <div class="input-box">
                        <span class="details">User Id</span>
                        <input type="text" name="userId" value="<%= customerId %>" readonly>
                    </div>
                    <!-- Address -->
                    <div class="input-box">
                        <span class="details">Address</span>
                        <input type="text" name="address" placeholder="Enter your address">
                        <div id="addressError" class="error"></div>
                    </div>
                    <!-- Password -->
                    <div class="input-box">
                        <span class="details">Password</span>
                        <input type="password" name="password" placeholder="Enter your password">
                        <div id="passwordError" class="error"></div>
                    </div>
                    <!-- Confirm Password -->
                    <div class="input-box">
                        <span class="details">Confirm Password</span>
                        <input type="password" name="confirmPassword" placeholder="Confirm your password">
                        <div id="confirmPasswordError" class="error"></div>
                    </div>
                </div>
                <!-- Customer Type -->
                <div class="customer-type">
                    <span class="customer-title">Customer Type</span>
                    <div class="category">
                        <label>
                            <input type="radio" name="customerType" value="Residential">
                            Residential
                        </label>
                        <label>
                            <input type="radio" name="customerType" value="Commercial">
                            Commercial
                        </label>
                    </div>
                    <div id="customerTypeError" class="error"></div>
                </div>
                <!-- Submit Button -->
                <div class="button">
                    <input type="submit" value="Register">
                </div>
            </form>
        </div>
    </div>
</body>
</html>