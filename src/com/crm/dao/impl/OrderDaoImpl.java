package com.crm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.crm.dao.OrderDao;
import com.crm.model.Order;
import com.crm.utils.UtilConnect;

public class OrderDaoImpl implements OrderDao {

	@Override
	public int deleteOrder(Long odrId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertOrder(Order order) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Order> selectOrder(String odrCustNo,String where) {
		List<Order> list = new ArrayList<Order>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		//where 1=1; 这个条件始终为True，在不定数量查询条件情况下，1=1可以很方便的规范语句
		//如果查询条件都为false时查询所有
		String sql = "select odr_id,odr_cust_no,odr_date,odr_addr,odr_status from orders  where odr_cust_no = ?"+where;
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);	
			st.setString(1, odrCustNo);
			rs = st.executeQuery();
			// ResultSet是个集合，里面存的是数据库的表数据，以二维表的形式呈现，
			// rs.next也是一个游标，默认情况下游标是指的第一行数据之前，当第一次调用。next()的时候游标指的是第一行数据，再次调用，指的是下一行数据
			while (rs.next()) {	
				Order order = new Order();
				order.setOdrId(rs.getLong(1));
				order.setOdrCustNo(rs.getString(2));
				order.setOdrDate(rs.getString(3));
				order.setOdrAddr(rs.getString(4));
				order.setOdrStatus(rs.getString(5));			
				list.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			UtilConnect.close(rs);
			UtilConnect.close(st);
			UtilConnect.close(conn);
		}
		return list;
	}

	@Override
	public int updateOrder(Order order) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Order> selectOrderByodrId(Long odrId) {
		List<Order> list = new ArrayList<Order>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		//where 1=1; 这个条件始终为True，在不定数量查询条件情况下，1=1可以很方便的规范语句
		//如果查询条件都为false时查询所有
		String sql = "select odr_id,odr_cust_no,odr_date,odr_addr,odr_status from orders  where odr_id = ?";
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);	
			st.setLong(1, odrId);
			rs = st.executeQuery();
			// ResultSet是个集合，里面存的是数据库的表数据，以二维表的形式呈现，
			// rs.next也是一个游标，默认情况下游标是指的第一行数据之前，当第一次调用。next()的时候游标指的是第一行数据，再次调用，指的是下一行数据
			while (rs.next()) {	
				Order order = new Order();
				order.setOdrId(rs.getLong(1));
				order.setOdrCustNo(rs.getString(2));
				order.setOdrDate(rs.getString(3));
				order.setOdrAddr(rs.getString(4));
				order.setOdrStatus(rs.getString(5));			
				list.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			UtilConnect.close(rs);
			UtilConnect.close(st);
			UtilConnect.close(conn);
		}
		return list;
	}

	@Override
	public int getOrderCount(String odrCustNo) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select  COUNT(*) from orders where odr_cust_no = ?";
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);
			st.setString(1, odrCustNo);
			rs = st.executeQuery();
			while(rs.next()){
				row = rs.getInt(1);
            }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {			
			UtilConnect.close(st);
			UtilConnect.close(conn);
		}
		return row;	
	}

}
