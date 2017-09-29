package com.crm.dao;

import java.util.List;

import com.crm.model.Basdict;

public interface BasdictDao {
    int deleteBasdict(Long dictId);

    int insertBasdict(Basdict record);

    List<Basdict> queryBasdict();

    int updateBasdict(Basdict record);

	List<Basdict> queryLikeBasdict(String where);

	int getBasdictCount(String where);
}