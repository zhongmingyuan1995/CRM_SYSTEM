package com.crm.dao;

import com.crm.model.Orderdetail;

public interface OrderdetailDao {
    int deleteByPrimaryKey(Long oddId);

    int insert(Orderdetail record);

    int insertSelective(Orderdetail record);

    Orderdetail selectByPrimaryKey(Long oddId);

    int updateByPrimaryKeySelective(Orderdetail record);

    int updateByPrimaryKey(Orderdetail record);
}