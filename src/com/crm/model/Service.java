package com.crm.model;

public class Service {
    private Long svrId;

    private String svrType;

    private String svrTitle;
    
    private Customer customer;

    private String svrCustNo;

    private String svrStatus;

    private String svrRequest;

    private Long svrCreateId;

    private String svrCreateName;

    private String svrCreateDate;

    private Long svrDueId;

    private String svrDueName;

    private String svrDueDate;

    private String svrDeal;

    private Long svrDealId;

    private String svrDealName;

    private String svrDealDate;

    private String svrResult;

    private Integer svrSatisfy;
    
    

    public Service() {
		super();
	}
    
    
	public Service(Long svrDueId, String svrDueName, String svrDueDate,Long svrId) {	
		this.svrDueId = svrDueId;
		this.svrDueName = svrDueName;
		this.svrDueDate = svrDueDate;
		this.svrId = svrId;
	}
	
	

	public Service(String svrDeal, Long svrDealId, String svrDealName, String svrDealDate,Long svrId) {
		this.svrDeal = svrDeal;
		this.svrDealId = svrDealId;
		this.svrDealName = svrDealName;
		this.svrDealDate = svrDealDate;
		this.svrId = svrId;
	}


	public Service(String svrType, Customer customer, String svrTitle, String svrCustNo, String svrCreateDate) {
		this.svrType = svrType;
		this.customer = customer;
		this.svrTitle = svrTitle;
		this.svrCustNo = svrCustNo;
		this.svrCreateDate = svrCreateDate;
	}


	public Service(Long svrId, String svrType, String svrTitle, String svrCustNo, String svrRequest,
			Long svrCreateId, String svrCreateName, String svrCreateDate) {
		super();
		this.svrId = svrId;
		this.svrType = svrType;
		this.svrTitle = svrTitle;
		this.svrCustNo = svrCustNo;
		this.svrRequest = svrRequest;
		this.svrCreateId = svrCreateId;
		this.svrCreateName = svrCreateName;
		this.svrCreateDate = svrCreateDate;
	}


	public Service(Long svrId) {
		this.svrId = svrId;
	}


	public Service(String svrResult, Integer svrSatisfy, Long svrId) {
		this.svrResult = svrResult;
		this.svrSatisfy = svrSatisfy;
		this.svrId = svrId;
	}


	public Long getSvrId() {
        return svrId;
    }

    public void setSvrId(Long svrId) {
        this.svrId = svrId;
    }

    public String getSvrType() {
        return svrType;
    }

    public void setSvrType(String svrType) {
        this.svrType = svrType == null ? null : svrType.trim();
    }

    public String getSvrTitle() {
        return svrTitle;
    }

    public void setSvrTitle(String svrTitle) {
        this.svrTitle = svrTitle == null ? null : svrTitle.trim();
    }

    public String getSvrCustNo() {
        return svrCustNo;
    }

    public void setSvrCustNo(String svrCustNo) {
        this.svrCustNo = svrCustNo == null ? null : svrCustNo.trim();
    }

    public String getSvrStatus() {
        return svrStatus;
    }

    public void setSvrStatus(String svrStatus) {
        this.svrStatus = svrStatus == null ? null : svrStatus.trim();
    }

    public String getSvrRequest() {
        return svrRequest;
    }

    public void setSvrRequest(String svrRequest) {
        this.svrRequest = svrRequest == null ? null : svrRequest.trim();
    }

    public Long getSvrCreateId() {
        return svrCreateId;
    }

    public void setSvrCreateId(Long svrCreateId) {
        this.svrCreateId = svrCreateId;
    }

    public String getSvrCreateName() {
        return svrCreateName;
    }

    public void setSvrCreateName(String svrCreateName) {
        this.svrCreateName = svrCreateName == null ? null : svrCreateName.trim();
    }

    public String getSvrCreateDate() {
        return svrCreateDate;
    }

    public void setSvrCreateDate(String svrCreateDate) {
        this.svrCreateDate = svrCreateDate;
    }

    public Long getSvrDueId() {
        return svrDueId;
    }

    public void setSvrDueId(Long svrDueId) {
        this.svrDueId = svrDueId;
    }

    public String getSvrDueName() {
        return svrDueName;
    }

    public void setSvrDueName(String svrDueName) {
        this.svrDueName = svrDueName == null ? null : svrDueName.trim();
    }

    public String getSvrDueDate() {
        return svrDueDate;
    }

    public void setSvrDueDate(String svrDueDate) {
        this.svrDueDate = svrDueDate;
    }

    public String getSvrDeal() {
        return svrDeal;
    }

    public void setSvrDeal(String svrDeal) {
        this.svrDeal = svrDeal == null ? null : svrDeal.trim();
    }

    public Long getSvrDealId() {
        return svrDealId;
    }

    public void setSvrDealId(Long svrDealId) {
        this.svrDealId = svrDealId;
    }

    public String getSvrDealName() {
        return svrDealName;
    }

    public void setSvrDealName(String svrDealName) {
        this.svrDealName = svrDealName == null ? null : svrDealName.trim();
    }

    public String getSvrDealDate() {
        return svrDealDate;
    }

    public void setSvrDealDate(String svrDealDate) {
        this.svrDealDate = svrDealDate;
    }

    public String getSvrResult() {
        return svrResult;
    }

    public void setSvrResult(String svrResult) {
        this.svrResult = svrResult == null ? null : svrResult.trim();
    }

    public Integer getSvrSatisfy() {
        return svrSatisfy;
    }

    public void setSvrSatisfy(Integer svrSatisfy) {
        this.svrSatisfy = svrSatisfy;
    }


	public Customer getCustomer() {
		return customer;
	}


	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
    
    
}