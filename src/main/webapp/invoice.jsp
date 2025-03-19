<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Invoice Lookup</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
	<style>
		.container{
			max-width: 600px;
            margin: 20px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
		}
	</style>
</head>
<body style="background: linear-gradient(135deg, #71b7e6, #9b59b6); background-repeat: no-repeat; background-attachment: fixed;">
	<%@include file="header.jsp" %>
	<div class="container" style="width:50%">
	<div class="container mt-4">
	<h2 class="text-center">View Invoice</h2>
	<form action="EMSServlet" method="post" class="mt-3">
		<div class="mb-3">
			<label for="transactionId" class="form-label">Enter
				Transaction ID</label> <input type="text" id="transactionId"
				name="transactionId" class="form-control" required>
		</div>
		<button type="submit" name="action" value="viewInvoice"
			class="btn btn-primary">Get Invoice</button>
	</form>
	</div>
	<div class="text-center mt-3">
	    <a href="dashboard.jsp" class="btn" style="background: linear-gradient(135deg, #71b7e6, #9b59b6); color: white; padding: 10px 20px; border-radius: 10px; text-decoration: none; display: inline-block;">
	        <i class="fas fa-arrow-left"></i> Back
	    </a>
	</div>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>