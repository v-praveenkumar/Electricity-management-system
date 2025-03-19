<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.bean.Bills"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bills</title>
<link rel="stylesheet"
	href="https://cdn.jsdeliver.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
	<link rel="stylesheet" href="dashboard.css">
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

.btn-primary:disabled {
	background-color: #cc;
	cursor: not-allowed;
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
</style>
<script>
	function updateTotal() {
		let total = 0;
		let checkboxes = document.getElementsByName('selectedBills');
		console.log(checkboxes);

		for (var i = 0; i < checkboxes.length; i++) {

			if (checkboxes[i].checked) {
				total += parseFloat(checkboxes[i].getAttribute('data-amount'));
			}
		}
		document.getElementById('totalAmount').innerText = total.toFixed(2);
		document.getElementById('proceedBtn').disabled = (total === 0);
	}
</script>
</head>
<%
List<Bills> bill = (List<Bills>) request.getAttribute("BILLLIST");
%>
<body>


   
	<% 
		String userId=(String)session.getAttribute("userId");
		String fullName=(String)session.getAttribute("fullName");
		%>
   
   
	<%@ include file="header.jsp" %>    
	<div class="container">
		<h2 align="center">View and Pay Bill</h2>
		<%
		if (bill.size() > 0) {
		%>
		<form method="post" action="confirmBills.jsp">
			<table border="1" align="center"
				class="table table-bordered table-striped table-hover">
				<thead class="table-dark">
					<tr>
						<th>Select</th>
						<th>Consumer ID</th>
						<th>Bill Number</th>
						<th>Payment Status</th>
						<th>Connection Type</th>
						<th>Connection Status</th>
						<th>Mobile Number</th>
						<th>Bill Period</th>
						<th>Bill Date</th>
						<th>Due Date</th>
						<th>Disconnection date</th>
						<th>Due Amount</th>
						<th>Payable Amount</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Bills b : bill) {
					%>
					<tr>

						<td>
							<%
							if (!(b.getPayment_status())) {
							%> <input type="checkbox"
							name="selectedBills" value="<%=b.getBill_id()%>"
							data-amount="<%=b.getPayableamt()%>" onclick="updateTotal()">
							<%
							} else {
							%> paid<%
							}
							%>
						</td>

						<td><%=b.getConsumer_id()%></td>
						<td><%=b.getBill_id()%></td>
						<td>
							<%
							if (!(b.getPayment_status())) {
							%>Not Paid<%
							} else {
							%>Paid<%
							}
							%>
						</td>
						<td><%=b.getConnection_type()%></td>
						<td><%=b.getConnection_status()%></td>
						<td><%=b.getMobile_num()%></td>
						<td><%=b.getBillingPeriod()%></td>
						<td><%=b.getBill_date()%></td>
						<td><%=b.getDueDate()%></td>
						<td><%=b.getDissDate()%></td>
						<td><%=b.getAmt()%></td>
						<td><input type="hidden"
							name="payableAmount_<%=b.getBill_id()%>"
							value="<%=b.getPayableamt()%>"><%=b.getPayableamt()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>

			<div align="center">
				<h3>
					Total Payable Amount: <span id="totalAmount">0.00</span>
				</h3>
				<!--   <input type="submit" value="Proceed to Pay" >-->
				<div align="center">
					<button type="submit" id="proceedBtn" disabled>Proceed to
						Payment</button>
				</div>
			</div>

		</form>
		<%
		}
		%>
		<%
		if (bill.size() <= 0) {
			out.println("<p>No Bills Available</p>");
		}
		%>
	</div>
	<div class="text-center mt-3">
				    <a href="dashboard.jsp" class="btn" style="background: linear-gradient(135deg, #71b7e6, #9b59b6); color: white; padding: 10px 20px; border-radius: 10px; text-decoration: none; display: inline-block;">
				        <i class="fas fa-arrow-left"></i> Back
				    </a>
	</div>
	<%@ include file="footer.jsp" %> 
</body>
</html>