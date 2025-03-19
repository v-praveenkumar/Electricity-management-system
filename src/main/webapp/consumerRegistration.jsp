<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
    <title>Consumer Registration - Electricity Management System</title> 
    <style> 
        body { 
            font-family: Arial, sans-serif; 
            margin: 0; 
            padding: 0; 
            background-color: #f4f4f4; 
            text-align: center; 
        } 
        .header { 
            background-color: #333; 
            color: white; 
            padding: 15px; 
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
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
        } 
        .profile-options a { 
            display: block; 
            padding: 10px; 
            color: black; 
            text-decoration: none; 
        } 
        .profile-options a:hover { 
            background-color: #f0f0f0; 
        } 
        .container { 
            margin: 50px auto; 
            width: 50%; 
            background: white; 
            padding: 20px; 
            border-radius: 8px; 
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
        } 
        .heading { 
            font-size: 28px; 
            margin-bottom: 20px; 
            font-weight: bold; 
        } 
        .form-group { 
          width:100%; 
            margin-bottom: 20px; 
            text-align: left; 
        } 
        .form-group label { 
            display: block; 
            font-weight: bold; 
        } 
        .form-group input, .form-group select, .form-group textarea { 
            width: 92%; 
            padding: 8px; 
            font-size: 16px; 
            border: 1px solid #ccc; 
            border-radius: 4px; 
        } 
        .form-group textarea { 
            height: 80px; 
            resize: none; 
        } 
        .error-message { 
            color: red; 
            font-weight: bold; 
            margin-bottom: 15px; 
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
            position:relative; 
            right:60px; 
        } 
        .submit-btn { 
            background-color: #007BFF; 
            color: white; 
            padding: 10px 15px; 
            border: none; 
            cursor: pointer; 
            font-size: 16px; 
            border-radius: 5px; 
            width: 100%; 
        } 
        .submit-btn:hover { 
            background-color: #0056b3; 
        } 
        .footer { 
            background-color: #333; 
            color: white; 
            padding: 10px; 
            position: fixed; 
            bottom: 0; 
            width: 100%; 
            text-align: center; 
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
        function validateForm(event) { 
            event.preventDefault(); 
            let errorMessage = document.getElementById("error-message"); 
            let phone = document.forms["registrationForm"]["phone"].value; 
            let email = document.forms["registrationForm"]["email"].value; 
    
            let phoneRegex = /^[6789]\d{9}$/;
            let emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; 

             
            if (!emailRegex.test(email)) { 
                errorMessage.innerText = "Invalid email format."; 
                return false; 
            } 
            if (!phoneRegex.test(phone)) { 
                errorMessage.innerText = "Phone number must start with 6,7,8, or 9 and be exactly 10 digits."; 
                return false; 
            } 
             
            document.forms["registrationForm"].submit(); 
        } 
    </script> 
</head> 
<body> 
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
    <div class="container"> 
        <div class="heading">Consumer Registration for Customer <%= request.getParameter("id") %></div> 
        <div id="error-message" class="error-message"><% if(request.getAttribute("errorMessage")!=null){ %> <%= request.getAttribute("errorMessage") %> <%} %></div>
        <form name="registrationForm" action="AdminEMSServlet" method="post" onsubmit="validateForm(event)"> 
            <div class="form-group"> 
                <label>Customer ID:</label> 
                <input type="text" name="customerId" value="${param.id != null ? param.id : requestScope.customerId}" required readonly>

            </div> 
            <div class="form-group"> 
                <label>Phone Number:</label> 
                <input type="tel" name="phone" required> 
            </div> 
            <div class="form-group"> 
                <label>Email ID:</label> 
                <input type="email" name="email" required> 
            </div>  
            <div class="form-group">
            <label>Customer Type:</label> 
                <select name="customerType" required> 
                    <option value="commercial">Commercial</option> 
                    <option value="residential">Residential</option> 
                </select> 
            </div> 
            <div class="form-group"> 
                <label>Address:</label> 
                <textarea name="address"> </textarea>
            </div> 
            <input type='hidden' class="submit-btn" name="action" value="addConsumer">
            <input type='submit' class="submit-btn" name="" value="ADD"> 
             
        </form> 
    </div> 
    <div class="footer">&copy; 2025 Electricity Management System</div> 
</body> 
</html>