package com.crm.dao;

import java.util.List;

import com.crm.model.Linkman;

public interface LinkmanDao {
	
    int deleteLinkman(Long lkmId);

    int insertLinkman(Linkman linkman);

    List<Linkman> selectLinkman(String custNo,String where);

    int updateLinkman(Linkman linkman);

	List<Linkman> selectLinkmanBylkmId(Long lkmId);

	int getlinkmanCount(String lkmCustNo);
}