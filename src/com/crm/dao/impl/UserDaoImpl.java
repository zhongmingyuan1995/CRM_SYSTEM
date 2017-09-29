package com.crm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.crm.dao.UserDao;
import com.crm.model.Salchance;
import com.crm.model.User;
import com.crm.utils.UtilConnect;

public class UserDaoImpl implements UserDao {
	
	
	@Override
	public boolean login(User user) {
		boolean result=false;  
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select user_id,user_name,user_password,user_role_id,user_flag from user  where user_name = ? and user_password = ?";
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);
			//因为要执行多次查询，使用prepareStatement;
			st.setString(1, user.getUserName());
			st.setString(2, user.getUserPassword());
			rs = st.executeQuery();
			if(rs.next()){  
                result = true;
            }else{  
                result = false;  
            }  
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			UtilConnect.close(rs);
			UtilConnect.close(st);
			UtilConnect.close(conn);
		}
		return result;
	}
	

	@Override
	public int insert(User record) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<User> queryUserRole() {
		List<User> list = new ArrayList<User>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		//where 1=1; 这个条件始终为True，在不定数量查询条件情况下，1=1可以很方便的规范语句
		//如果查询条件都为false时查询所有
		String sql = "select user_id,user_name from user  where user_role_id = 3 and user_flag = 1";
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);			
			rs = st.executeQuery();
			// ResultSet是个集合，里面存的是数据库的表数据，以二维表的形式呈现，
			// rs.next也是一个游标，默认情况下游标是指的第一行数据之前，当第一次调用。next()的时候游标指的是第一行数据，再次调用，指的是下一行数据
			while (rs.next()) {	
				User user = new User();
				user.setUserId(rs.getLong(1));
				user.setUserName(rs.getString(2));
				list.add(user);
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
	public List<User> queryUserFlag() {
		List<User> list = new ArrayList<User>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		//where 1=1; 这个条件始终为True，在不定数量查询条件情况下，1=1可以很方便的规范语句
		//如果查询条件都为false时查询所有
		String sql = "select user_id,user_name from user  where user_flag = 1";
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);			
			rs = st.executeQuery();
			// ResultSet是个集合，里面存的是数据库的表数据，以二维表的形式呈现，
			// rs.next也是一个游标，默认情况下游标是指的第一行数据之前，当第一次调用。next()的时候游标指的是第一行数据，再次调用，指的是下一行数据
			while (rs.next()) {	
				User user = new User();
				user.setUserId(rs.getLong(1));
				user.setUserName(rs.getString(2));
				list.add(user);
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
	public List<User> getUserId(String username) {
		List<User> list = new ArrayList<User>(); 
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select user_id from user  where user_name = ?";
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);
			st.setString(1, username);
			rs = st.executeQuery();
			// ResultSet是个集合，里面存的是数据库的表数据，以二维表的形式呈现，
			// rs.next也是一个游标，默认情况下游标是指的第一行数据之前，当第一次调用。next()的时候游标指的是第一行数据，再次调用，指的是下一行数据
			while (rs.next()) {	
				User user = new User();
				user.setUserId(rs.getLong(1));
				list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			UtilConnect.close(st);
			UtilConnect.close(conn);
		}
		return list;
	}


}
