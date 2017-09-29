package com.crm.dao;

import java.util.List;

import com.crm.model.Lost;

public interface LostDao {
    List<Lost> selectByCustno(String sql);
    
    List<Lost> selectByid(Long lstid);

    int updatereprie(Lost lost);

    int updateconfig(Lost lost);

	int getLostCount(String where);
}