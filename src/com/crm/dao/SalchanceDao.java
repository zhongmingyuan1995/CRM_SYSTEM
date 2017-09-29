package com.crm.dao;

import java.util.List;

import com.crm.model.Salchance;
import com.crm.utils.Page;

public interface SalchanceDao {
    //插入销售机会
    int insertSalchance(Salchance salchance);
    //模糊查询所有销售机会
    List<Salchance> queryLike(String where);
    //根据id查询销售机会
	List<Salchance> querySalchanceByid(Salchance salchance);
	//更新销售机会
	int updateSalchance(Salchance salchance);
	//删除销售机会
	int delSalchanceByid(Salchance salchance);
	//指派销售机会
	int duesalchance(Salchance salchance);
	//模糊查询除了未指派的销售机会
	List<Salchance> queryLikeNodue(String where);
	//开发成功
	int updatesalsuccess(Long chcid);
	//终止开发
	int updatesaldefeat(Long chcid);
	
	int getSalchanceCount(String where);
	
	int getSalchanceNodueCount(String where);
}