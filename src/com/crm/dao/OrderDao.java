package com.crm.dao;

import java.util.List;
import com.crm.model.Order;

public interface OrderDao {
	int deleteOrder(Long odrId);

    int insertOrder(Order order);

    List<Order> selectOrder(String odrCustNo,String where);

    int updateOrder(Order order);

	List<Order> selectOrderByodrId(Long odrId);

	int getOrderCount(String odrCustNo);
}