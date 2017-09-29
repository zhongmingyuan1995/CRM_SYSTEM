package com.crm.dao;

import java.util.List;

import com.crm.model.User;

public interface UserDao {
	//��¼
	boolean login(User user);

    int insert(User record);

	List<User> queryUserRole();
	
	List<User> queryUserFlag();

	List<User> getUserId(String username);
}