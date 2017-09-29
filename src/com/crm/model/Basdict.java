package com.crm.model;

public class Basdict {
    private Long dictId;

    private String dictType;

    private String dictItem;

    private String dictValue;

    private int dictIsEditable;
    

    public Basdict() {
		super();
	}

	public Long getDictId() {
        return dictId;
    }

    public void setDictId(Long dictId) {
        this.dictId = dictId;
    }

    public String getDictType() {
        return dictType;
    }

    public void setDictType(String dictType) {
        this.dictType = dictType == null ? null : dictType.trim();
    }

    public String getDictItem() {
        return dictItem;
    }

    public void setDictItem(String dictItem) {
        this.dictItem = dictItem == null ? null : dictItem.trim();
    }

    public String getDictValue() {
        return dictValue;
    }

    public void setDictValue(String dictValue) {
        this.dictValue = dictValue == null ? null : dictValue.trim();
    }

    public int getDictIsEditable() {
        return dictIsEditable;
    }

    public void setDictIsEditable(int dictIsEditable) {
        this.dictIsEditable = dictIsEditable;
    }
}