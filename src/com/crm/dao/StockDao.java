package com.crm.dao;

import com.crm.model.Stock;

public interface StockDao {
    int deleteByPrimaryKey(Long stkId);

    int insert(Stock record);

    int insertSelective(Stock record);

    Stock selectByPrimaryKey(Long stkId);

    int updateByPrimaryKeySelective(Stock record);

    int updateByPrimaryKey(Stock record);
}