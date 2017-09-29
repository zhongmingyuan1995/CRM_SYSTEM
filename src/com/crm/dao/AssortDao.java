package com.crm.dao;

import java.util.List;

import com.crm.model.Assort;

public interface AssortDao {
	int deleteAssort(Long atvId);

    int insertAssort(Assort assort);

    List<Assort> selectAssort(String custNo,String where);

    int updateAssort(Assort assort);

	List<Assort> selectAssortByatvId(Long atvId);

	int getAssortCount(String custNo);
}