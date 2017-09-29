package com.crm.dao;

import com.crm.model.Product;

public interface ProductDao {
    int deleteByPrimaryKey(Long prodId);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Long prodId);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);
}