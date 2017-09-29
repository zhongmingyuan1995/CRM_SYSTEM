package com.crm.dao;

import java.util.List;

import com.crm.model.Customer;

public interface CustomerDao {

    int insertCustomer(Customer customer);

	List<Customer> queryLike(String where);
	
	List<Customer> queryBycustId(String custNo);
	
	int updateBycustId(Customer customer);

	List<Customer> queryCusName();

	int getCustomerCount(String where);
}