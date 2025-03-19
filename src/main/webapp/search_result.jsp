<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.bean.AdminCustomer,com.bean.AdminConsumer" %>

<%
List<AdminCustomer> customers = (List<AdminCustomer>) request.getAttribute("Customer");
    HashMap<String,List<AdminConsumer>> consumers = (HashMap<String,List<AdminConsumer>>) request.getAttribute("Consumer");
%>

<style>
    .container {
        width: 80%;
        margin: auto;
        background: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
        text-align: center;
        margin-top: 50px;
    }
    h2 { text-align: center; color: #333; }
    .customer-box {
        border: 2px solid #ddd;
        border-radius: 10px;
        padding: 15px;
        margin: 20px 0;
        text-align: left;
    }
    .consumer-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }
    .consumer-table th, .consumer-table td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: left;
    }
    .add-btn {
        background-color: #28a745;
        color: white;
        border: none;
        padding: 8px 15px;
        cursor: pointer;
        text-decoration: none;
        display: inline-block;
        margin-top: 10px;
        border-radius: 5px;
    }
    .add-btn:hover { background-color: #218838; }
    .error { color: red; font-size: 16px; }
    .box{
    	width:90%;
    	display:flex;
    	justify-content:space-between;
    }
</style>

<%@ include file="header.jsp" %>
<div class="container">
    <h2>Customer Details</h2>
    
    <%
        for (AdminCustomer customer : customers) {
        %>
        <div class="customer-box">
            <h3 style='text-align:"center";'><%=customer.getFullName()%></h3>
            <div class="box">
            	<p><strong>Customer ID:</strong> <%=customer.getCustomerID()%></p>
            	<p><strong>Consumer Number:</strong> <%=customer.getConsumerNumber()%></p>
            </div>
            <div class="box">
            	<p><strong>User ID:</strong> <%=customer.getUserID()%></p>
            	<p><strong>Address:</strong> <%=customer.getAddress()%></p>
            </div>
            <div class="box">
            	<p><strong>Phone:</strong> <%=customer.getMobileNumber()%></p>
            	<p><strong>Email:</strong> <%=customer.getEmail()%></p>
            </div>
            
            <p><strong>Customer Type:</strong> <%=customer.getCustomerType()%></p>
           
            <!-- Add Consumer Button -->
            <a href="consumerRegistration.jsp?id=<%=customer.getCustomerID()%>" class="add-btn">Add Consumer</a>
            
            <!-- Update Customer Button -->
            <a href='AdminEMSServlet?id=<%=customer.getCustomerID()%>&action=updateCustomer' class="add-btn">Update Customer</a>
			<h4>Linked Consumers</h4>
			<%
			if(consumers.get(customer.getCustomerID()).size()>0){
			%>
             
	            <table class="consumer-table">
	                <tr>
	                    <th>Consumer ID</th>
	                    <th>Address</th>
	                    <th>Phone</th>
	                    <th>Email</th>
	                    <th>Type</th>
	                </tr>
                <%
                for (AdminConsumer consumer : consumers.get(customer.getCustomerID())) {
                %>
                <tr>
                    <td><%= consumer.getConsumerId() %></td>
                    <td><%= consumer.getAddress() %></td>
                    <td><%= consumer.getPhone() %></td>
                    <td><%= consumer.getEmail() %></td>
                    <td><%= consumer.getCustomerType() %></td>
                </tr>
                <% }%>
                </table>
                <% }else { %>
                
                   <h2> No consumers linked to this customer. </h2>
                
                <% } %>
            
        </div>
    <% }  %>
</div>

<%@ include file="footer.jsp" %>
