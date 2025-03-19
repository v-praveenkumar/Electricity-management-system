package com.bean;

public class Bills {
  private int bill_id;
  private long consumer_id;
  private String BillingPeriod ; 
  private String DueDate ;
  //private String BillDate;
  private String dissDate;
  private double amt;
  private double payableamt;
  private boolean payment_status;
  private String connection_type;
  private String connection_status;
  private long mobile_num;
  private String bill_date;
public int getBill_id() {
	return bill_id;
}
public void setBill_id(int bill_id) {
	this.bill_id = bill_id;
}
public long getConsumer_id() {
	return consumer_id;
}
public void setConsumer_id(long consumer_id) {
	this.consumer_id = consumer_id;
}

public boolean getPayment_status() {
	return payment_status;
}
public void setPayment_status(boolean payment_status) {
	this.payment_status = payment_status;
}
public String getConnection_type() {
	return connection_type;
}
public void setConnection_type(String connection_type) {
	this.connection_type = connection_type;
}
public String getConnection_status() {
	return connection_status;
}
public void setConnection_status(String connection_status) {
	this.connection_status = connection_status;
}
public long getMobile_num() {
	return mobile_num;
}
public void setMobile_num(long mobile_num) {
	this.mobile_num = mobile_num;
}
public String getBill_date() {
	return bill_date;
}
public void setBill_date(String bill_date) {
	this.bill_date = bill_date;
}
public Bills(int bill_id, long consumer_id, boolean payment_status, String connection_type,
		String connection_status, long mobile_num, String bill_date) {
	super();
	this.bill_id = bill_id;
	this.consumer_id = consumer_id;
	
	this.payment_status = payment_status;
	this.connection_type = connection_type;
	this.connection_status = connection_status;
	this.mobile_num = mobile_num;
	this.bill_date = bill_date;
}

public Bills(int bill_id, long consumer_id, String billingPeriod, String dueDate, String dissDate, double amt,
		double payableamt, boolean payment_status, String connection_type, String connection_status, long mobile_num,
		String bill_date) {
	super();
	this.bill_id = bill_id;
	this.consumer_id = consumer_id;
	this.BillingPeriod = billingPeriod;
	this.DueDate = dueDate;
	this.dissDate = dissDate;
	this.amt = amt;
	this.payableamt = payableamt;
	this.payment_status = payment_status;
	this.connection_type = connection_type;
	this.connection_status = connection_status;
	this.mobile_num = mobile_num;
	this.bill_date = bill_date;
}
public double getAmt() {
	return amt;
}
public void setAmt(double amt) {
	this.amt = amt;
}
public String getBillDate() {
	return bill_date;
}
public void setBillDate(String billDate) {
	bill_date = billDate;
}
public String getDueDate() {
	return DueDate;
}
public void setDueDate(String dueDate) {
	DueDate = dueDate;
}
public String getBillingPeriod() {
	return BillingPeriod;
}
public void setBillingPeriod(String billingPeriod) {
	BillingPeriod = billingPeriod;
}
public String getDissDate() {
	return dissDate;
}
public void setDissDate(String dissDate) {
	this.dissDate = dissDate;
}
public double getPayableamt() {
	return payableamt;
}
public void setPayableamt(double payableamt) {
	this.payableamt = payableamt;
}
  
}
