package com.bean;

public class AdminConsumer {
    private String consumerId;
    private String customerId;
    private String address;
    private String phone;
    private String email;
    private String customerType;

    public AdminConsumer(String consumerId, String customerId, String address, String phone, String email, String customerType) {
        this.consumerId = consumerId;
        this.customerId = customerId;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.customerType = customerType;
    }

    // Getters and Setters
    public String getConsumerId() {
        return consumerId;
    }

    public void setConsumerId(String consumerId) {
        this.consumerId = consumerId;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }

    // toString() Method (for debugging/logging)
    @Override
    public String toString() {
        return "Consumer{" +
                "consumerId='" + consumerId + '\'' +
                ", customerId='" + customerId + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", customerType='" + customerType + '\'' +
                '}';
    }
}