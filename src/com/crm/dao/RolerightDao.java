package com.crm.dao;

import com.crm.model.Roleright;

public interface RolerightDao {
    int deleteByPrimaryKey(Long roleId);

    int insert(Roleright record);

    int insertSelective(Roleright record);

    Roleright selectByPrimaryKey(Long roleId);

    int updateByPrimaryKeySelective(Roleright record);

    int updateByPrimaryKey(Roleright record);
}