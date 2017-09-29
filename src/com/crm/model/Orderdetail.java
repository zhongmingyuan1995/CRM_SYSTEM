package com.crm.model;

public class Orderdetail {
    private Long oddId;

    private Long oddOrderId;

    private Long oddProdId;

    private Integer oddCount;

    private String oddUnit;

    private Double oddPrice;

    public Long getOddId() {
        return oddId;
    }

    public void setOddId(Long oddId) {
        this.oddId = oddId;
    }

    public Long getOddOrderId() {
        return oddOrderId;
    }

    public void setOddOrderId(Long oddOrderId) {
        this.oddOrderId = oddOrderId;
    }

    public Long getOddProdId() {
        return oddProdId;
    }

    public void setOddProdId(Long oddProdId) {
        this.oddProdId = oddProdId;
    }

    public Integer getOddCount() {
        return oddCount;
    }

    public void setOddCount(Integer oddCount) {
        this.oddCount = oddCount;
    }

    public String getOddUnit() {
        return oddUnit;
    }

    public void setOddUnit(String oddUnit) {
        this.oddUnit = oddUnit == null ? null : oddUnit.trim();
    }

    public Double getOddPrice() {
        return oddPrice;
    }

    public void setOddPrice(Double oddPrice) {
        this.oddPrice = oddPrice;
    }
}