<%@ page import="java.sql.*, java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Confirm Bills</title>
<link rel="stylesheet" href="dashboard.css">
<link rel="stylesheet"
	href="https://cdn.jsdeliver.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
body {
	background-color: #f8f9fa;
}

.container {
	margin-top: 50px;
	background: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	color: #007bff;
	margin-bottom: 20px;
}

.table-hover tbody tr:hover {
	background-color: #f1f1f1;
}

.btn-primary {
	width: 100%;
	font-size: 18px;
}

th, td {
	text-align: center;
	verticle-align: middle;
}

#proceedBtn {
	margin: 1%;
	padding: 0.4%;
	border-radius: 0.5%;
}

#proceedBtn:hover {
	cursor: pointer;
}

.button {
	align: center;
	position: relative;
	left: 50px;
}
</style>
</head>
<body>
 
<% 
		String userId=(String)session.getAttribute("userId");
		String fullName=(String)session.getAttribute("fullName");
%>

	<!-- Navigation Bar -->
    <div class="navbar">
         <div class="navbar-left">
          
        </div>
        <div class="navbar-center">
            Electricity Management System
        </div>
        <div class="navbar-right">
            <div class="profile-menu">
                <button class="profile-button">Profile </button>
                <div class="profile-dropdown">
                    <p>User ID: <%= userId %></p>
                    <p>Name: <%= fullName %></p>
                    <a href="editProfile.jsp">Edit Details</a>
                    <a href="logout.jsp">Logout</a>
                    <!-- ElectricityServlet?action=customerLogout -->
                </div>
            </div>
        </div>
    </div>

	<div class="container">
		<h2>Confirm Your Bill Selection</h2>

		<%
		String[] selectedBills = request.getParameterValues("selectedBills");

		if (selectedBills == null) {
			out.println("<p>No bills selected. <a href='Bills.jsp'>Go Back</a></p>");
		} else {
			try {
				Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
				Connection conn = DriverManager.getConnection("jdbc:derby:C:\\Users\\2824553\\MyDB;create=true");

				double totalAmount = 0;
		%>

		<form action="payment.jsp" method="post" align="center">
			<table border="1"
				class="table table-bordered table-striped table-hover"
				align="center">
				<thead class="table-dark">
					<tr>
						<th>Consumer Number</th>
						<th>Bill Date</th>
						<th>Billing Period</th>
						<th>Bill Amount</th>
						<th>Due Date</th>
						<th>Added Bills</th>
					</tr>
				</thead>
				<%
				for (String billNumber : selectedBills) {
					PreparedStatement ps = conn.prepareStatement("SELECT * FROM Bills WHERE BillID = ?");
					ps.setString(1, billNumber);
					ResultSet rs = ps.executeQuery();

					if (rs.next()) {
						double payableAmount = rs.getDouble("PayableAmount");
						totalAmount += payableAmount;
				%>
				<tr>
					<td><%=rs.getString("ConsumerNumber")%></td>
					<td><%=rs.getDate("BillDate")%></td>
					<td><%=rs.getString("BillingPeriod")%></td>
					<td><%=payableAmount%></td>
					<td><%=rs.getDate("DueDate")%></td>
					<td><input type="checkbox" name="selectedBills" 
						value="<%=billNumber%>" onclick="updateTotalAmount()" checked>
					</td>
				</tr>
				<input type="hidden" name="billsToPay" value="<%=billNumber%>">
				<%
				}
				rs.close();
				ps.close();
				}
				conn.close();
				%>
			</table>

			<h3>
				Total Payable Amount: <span id="totalAmount" ><%=totalAmount%></span>
				
				
			</h3>

			<label>Select Payment Method:</label> <select name="paymentMethod">
				<option value="Credit">Credit Card</option>
				<option value="Debit">Debit Card</option>
				<!-- <option value="netbanking">Net Banking</option> -->
			</select> <br>
			<button type="submit" id="proceedBtn">Proceed to Payment</button>
		</form>
		<a href='EMSServlet?action=viewBills'>Go Back</a>
		<script>
			function updateTotalAmount() {
				var checkboxes = document
						.querySelectorAll('input[name="removeBill"]:checked');
				var total = 0;

				checkboxes.forEach(function(checkbox) {
					var row = checkbox.closest("tr");
					var billAmount = parseFloat(row.cells[3].innerText);
					total += billAmount;
				});
                 
				document.getElementById("totalAmount").innerText = total
						.toFixed(2);
				document.getElementById("proceedBtn").disabled = (total === 0);
			}
		</script>

		<%
		} catch (Exception e) {
		out.println("<p>Error: " + e.getMessage() + "</p>");
		}
		}
		%>
	</div>
</body>
</html>
