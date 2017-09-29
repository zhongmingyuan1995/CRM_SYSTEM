package com.crm.dao;

import java.util.List;

import com.crm.model.Plan;

public interface PlanDao {

    int insertPlan(Plan plan);
    
    List<Plan> selectBychcid(Plan plan);

    int updateByid(Plan plan);
    
    int deleteByid(Long planid);

	int updateresultByid(String planresult, Long planid);
    
}