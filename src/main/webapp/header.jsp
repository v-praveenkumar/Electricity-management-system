<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

<style>
    .header {
        background-color: #333;
        color: white;
        z-index: 1000;
    }
    .profile-icon {
        color: #fff; 
    }
    .profile-icon:hover {
        color: #9b59b6; 
    }
    /* Add padding to the body to prevent content from being hidden behind the fixed header */
    body {
        padding-top: 70px;
    }
</style>

<!-- Fixed Header -->
<div class="header bg-dark text-white p-3 d-flex justify-content-between align-items-center fixed-top">
    <div class="logo fs-4 fw-bold">Electricity Management</div>
    <div class="profile position-relative">
        <!-- Profile Toggle Button -->
        <div class="d-flex align-items-center gap-2" onclick="toggleProfileOptions()">
            <!-- Font Awesome Profile Icon -->
            <i class="fas fa-user fs-5 profile-icon"></i>
            <span>
                <% if (session.getAttribute("userId") != null) { %>
                    <%= session.getAttribute("userId") %>
                <% } else { %>
                    Guest
                <% } %>
            </span>
        </div>
        
        <!-- Profile Dropdown Menu -->
        <div class="dropdown-menu position-absolute end-0 mt-2 shadow" id="profile-options" style="display: none;">
            <% if (session.getAttribute("userId") != null) { %>
                <a class="dropdown-item p-3 text-dark" href="AdminDashboard.jsp">Dashboard</a>
                <a class="dropdown-item p-3 text-dark" href="logout.jsp">Logout</a>
            <% } else { %>
                <a class="dropdown-item p-3 text-dark" href="login.jsp">Login</a>
                <a class="dropdown-item p-3 text-dark" href="register.jsp">Register</a>
            <% } %>
        </div>
    </div>
</div>

<script>
    function toggleProfileOptions() {
        let options = document.getElementById("profile-options");
        options.style.display = options.style.display === "block" ? "none" : "block";
    }

    // Close dropdown when clicking outside
    document.addEventListener("click", function(event) {
        let profile = document.querySelector(".profile");
        let options = document.getElementById("profile-options");
        if (!profile.contains(event.target)) {
            options.style.display = "none";
        }
    });
</script>