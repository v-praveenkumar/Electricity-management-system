<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Complaints by Consumer Number</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; }
        .container { width: 50%; margin: auto;margin-top:40px; background: white; padding: 20px; border-radius: 5px; box-shadow: 0px 0px 10px rgba(0,0,0,0.1); text-align: center; }
        h2 { color: #333; }
        input, select { width: 80%; padding: 10px; margin: 10px; border: 1px solid #ddd; border-radius: 5px; }
        button { background: #007bff; color: white; padding: 10px 15px; border: none; cursor: pointer; }
        button:hover { background: #0056b3; }
    </style>
</head>
<body>

<div class="container">
    <h2>Search Complaints by Consumer Number & Status</h2>
    <form action="AdminComplaintServlet" method="post">
        <input type="hidden" name="action" value="searchByConsumer">
        <input type="text" name="consumerNumber" placeholder="Enter Consumer Number" required>
        <select name="status">
            <option value="">-- Select Status --</option>
            <option value="null">All</option>
            <option value="Pending">Pending</option>
            <option value="In Progress">In Progress</option>
            <option value="Resolved">Resolved</option>
        </select>
        <div>
        	<button type="submit">Search</button>
        </div>
    </form>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
