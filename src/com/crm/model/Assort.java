package com.crm.model;

public class Assort {
    private Long atvId;

    private String atvCustNo;

    private String atvDate;

    private String atvPlace;

    private String atvTitle;

    private String atvDesc;
    
    
    public Assort() {
		super();
	}
    
    
	public Assort(String atvCustNo, String atvDate, String atvPlace, String atvTitle, String atvDesc) {
		super();
		this.atvCustNo = atvCustNo;
		this.atvDate = atvDate;
		this.atvPlace = atvPlace;
		this.atvTitle = atvTitle;
		this.atvDesc = atvDesc;
	}

	
	public Assort(String atvDate, String atvPlace, String atvTitle, String atvDesc,Long atvId) {
		super();		
		this.atvDate = atvDate;
		this.atvPlace = atvPlace;
		this.atvTitle = atvTitle;
		this.atvDesc = atvDesc;
		this.atvId = atvId;
	}


	public Long getAtvId() {
        return atvId;
    }

    public void setAtvId(Long atvId) {
        this.atvId = atvId;
    }

    public String getAtvCustNo() {
        return atvCustNo;
    }

    public void setAtvCustNo(String atvCustNo) {
        this.atvCustNo = atvCustNo == null ? null : atvCustNo.trim();
    }

    public String getAtvDate() {
        return atvDate;
    }

    public void setAtvDate(String atvDate) {
        this.atvDate = atvDate;
    }

    public String getAtvPlace() {
        return atvPlace;
    }

    public void setAtvPlace(String atvPlace) {
        this.atvPlace = atvPlace == null ? null : atvPlace.trim();
    }

    public String getAtvTitle() {
        return atvTitle;
    }

    public void setAtvTitle(String atvTitle) {
        this.atvTitle = atvTitle == null ? null : atvTitle.trim();
    }

    public String getAtvDesc() {
        return atvDesc;
    }

    public void setAtvDesc(String atvDesc) {
        this.atvDesc = atvDesc == null ? null : atvDesc.trim();
    }
}