package com.crm.model;


public class Order {
    private Long odrId;

    private String odrCustNo;

    private String odrDate;

    private String odrAddr;

    private String odrStatus;
    
    
    public Order() {
		super();
	}

	public Long getOdrId() {
        return odrId;
    }

    public void setOdrId(Long odrId) {
        this.odrId = odrId;
    }

    public String getOdrCustNo() {
        return odrCustNo;
    }

    public void setOdrCustNo(String odrCustNo) {
        this.odrCustNo = odrCustNo == null ? null : odrCustNo.trim();
    }

    public String getOdrDate() {
        return odrDate;
    }

    public void setOdrDate(String odrDate) {
        this.odrDate = odrDate;
    }

    public String getOdrAddr() {
        return odrAddr;
    }

    public void setOdrAddr(String odrAddr) {
        this.odrAddr = odrAddr == null ? null : odrAddr.trim();
    }

    public String getOdrStatus() {
        return odrStatus;
    }

    public void setOdrStatus(String odrStatus) {
        this.odrStatus = odrStatus == null ? null : odrStatus.trim();
    }
}