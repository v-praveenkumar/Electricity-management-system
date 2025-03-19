package com.bean;

public class AdminComplaint {
    private int complaintId;
    private long consumerNumber;
    private String complaintText;
    private String status;
    private String createdAt;
    private String updatedAt;
    private String complaintType;
    private String customerId;

    // Constructor
    public AdminComplaint() {}

    public AdminComplaint(int complaintId, long consumerNumber, String complaintText, String status, String createdAt, String updatedAt, String complaintType, String customerId) {
        this.complaintId = complaintId;
        this.consumerNumber = consumerNumber;
        this.complaintText = complaintText;
        this.status = status;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.complaintType = complaintType;
        this.customerId = customerId;
    }

    // Getters and Setters
    public int getComplaintId() {
        return complaintId;
    }

    public void setComplaintId(int complaintId) {
        this.complaintId = complaintId;
    }

    public long getConsumerNumber() {
        return consumerNumber;
    }

    public void setConsumerNumber(long consumerNumber) {
        this.consumerNumber = consumerNumber;
    }

    public String getComplaintText() {
        return complaintText;
    }

    public void setComplaintText(String complaintText) {
        this.complaintText = complaintText;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getComplaintType() {
        return complaintType;
    }

    public void setComplaintType(String complaintType) {
        this.complaintType = complaintType;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }
}
