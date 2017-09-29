package com.crm.model;


public class Salchance {
    private Long chcId;

    private String chcSource;

    private String chcCustName;

    private String chcTitle;

    private Integer chcRate;

    private String chcLinkman;

    private String chcTel;

    private String chcDesc;

    private Long chcCreateId;

    private String chcCreateName;

    private String chcCreateDate;

    private Long chcDueId;

    private String chcDueName;

    private String chcDueDate;

    private String chcStatus;


	public Salchance() {
		super();
	}	
	
	
	public Salchance(String chcCustName,String chcSource,String chcTitle, Integer chcRate,
			String chcLinkman, String chcTel, String chcDesc, String chcCreateName, String chcCreateDate) {
		super();
		this.chcCustName = chcCustName;
		this.chcSource = chcSource;
		this.chcTitle = chcTitle;
		this.chcRate = chcRate;
		this.chcLinkman = chcLinkman;
		this.chcTel = chcTel;
		this.chcDesc = chcDesc;
		this.chcCreateName = chcCreateName;
		this.chcCreateDate = chcCreateDate;
	}
	
	

	public Salchance( String chcCustName, String chcSource,String chcTitle, Integer chcRate,
			String chcLinkman, String chcTel, String chcDesc,Long chcId) {
		super();
		this.chcSource = chcSource;
		this.chcCustName = chcCustName;
		this.chcTitle = chcTitle;
		this.chcRate = chcRate;
		this.chcLinkman = chcLinkman;
		this.chcTel = chcTel;
		this.chcDesc = chcDesc;
		this.chcId = chcId;
	}


	public Salchance(Long chcid) {
		this.chcId = chcid;
	}

	public Salchance(Long chcdueid,String chcduename, String chcduedate,Long chcid) {
		this.chcDueId = chcdueid;
		this.chcDueName = chcduename;
		this.chcDueDate = chcduedate;
		this.chcId = chcid;
	}


	public Long getChcId() {
        return chcId;
    }

    public void setChcId(Long chcId) {
        this.chcId = chcId;
    }

    public String getChcSource() {
        return chcSource;
    }

    public void setChcSource(String chcSource) {
        this.chcSource = chcSource == null ? null : chcSource.trim();
    }

    public String getChcCustName() {
        return chcCustName;
    }

    public void setChcCustName(String chcCustName) {
        this.chcCustName = chcCustName == null ? null : chcCustName.trim();
    }

    public String getChcTitle() {
        return chcTitle;
    }

    public void setChcTitle(String chcTitle) {
        this.chcTitle = chcTitle == null ? null : chcTitle.trim();
    }

    public Integer getChcRate() {
        return chcRate;
    }

    public void setChcRate(Integer chcRate) {
        this.chcRate = chcRate;
    }

    public String getChcLinkman() {
        return chcLinkman;
    }

    public void setChcLinkman(String chcLinkman) {
        this.chcLinkman = chcLinkman == null ? null : chcLinkman.trim();
    }

    public String getChcTel() {
        return chcTel;
    }

    public void setChcTel(String chcTel) {
        this.chcTel = chcTel == null ? null : chcTel.trim();
    }

    public String getChcDesc() {
        return chcDesc;
    }

    public void setChcDesc(String chcDesc) {
        this.chcDesc = chcDesc == null ? null : chcDesc.trim();
    }

    public Long getChcCreateId() {
        return chcCreateId;
    }

    public void setChcCreateId(Long chcCreateId) {
        this.chcCreateId = chcCreateId;
    }

    public String getChcCreateName() {
        return chcCreateName;
    }

    public void setChcCreateName(String chcCreateName) {
        this.chcCreateName = chcCreateName == null ? null : chcCreateName.trim();
    }

    public String getChcCreateDate() {
        return chcCreateDate;
    }

    public void setChcCreateDate(String chcCreateDate) {
        this.chcCreateDate = chcCreateDate == null ? null : chcCreateDate.trim();
    }

    public Long getChcDueId() {
        return chcDueId;
    }

    public void setChcDueId(Long chcDueId) {
        this.chcDueId = chcDueId;
    }

    public String getChcDueName() {
        return chcDueName;
    }

    public void setChcDueName(String chcDueName) {
        this.chcDueName = chcDueName == null ? null : chcDueName.trim();
    }

    public String getChcDueDate() {
        return chcDueDate;
    }

    public void setChcDueDate(String chcDueDate) {
        this.chcDueDate = chcDueDate;
    }

    public String getChcStatus() {
        return chcStatus;
    }

    public void setChcStatus(String chcStatus) {
        this.chcStatus = chcStatus == null ? null : chcStatus.trim();
    }
}