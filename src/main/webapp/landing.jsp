<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Electricity Management System</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<style>
    body {
        font-family: 'Montserrat', sans-serif;
        background: linear-gradient(135deg, #71b7e6, #9b59b6);
        background-repeat: no-repeat;
        min-height: 100vh;
    }
    .navbar {
        background-color: #333;
    }
    .navbar-brand {
        font-weight: bold;
    }
    .navbar .nav-link {
        color: #fff !important;
        margin-left: 20px;
    }
    .navbar .nav-link:hover {
        color: #9b59b6 !important;
    }
    .hero-section {
        background: rgba(255, 255, 255, 0.1);
        padding: 100px 0;
        color: #fff;
        text-align: center;
    }
    .hero-section h1 {
        font-size: 3rem;
        font-weight: bold;
    }
    .hero-section p {
        font-size: 1.2rem;
        margin-top: 20px;
    }
    .hero-section .btn {
        margin-top: 30px;
        padding: 10px 30px;
        font-size: 1.1rem;
    }
    .main-content {
        max-width: 1200px;
        margin: 20px auto;
        background: #fff;
        padding: 40px;
        border-radius: 8px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    }
    .feature-item {
        background: #e9ecef;
        border-radius: 8px;
        padding: 20px;
        text-align: center;
        transition: transform 0.3s ease;
    }
    .feature-item:hover {
        background: #dee2e6;
        transform: translateY(-5px);
    }
    .feature-item i {
        font-size: 2rem;
        color: #9b59b6;
        margin-bottom: 15px;
    }
    .feature-item p {
        font-size: 14px;
        color: #555;
    }
    .testimonials-section {
        background: rgba(255, 255, 255, 0.1);
        padding: 60px 0;
        color: #fff;
        text-align: center;
    }
    .testimonial-item {
        background: rgba(255, 255, 255, 0.1);
        padding: 20px;
        border-radius: 8px;
        margin: 20px;
    }
    .footer {
        background-color: #333;
        color: #fff;
        padding: 40px 0;
        text-align: center;
    }
    .footer a {
        color: #fff;
        text-decoration: none;
        margin: 0 10px;
    }
    .footer a:hover {
        color: #9b59b6;
    }
</style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Electricity Management</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Login</a> 
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="hero-section">
        <div class="container">
            <h1>Welcome to Electricity Management System</h1>
            <p>Manage your electricity services efficiently and effortlessly.</p>
            <a href="#features" class="btn btn-primary">Explore Features</a>
        </div>
    </div>

    <div class="container mt-4">
        <div class="main-content text-center" id="features">
            <h2>Our Services</h2>
            <p>Explore the features that make managing electricity services easier than ever.</p>
            <div class="row mt-4">
                <div class="col-md-4 mb-3">
                    <div class="feature-item">
                        <i class="fas fa-exclamation-circle"></i>
                        <h5>Register Complaint</h5>
                        <p>Report power outages and service issues.</p>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="feature-item">
                        <i class="fas fa-tools"></i>
                        <h5>Service Requests</h5>
                        <p>Request new connections or modifications.</p>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="feature-item">
                        <i class="fas fa-credit-card"></i>
                        <h5>Pay Bills</h5>
                        <p>Securely pay electricity bills online.</p>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="feature-item">
                        <i class="fas fa-chart-line"></i>
                        <h5>Usage History</h5>
                        <p>Track your electricity consumption over time.</p>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="feature-item">
                        <i class="fas fa-clipboard-check"></i>
                        <h5>View Complaint Status</h5>
                        <p>Check the progress of your registered complaints.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="testimonials-section" id="testimonials">
        <div class="container">
            <h2>What Our Customers Say</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="testimonial-item">
                        <p>"Great service! The system is easy to use and very efficient."</p>
                        <p>- John Doe</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="testimonial-item">
                        <p>"I love the ability to track my usage and pay bills online."</p>
                        <p>- Jane Smith</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="testimonial-item">
                        <p>"The complaint resolution is quick and effective."</p>
                        <p>- Mike Johnson</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="footer">
        <div class="container">
            <p>&copy; 2023 Electricity Management System. All rights reserved.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>