<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

    
<%@ page import="java.util.List,com.bean.AdminCustomer" %>

<%
AdminCustomer customer = (AdminCustomer) request.getAttribute("customer");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBS - Add Bill</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .form-section {
        background: white;
        border-radius: 1rem;
        box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
    }
    .form-header {
        border-bottom: 2px solid #dee2e6;
        padding-bottom: 1rem;
    }
    .form-control:disabled, .form-control[readonly] {
        background-color: #f8f9fa;
    }
</style>
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="form-section p-4 p-md-5">
                <div class="form-header mb-5">
                    <h1 class="h2 text-center text-primary mb-3">
                        <i class="bi bi-lightning-charge"></i> EBS
                    </h1>
                    <h2 class="h4 text-center text-muted">Register New Bill</h2>
                </div>

                <form method="post" action="AdminEMSServlet?action=registerBill" onsubmit="return validateForm()">
                    <div class="row g-3">
                        <!-- Consumer Number -->
                        <div class="col-12">
                            <label class="form-label">Consumer Number</label>
                            <input type="text" id="consumerNumber" name="consumerNumber" 
                                   class="form-control form-control-lg" placeholder="Enter consumer number" value=<%= customer.getConsumerNumber() %> readonly>
                            <div id="consumerError" class="form-text text-danger"></div>
                        </div>

                        <!-- Billing Period -->
                        <div class="col-12">
                            <label class="form-label">Billing Period</label>
                            <div class="row g-2">
                                <div class="col-md-6">
                                    <select id="billingMonth" name="billingMonth" class="form-select form-select-lg">
                                        <option value="01">January</option>
		                                <option value="02">February</option>
		                                <option value="03">March</option>
		                                <option value="04">April</option>
		                                <option value="05">May</option>
		                                <option value="06">June</option>
		                                <option value="07">July</option>
		                                <option value="08">August</option>
		                                <option value="09">September</option>
		                                <option value="10">October</option>
		                                <option value="11">November</option>
		                                <option value="12">December</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <select name="billingYear" id="billingYear" class="form-select form-select-lg"></select>
                                </div>
                            </div>
                        </div>

                        <!-- Bill Amount -->
                        <div class="col-md-6">
                            <label class="form-label">Bill Amount</label>
                            <div class="input-group">
                                <span class="input-group-text">Rs.</span>
                                <input type="text" id="amountDue" name="amountDue" 
                                       class="form-control form-control-lg" placeholder="0.00">
                            </div>
                            <div id="amountError" class="form-text text-danger"></div>
                        </div>

                        <!-- Status Group -->
                        <div class="col-md-6">
                            <label class="form-label">Payment Status</label>
                            <select name="isPaid" id="isPaid" class="form-select form-select-lg">
                                <option value="Unpaid" class="text-danger" selected>Unpaid</option>
                            </select>
                        </div>

                        <!-- Connection Info -->
                        <div class="col-md-4">
                            <label class="form-label">Connection Type</label>
                            <input name ="connectionType" value=<%= customer.getCustomerType() %> readonly>
                  
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">Connection Status</label>
                            <select name="connectionStatus" id="connectionStatus" 
                                    class="form-select form-select-lg">
                                <option value="Connected" selected>Connected</option>
                               
                            </select>
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">Mobile Number</label>
                            <input type="text" id="mobileNumber" name="mobileNumber" 
                                   class="form-control form-control-lg bg-light" value=<%= customer.getMobileNumber() %> readonly>
                        </div>

                        <!-- Action Buttons -->
                        <div class="col-12 mt-5">
                            <div class="d-flex justify-content-between">
                                <button type="button" id="cancelButton" 
                                        class="btn btn-outline-secondary px-4">
                                    Cancel
                                </button>
                                <button type="submit" name="action" value="AddBill" 
                                        class="btn btn-primary px-4">
                                    Save Bill
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Enhanced Year Selector
    const yearSelect = document.getElementById("billingYear");
    const currentYear = new Date().getFullYear();
    const startYear = 2010;
    
    for (let year = currentYear; year >= startYear; year--) {
        const option = new Option(year, year);
        option.selected = year === currentYear;
        yearSelect.add(option);
    }

    // Enhanced Validation
    function validateForm() {
        let isValid = true;
        const consumerNumber = document.getElementById("consumerNumber");
        const amountDue = document.getElementById("amountDue");

        // Consumer Number Validation
        if (!/^\d+$/.test(consumerNumber.value.trim())) {
            consumerNumber.classList.add('is-invalid');
            document.getElementById('consumerError').textContent = 'Invalid consumer number format';
            isValid = false;
        } else {
            consumerNumber.classList.remove('is-invalid');
        }

        // Amount Validation
        if (!/^\d+(\.\d{1,2})?$/.test(amountDue.value.trim())) {
            amountDue.classList.add('is-invalid');
            document.getElementById('amountError').textContent = 'Invalid amount format';
            isValid = false;
        } else {
            amountDue.classList.remove('is-invalid');
        }

        return isValid;
    }

    // Cancel Button Handler
    document.getElementById('cancelButton').addEventListener('click', () => {
        window.location.href = 'dashboard.jsp'; // Update with your actual dashboard URL
    });
</script>
</body>
<%@ include file="footer.jsp" %>
</html>