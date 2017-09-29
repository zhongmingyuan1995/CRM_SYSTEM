package com.crm.model;


public class Plan {
    private Long plaId;

    private Long plaChcId;

    private String plaDate;

    private String plaTodo;

    private String plaResult;
    
    
    public Plan() {
		super();
	}
    
    
	public Plan(Long plaChcId) {
		super();
		this.plaChcId = plaChcId;
	}
	
	

	public Plan(String plaTodo,Long plaId) {
		super();
		this.plaTodo = plaTodo;
		this.plaId = plaId;
		
	}

	
	public Plan (Long plaChcId,String plaDate, String plaTodo) {
		this.plaChcId = plaChcId;
		this.plaDate = plaDate;
		this.plaTodo = plaTodo;
	}
	
	


	public Plan(Long plaChcId, String plaDate, String plaTodo, String plaResult) {
		super();
		this.plaChcId = plaChcId;
		this.plaDate = plaDate;
		this.plaTodo = plaTodo;
		this.plaResult = plaResult;
	}


	public Long getPlaId() {
        return plaId;
    }
    
    public void setPlaId(Long plaId) {
        this.plaId = plaId;
    }

    public Long getPlaChcId() {
        return plaChcId;
    }

    public void setPlaChcId(Long plaChcId) {
        this.plaChcId = plaChcId;
    }

    public String getPlaDate() {
        return plaDate;
    }

    public void setPlaDate(String plaDate) {
        this.plaDate = plaDate;
    }

    public String getPlaTodo() {
        return plaTodo;
    }

    public void setPlaTodo(String plaTodo) {
        this.plaTodo = plaTodo == null ? null : plaTodo.trim();
    }

    public String getPlaResult() {
        return plaResult;
    }

    public void setPlaResult(String plaResult) {
        this.plaResult = plaResult == null ? null : plaResult.trim();
    }
}