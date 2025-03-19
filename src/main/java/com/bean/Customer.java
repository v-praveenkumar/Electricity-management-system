package com.bean;


public class Customer {
	private long consumerNumber;
    private String fullName;
    private String address;
    private String email;
    private String mobileNumber;
    private String customerType;
    private String userID;
    private String passwordHash;
    private String role;
    private String customerID;
    private boolean isAdminCreated;

    public long getConsumerNumber() {
		return consumerNumber;
	}

	public void setConsumerNumber(long consumerNumber) {
		this.consumerNumber = consumerNumber;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getCustomerType() {
		return customerType;
	}

	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getPasswordHash() {
		return passwordHash;
	}

	public void setPasswordHash(String passwordHash) {
		this.passwordHash = passwordHash;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getCustomerID() {
		return customerID;
	}

	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}

	public boolean isAdminCreated() {
		return isAdminCreated;
	}

	public void setAdminCreated(boolean isAdminCreated) {
		this.isAdminCreated = isAdminCreated;
	}





	@Override
    public String toString() {
        return "Customer{" +
                "consumerNumber=" + consumerNumber +
                ", fullName='" + fullName + '\'' +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", mobileNumber='" + mobileNumber + '\'' +
                ", customerType='" + customerType + '\'' +
                ", userID='" + userID + '\'' +
                ", passwordHash='" + passwordHash + '\'' +
                ", role='" + role + '\'' +
                ", customerID='" + customerID + '\'' +
                '}';
    }

	public Customer(long consumerNumber, String fullName, String address, String email, String mobileNumber,
			String customerType, String userID, String customerID) {
		super();
		this.consumerNumber = consumerNumber;
		this.fullName = fullName;
		this.address = address;
		this.email = email;
		this.mobileNumber = mobileNumber;
		this.customerType = customerType;
		this.userID = userID;
		this.customerID = customerID;
	}

}