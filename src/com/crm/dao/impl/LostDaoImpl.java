package com.crm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.crm.dao.LostDao;
import com.crm.model.Customer;
import com.crm.model.Lost;
import com.crm.utils.UtilConnect;

public class LostDaoImpl implements LostDao {

	@Override
	public List<Lost> selectByCustno(String where) {
		List<Lost> list = new ArrayList<Lost>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select lst_id,lst_cust_no,cust_name,cust_manager_id,cust_manager_name,lst_last_order_date,"
				+ "lst_lost_date,lst_delay,lst_reason,lst_status from (lost INNER JOIN customer ON customer.`cust_no` = lost.`lst_cust_no`)"
				+ "where 1=1"+ where;
		try{
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);	
			rs = st.executeQuery();
			while(rs.next()){
				Lost lost = new Lost();
				lost.setLstId(rs.getLong(1));
				Customer customer = new Customer();
				customer.setCustNo(rs.getString(2));
				customer.setCustName(rs.getString(3));
				customer.setCustManagerId(rs.getLong(4));
				customer.setCustManagerName(rs.getString(5));
				lost.setCustomer(customer);
				lost.setLstLastOrderDate(rs.getString(6));
				lost.setLstLostDate(rs.getString(7));
				lost.setLstDelay(rs.getString(8));
				lost.setLstReason(rs.getString(9));
				lost.setLstStatus(rs.getString(10));
				list.add(lost);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				UtilConnect.close(rs);
				UtilConnect.close(st);
				UtilConnect.close(conn);
			}
		return list;
	}

	@Override
	public List<Lost> selectByid(Long lstid) {
		List<Lost> list = new ArrayList<Lost>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select lst_id,lst_cust_no,cust_name,cust_manager_id,cust_manager_name,lst_last_order_date,"
				+ "lst_lost_date,lst_delay,lst_reason,lst_status from (lost INNER JOIN customer ON customer.`cust_no` = lost.`lst_cust_no`)"
				+ "where lst_id = ?";
		try{
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);	
			st.setLong(1, lstid);
			rs = st.executeQuery();
			while(rs.next()){
				Lost lost = new Lost();
				lost.setLstId(rs.getLong(1));
				Customer customer = new Customer();
				customer.setCustNo(rs.getString(2));
				customer.setCustName(rs.getString(3));
				customer.setCustManagerId(rs.getLong(4));
				customer.setCustManagerName(rs.getString(5));
				lost.setCustomer(customer);
				lost.setLstLastOrderDate(rs.getString(6));
				lost.setLstLostDate(rs.getString(7));
				lost.setLstDelay(rs.getString(8));
				lost.setLstReason(rs.getString(9));
				lost.setLstStatus(rs.getString(10));
				list.add(lost);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				UtilConnect.close(rs);
				UtilConnect.close(st);
				UtilConnect.close(conn);
			}
		return list;
	}

	@Override
	public int updatereprie(Lost lost) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "update lost set lst_delay = CONCAT(lst_delay,?,'<br>')  where lst_id = ?";
		try{
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);					
			st.setString(1, lost.getLstDelay());
			st.setLong(2, lost.getLstId());
			row = st.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			UtilConnect.close(st);
			UtilConnect.close(conn);
		}
		return row;
	}

	@Override
	public int updateconfig(Lost lost) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "update lost set lst_reason = ?,lst_status = '已流失' where lst_id = ?";
		try{
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);					
			st.setString(1, lost.getLstReason());
			st.setLong(2, lost.getLstId());
			row = st.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			UtilConnect.close(st);
			UtilConnect.close(conn);
		}
		return row;
	}

	@Override
	public int getLostCount(String where) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select  COUNT(*) from lost where 1=1" + where;
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);
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
