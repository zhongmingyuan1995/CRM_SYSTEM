package com.crm.dao;

import java.util.List;

import com.crm.model.Service;

public interface ServiceDao {
    int insertService(Service service);
    
    List<Service> queryLikeService(String where);
    
    int distributeService(Service service);

	int deleteService(Service service);

	List<Service> handleService(Long svrId);

	int dealService(Service service);

	List<Service> feedbackService(Long svrId);

	int savesvrResult(Service service);

	int savesvrResult2(Service service);

	List<Service> fileService(Long svrId);

	int getServiceCount(String where);
}