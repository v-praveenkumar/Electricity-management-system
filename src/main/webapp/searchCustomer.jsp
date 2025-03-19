<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<style>
    /* Centering the content */
    .container {
        width: 40%;
        margin: auto;
        background: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
        text-align: center;
        margin-top: 100px;
    }

    h2 {
        text-align: center;
        color: #333;
    }

    .button-container {
        display: flex;
        flex-direction: column;
        gap: 15px;
        align-items: center;
        margin-top: 20px;
    }

    .button {
        width: 80%;
        padding: 12px;
        font-size: 18px;
        font-weight: bold;
        text-align: center;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: 0.3s;
    }

    .search-id {
        background-color: #007bff;
        color: white;
    }

    .search-id:hover {
        background-color: #0056b3;
    }

    .search-name {
        background-color: #28a745;
        color: white;
    }

    .search-name:hover {
        background-color: #218838;
    }

    /* Body background gradient */
    body {
        background: linear-gradient(135deg, #71b7e6, #9b59b6);
        background-repeat: no-repeat;
        background-attachment: fixed;
        min-height: 100vh;
    }
</style>

<body>
    <div class="container">
        <h2>Customer Search</h2>
        <div class="button-container">
            <button class="button search-id" onclick="location.href='search_by_id.jsp'">Search by ID</button>
            <button class="button search-name" onclick="location.href='search_by_name.jsp'">Search by Name</button>
        </div>
        <div class="text-center mt-3">
            <a href="AdminDashboard.jsp" class="btn" style="background: linear-gradient(135deg, #71b7e6, #9b59b6); color: white; padding: 10px 20px; border-radius: 10px; text-decoration: none; display: inline-block;">
                <i class="fas fa-arrow-left"></i> Back
            </a>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>