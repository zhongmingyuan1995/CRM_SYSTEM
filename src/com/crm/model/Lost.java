package com.crm.model;

public class Lost {
    private Long lstId;

    private String lstCustNo;

    private Customer customer;

    private String lstCustManagerName;

    private String lstLastOrderDate;

    private String lstLostDate;

    private String lstDelay;

    private String lstReason;

    private String lstStatus;

	public Lost() {
		super();
	}
	
	
	public Lost(String lstDelay,Long lstId) {
		super();
		this.lstId = lstId;
		this.lstDelay = lstDelay;
	}


	public Lost(String lstReason, Long lstId, String string) {
		super();
		this.lstId = lstId;
		this.lstReason = lstReason;
	}


	public Long getLstId() {
        return lstId;
    }

    public void setLstId(Long lstId) {
        this.lstId = lstId;
    }

    public String getLstCustNo() {
        return lstCustNo;
    }

    public void setLstCustNo(String lstCustNo) {
        this.lstCustNo = lstCustNo == null ? null : lstCustNo.trim();
    }
    

    public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getLstCustManagerName() {
        return lstCustManagerName;
    }

    public void setLstCustManagerName(String lstCustManagerName) {
        this.lstCustManagerName = lstCustManagerName == null ? null : lstCustManagerName.trim();
    }

    public String getLstLastOrderDate() {
        return lstLastOrderDate;
    }

    public void setLstLastOrderDate(String lstLastOrderDate) {
        this.lstLastOrderDate = lstLastOrderDate;
    }

    public String getLstLostDate() {
        return lstLostDate;
    }

    public void setLstLostDate(String lstLostDate) {
        this.lstLostDate = lstLostDate;
    }

    public String getLstDelay() {
        return lstDelay;
    }

    public void setLstDelay(String lstDelay) {
        this.lstDelay = lstDelay == null ? null : lstDelay.trim();
    }

    public String getLstReason() {
        return lstReason;
    }

    public void setLstReason(String lstReason) {
        this.lstReason = lstReason == null ? null : lstReason.trim();
    }

    public String getLstStatus() {
        return lstStatus;
    }

    public void setLstStatus(String lstStatus) {
        this.lstStatus = lstStatus == null ? null : lstStatus.trim();
    }
}