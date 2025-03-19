<%@ page import="java.util.List,com.bean.AdminCustomer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Include header -->
<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Customers</title>
    <style>
    .filter-container {
            margin: 20px;
            padding: 10px;
           
            display: flex;
            align-items:center;
            justify-content:center;
        }
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; }
        .container { width: 90%; margin: auto; background: white;margin-top:40px; padding: 20px; border-radius: 5px; box-shadow: 0px 0px 10px rgba(0,0,0,0.1); }
        h2 { text-align: center; color: #333; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: center; }
        th { background-color: #007bff; color: white; }
        tr:nth-child(even) { background-color: #f2f2f2; }
        .btn { text-decoration: none; background: #28a745; color: white; padding: 5px 10px; border-radius: 3px; }
        .btn:hover { background: #218838; }
        #dateError{
        	display:flex;
        	justfy-content:center;
        	align-items:center;
        	color:red;
        	justify-content:center;
        	align-items:center;
        }
    </style>
</head>
<body>

<div class="container">
	<span id="dateError"><h5><%
	if(request.getAttribute("successMessage")!=null){
	%><%=request.getAttribute("successMessage")%><%
	}
	%></h5></span>
	<h2>All Customers</h2>

    <table>
        <tr>
            <th>Customer ID</th>
            <th>Consumer Number</th>
            <th>Full Name</th>
            <th>Email ID</th>
            <th>Mobile Number</th>
            <th>Address</th>
            <th>Status</th>
        </tr>
        
        <%
                List<AdminCustomer> customers = (List<AdminCustomer>) request.getAttribute("customers");
                        	List<String> freeze = (List<String>) request.getAttribute("freeze");
                        	int count =-1;
                           if (customers != null && !customers.isEmpty()) {
                               for (AdminCustomer c : customers) { count++;
                %>
               
        <tr>
            <td><%= c.getCustomerID() %></td>
             <td><%= c.getConsumerNumber() %></td>
            <td><%= c.getFullName() %></td>
            <td><%= c.getEmail() %></td>
            <td><%= c.getMobileNumber() %></td>
             <td><%= c.getAddress() %></td>
            <td>
                    <% if ("True".equals(freeze.get(count))) { %>
                        <form action="AdminComplaintServlet" method="post">
                            <input type="hidden" name="action" value="updateStatusofFreeze">
                            
                             <input type="hidden" name="customerId" value="<%=c.getCustomerID() %>">
                           
                            <button type="submit" name="newStatus" value="UnFreeze" class="btn btn-resolved">UnFreeze</button>
                        </form>
                    <% } else if ("False".equals(freeze.get(count))) { %>
                        <form action="AdminComplaintServlet" method="post">
                            <input type="hidden" name="action" value="updateStatusofFreeze">
                           
                            <input type="hidden" name="customerId" value="<%= c.getCustomerID() %>">
                            <button type="submit" name="newStatus" value="Freeze" class="btn btn-resolved">Freeze</button>
                        </form>
                    <% } %>
           </td>
        </tr>
        <% } } else { %>
        <tr><td colspan="9">No complaints found.</td></tr>
        <% } %>
    </table>
    
   
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
