package com.bean;

public class payment {
private String invoiceNumber;
private String paymentId;
private String transactionId;
private String receiptNumber;
private String transactionDate;
private String transactionType; // store credit/debit
private String billNumber; // from previous
private double transactionAmount;
private String transactionStatus;
public payment(String invoiceNumber, String paymentId, String transactionId, String receiptNumber,
		String transactionDate, String transactionType, String billNumber, double transactionAmount,
		String transactionStatus) {
	super();
	this.invoiceNumber = invoiceNumber;
	this.paymentId = paymentId;
	this.transactionId = transactionId;
	this.receiptNumber = receiptNumber;
	this.transactionDate = transactionDate;
	this.transactionType = transactionType;
	this.billNumber = billNumber;
	this.transactionAmount = transactionAmount;
	this.transactionStatus = transactionStatus;
}
public String getInvoiceNumber() {
	return invoiceNumber;
}
public void setInvoiceNumber(String invoiceNumber) {
	this.invoiceNumber = invoiceNumber;
}
public String getPaymentId() {
	return paymentId;
}
public void setPaymentId(String paymentId) {
	this.paymentId = paymentId;
}
public String getTransactionId() {
	return transactionId;
}
public void setTransactionId(String transactionId) {
	this.transactionId = transactionId;
}
public String getReceiptNumber() {
	return receiptNumber;
}
public void setReceiptNumber(String receiptNumber) {
	this.receiptNumber = receiptNumber;
}
public String getTransactionDate() {
	return transactionDate;
}
public void setTransactionDate(String transactionDate) {
	this.transactionDate = transactionDate;
}
public String getTransactionType() {
	return transactionType;
}
public void setTransactionType(String transactionType) {
	this.transactionType = transactionType;
}
public String getBillNumber() {
	return billNumber;
}
public void setBillNumber(String billNumber) {
	this.billNumber = billNumber;
}
public double getTransactionAmount() {
	return transactionAmount;
}
public void setTransactionAmount(double transactionAmount) {
	this.transactionAmount = transactionAmount;
}
public String getTransactionStatus() {
	return transactionStatus;
}
public void setTransactionStatus(String transactionStatus) {
	this.transactionStatus = transactionStatus;
} // store paid/unpaid/pending
}