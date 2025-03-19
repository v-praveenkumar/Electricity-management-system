package com.bean;

import java.sql.Timestamp;

//import java.sql.Timestamp;

public class Complaint {
    private int complaintId;
    private long consumerNumber;
    private String complaintType;
    private String complaintText;
    private String customerId;
    private String status;
    private String contactMethod;
    private String contactDetails;
	private Timestamp createdAt;
    private Timestamp updatedAt;

    // Default Constructor
    public Complaint() {}

    // Parameterized Constructor
    public Complaint( long consumerNumber,  String complaintType, String customerId, String complaintText,String contactMethod, String status 
    		 ) {
       
        this.consumerNumber = consumerNumber;
        this.complaintType =complaintType;
        this.customerId= customerId;
        this.complaintText = complaintText;
        this.status = status;
        this.createdAt = new Timestamp(System.currentTimeMillis());
        this.updatedAt =  new Timestamp(System.currentTimeMillis());
    }

    public Complaint(long consumerNumber, String complaintText) {
		// TODO Auto-generated constructor stub
    	this.consumerNumber = consumerNumber;
        this.complaintText = complaintText;
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

    public String getContactMethod() {
  		return contactMethod;
  	}

  	public void setContactMethod(String contactMethod) {
  		this.contactMethod = contactMethod;
  	}

  	public String getContactDetails() {
  		return contactDetails;
  	}

  	public void setContactDetails(String contactDetails) {
  		this.contactDetails = contactDetails;
  	}
 
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString() {
        return "Complaint{" +
                "complaintId=" + complaintId +
                ", consumerNumber=" + consumerNumber +
                ", complaintText='" + complaintText + '\'' +
                ", status='" + status + '\'' +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getComplaintType() {
		return complaintType;
	}

	public void setComplaintType(String complaintType) {
		this.complaintType = complaintType;
	}
}
