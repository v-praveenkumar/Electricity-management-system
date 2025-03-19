<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register Complaint</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
        	height:100%;
            font-family: Arial, sans-serif;
            background-color: linear-gradient(135deg, #71b7e6, #9b59b6);
        }
        .container {
            width: 40%;
            background: white;
            padding: 20px;
            margin: auto;
            box-shadow: 0px 0px 10px 0px #000;
            border-radius: 8px;
            margin-bottom: 5rem;
            margin-top: 5rem;
        }
        .error {
            color: red;
            font-size: 14px;
            display: none;
        }
        .is-invalid {
            border: 1px solid red;
            background-color: #ffefef;
        }
    </style>
</head>
<body style="background: linear-gradient(135deg, #71b7e6, #9b59b6); background-repeat: no-repeat; background-attachment: fixed;">
	<% 
		String customerId=(String)session.getAttribute("customerId");
		long  consumerNumber=(long)session.getAttribute("consumerNo");
	%>
	<%@include file="header.jsp" %> 
    <div class="container" style="width:45%; margin-bottom:3rem;">
        <h2 class="text-center">Register Complaint</h2>

        <% String errorMessage = (String) request.getAttribute("errorMessage"); 
           if (errorMessage != null) { %>
            <p class="text-danger text-center"><%= errorMessage %></p>
        <% } %>

        <form name="complaintForm" action="ComplaintServlet" method="post" onsubmit="return validateForm()">
            <input type="hidden" name="action" value="register">

            <!-- Complaint Type -->
            <label for="complaintType">Complaint Type:</label>
            <select id="complaintType" name="complaintType" class="form-control" onchange="updateCategoryOptions()">
                <option value="">Select Complaint Type</option>
                <option value="Billing Issue">Billing Issue</option>
                <option value="Power Outage">Power Outage</option>
                <option value="Meter Issue">Meter Issue</option>
            </select>
            <p class="error" id="complaintTypeError">Please select a complaint type.</p>

            <!-- Category -->
            <label for="category">Category:</label>
            <select id="category" name="category" class="form-control">
                <option value="">Select Category</option>
            </select>
            <p class="error" id="categoryError">Please select a category.</p>

            <!-- Description -->
            <label for="description">Description:</label>
            <textarea id="description" name="description" class="form-control"></textarea>
            <p class="error" id="descriptionError">Description must be at least 10 characters.</p>

            <!-- Contact Method -->
            <label for="contactMethod">Preferred Contact Method:</label>
            <select id="contactMethod" name="contactMethod" class="form-control" onchange="toggleContactFields()">
                <option value="">Select Contact Method</option>
                <option value="email">Email</option>
                <option value="phone">Phone</option>
            </select>
            <p class="error" id="contactError"></p>

            <!-- Email -->
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" class="form-control" disabled>

            <!-- Phone -->
            <label for="phone">Phone:</label>
            <input type="text" id="phone" name="phone" class="form-control" disabled>

            <!-- Buttons -->
            <div class="mt-4 d-flex justify-content-between">
                <button type="submit" class="btn btn-success px-4">Submit</button>
                <button type="reset" class="btn btn-danger px-4" onclick="resetErrors()">Reset</button>
            </div>
        </form>

        <div class="text-center mt-3">
		    <a href="dashboard.jsp" class="btn" style="background: linear-gradient(135deg, #71b7e6, #9b59b6); color: white; padding: 10px 20px; border-radius: 10px; text-decoration: none; display: inline-block;">
		        <i class="fas fa-arrow-left"></i> Back
		    </a>
		</div>
    </div>
    <%@include file="footer.jsp" %> 

    <script>
        function validateForm() {
            let isValid = true;
            resetErrors();

            let complaintType = document.getElementById("complaintType");
            let category = document.getElementById("category");
            let description = document.getElementById("description");
            let contactMethod = document.getElementById("contactMethod").value;
            let email = document.getElementById("email");
            let phone = document.getElementById("phone");

            if (complaintType.value === "") {
                showError("complaintTypeError", complaintType);
                isValid = false;
            }
            if (category.value === "") {
                showError("categoryError", category);
                isValid = false;
            }
            if (description.value.length < 10) {
                showError("descriptionError", description);
                isValid = false;
            }
            if (contactMethod === "") {
                showError("contactError", null, "Please select a preferred contact method.");
                isValid = false;
            } else {
                if (contactMethod === "email" && !/^\S+@\S+\.\S+$/.test(email.value)) {
                    showError("contactError", email, "Please enter a valid email address.");
                    isValid = false;
                }
                else if (contactMethod === "phone") {
                    let phonePattern = /^[6789]\d{9}$/;
                    if (!phonePattern.test(phone.value)) {
                        showError("contactError", phone, "Enter a valid 10-digit phone number");
                        isValid = false;
                    } else if (hasMoreThanFiveSameDigits(phone.value)) {
                        showError("contactError", phone, "Invalid phone number.");
                        isValid = false;
                    }
                }
            }
            return isValid;
        }

        function showError(errorId, inputField, message = null) {
            let errorElement = document.getElementById(errorId);
            if (message) errorElement.innerText = message;
            errorElement.style.display = "block";
            if (inputField) inputField.classList.add("is-invalid");
        }

        function resetErrors() {
            document.querySelectorAll(".error").forEach(error => error.style.display = "none");
            document.querySelectorAll(".is-invalid").forEach(input => input.classList.remove("is-invalid"));
        }
        

        function updateCategoryOptions() {
            let complaintType = document.getElementById("complaintType").value;
            let categorySelect = document.getElementById("category");

            categorySelect.innerHTML = "<option value=''>Select Category</option>";

            let categories = {
                "Billing Issue": ["Incorrect Bill", "Late Payment", "Extra Charges"],
                "Power Outage": ["Area Outage", "Individual Outage", "Voltage Fluctuation"],
                "Meter Issue": ["Reading Error", "Meter Damage", "Replacement Needed"]
            };

            if (categories[complaintType]) {
                categories[complaintType].forEach(category => {
                    let option = document.createElement("option");
                    option.value = category;
                    option.text = category;
                    categorySelect.add(option);
                });
            }
        }

        function toggleContactFields() {
            let contactMethod = document.getElementById("contactMethod").value;
            let email = document.getElementById("email");
            let phone = document.getElementById("phone");

            email.disabled = contactMethod !== "email";
            phone.disabled = contactMethod !== "phone";
        }

        function hasMoreThanFiveSameDigits(number) {
            let digitCount = {};
            for (let digit of number) {
                digitCount[digit] = (digitCount[digit] || 0) + 1;
                if (digitCount[digit] > 8) return true;
            }
            return false;
        }
    </script>
</body>
</html>