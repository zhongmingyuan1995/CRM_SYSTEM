package com.crm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.crm.dao.BasdictDao;
import com.crm.model.Basdict;
import com.crm.utils.UtilConnect;

public class BasdictDaoImpl implements BasdictDao {

	@Override
	public int deleteBasdict(Long dictId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertBasdict(Basdict record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Basdict> queryBasdict() {
		List<Basdict> list = new ArrayList<Basdict>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		//where 1=1; 这个条件始终为True，在不定数量查询条件情况下，1=1可以很方便的规范语句
		//如果查询条件都为false时查询所有
		String sql = "select * from bas_dict  where  dict_is_editable = 1";
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);			
			rs = st.executeQuery();
			// ResultSet是个集合，里面存的是数据库的表数据，以二维表的形式呈现，
			// rs.next也是一个游标，默认情况下游标是指的第一行数据之前，当第一次调用。next()的时候游标指的是第一行数据，再次调用，指的是下一行数据
			while (rs.next()) {	
				Basdict basdict = new Basdict();
				basdict.setDictId(rs.getLong(1));
				basdict.setDictType(rs.getString(2));
				basdict.setDictItem(rs.getString(3));
				basdict.setDictValue(rs.getString(4));
				list.add(basdict);
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
	public int updateBasdict(Basdict record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Basdict> queryLikeBasdict(String where) {
		List<Basdict> list = new ArrayList<Basdict>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		//where 1=1; 这个条件始终为True，在不定数量查询条件情况下，1=1可以很方便的规范语句
		//如果查询条件都为false时查询所有
		String sql = "select * from bas_dict where 1=1"+where;
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);			
			rs = st.executeQuery();
			// ResultSet是个集合，里面存的是数据库的表数据，以二维表的形式呈现，
			// rs.next也是一个游标，默认情况下游标是指的第一行数据之前，当第一次调用。next()的时候游标指的是第一行数据，再次调用，指的是下一行数据
			while (rs.next()) {	
				Basdict basdict = new Basdict();
				basdict.setDictId(rs.getLong(1));
				basdict.setDictType(rs.getString(2));
				basdict.setDictItem(rs.getString(3));
				basdict.setDictValue(rs.getString(4));
				basdict.setDictIsEditable(rs.getInt(5));
				list.add(basdict);
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
	public int getBasdictCount(String where) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select  COUNT(*) from bas_dict where 1=1" + where;
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
