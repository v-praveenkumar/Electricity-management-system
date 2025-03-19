package com.bean;

import java.util.Date;

public class AdminBill {
    private int billID;
    private long consumerNumber;
    private Date billingPeriod;
    private Date billDate;
    private Date dueDate;
    private Date disconnectionDate;
    private double amountDue;
    private double payableAmount;
    private boolean isPaid;
    private String connectionType;
    private String connectionStatus;
    private String mobileNumber;

    // Default Constructor
    public AdminBill() {}

    // Parameterized Constructor
    public AdminBill(int billID, long consumerNumber, Date billingPeriod, Date billDate, Date dueDate,
                Date disconnectionDate, double amountDue, double payableAmount, boolean isPaid,
                String connectionType, String connectionStatus, String mobileNumber) {
        this.billID = billID;
        this.consumerNumber = consumerNumber;
        this.billingPeriod = billingPeriod;
        this.billDate = billDate;
        this.dueDate = dueDate;
        this.disconnectionDate = disconnectionDate;
        this.amountDue = amountDue;
        this.payableAmount = payableAmount;
        this.isPaid = isPaid;
        this.connectionType = connectionType;
        this.connectionStatus = connectionStatus;
        this.mobileNumber = mobileNumber;
    }

    // Getters and Setters
    public int getBillID() {
        return billID;
    }

    public void setBillID(int billID) {
        this.billID = billID;
    }

    public long getConsumerNumber() {
        return consumerNumber;
    }

    public void setConsumerNumber(long consumerNumber) {
        this.consumerNumber = consumerNumber;
    }

    public Date getBillingPeriod() {
        return billingPeriod;
    }

    public void setBillingPeriod(Date billingPeriod) {
        this.billingPeriod = billingPeriod;
    }

    public Date getBillDate() {
        return billDate;
    }

    public void setBillDate(Date billDate) {
        this.billDate = billDate;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public Date getDisconnectionDate() {
        return disconnectionDate;
    }

    public void setDisconnectionDate(Date disconnectionDate) {
        this.disconnectionDate = disconnectionDate;
    }

    public double getAmountDue() {
        return amountDue;
    }

    public void setAmountDue(double amountDue) {
        this.amountDue = amountDue;
    }

    public double getPayableAmount() {
        return payableAmount;
    }

    public void setPayableAmount(double payableAmount) {
        this.payableAmount = payableAmount;
    }

    public boolean isPaid() {
        return isPaid;
    }

    public void setPaid(boolean isPaid) {
        this.isPaid = isPaid;
    }

    public String getConnectionType() {
        return connectionType;
    }

    public void setConnectionType(String connectionType) {
        this.connectionType = connectionType;
    }

    public String getConnectionStatus() {
        return connectionStatus;
    }

    public void setConnectionStatus(String connectionStatus) {
        this.connectionStatus = connectionStatus;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    @Override
    public String toString() {
        return "Bill{" +
                "billID=" + billID +
                ", consumerNumber=" + consumerNumber +
                ", billingPeriod=" + billingPeriod +
                ", billDate=" + billDate +
                ", dueDate=" + dueDate +
                ", disconnectionDate=" + disconnectionDate +
                ", amountDue=" + amountDue +
                ", payableAmount=" + payableAmount +
                ", isPaid=" + isPaid +
                ", connectionType='" + connectionType + '\'' +
                ", connectionStatus='" + connectionStatus + '\'' +
                ", mobileNumber='" + mobileNumber + '\'' +
                '}';
    }
}
