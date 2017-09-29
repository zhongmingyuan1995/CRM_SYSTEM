package com.crm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.crm.dao.SalchanceDao;
import com.crm.model.Salchance;
import com.crm.utils.Page;
import com.crm.utils.UtilConnect;

public class SalchanceDaoImpl implements SalchanceDao {
	
	@Override
	public List<Salchance> queryLike(String where) {
		List<Salchance> list = new ArrayList<Salchance>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		//where 1=1; 这个条件始终为True，在不定数量查询条件情况下，1=1可以很方便的规范语句
		//如果查询条件都为false时查询所有
		String sql = "select * from sal_chance  where 1=1" + where;
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();
			// ResultSet是个集合，里面存的是数据库的表数据，以二维表的形式呈现，
			// rs.next也是一个游标，默认情况下游标是指的第一行数据之前，当第一次调用。next()的时候游标指的是第一行数据，再次调用，指的是下一行数据
			while (rs.next()) {	
				Salchance salchance = new Salchance();
				salchance.setChcId(rs.getLong(1));
				salchance.setChcSource(rs.getString(2));
				salchance.setChcCustName(rs.getString(3));
				salchance.setChcTitle(rs.getString(4));
				salchance.setChcRate(rs.getInt(5));
				salchance.setChcLinkman(rs.getString(6));
				salchance.setChcTel(rs.getString(7));
				salchance.setChcDesc(rs.getString(8));
				salchance.setChcCreateId(rs.getLong(9));
				salchance.setChcCreateName(rs.getString(10));
				salchance.setChcCreateDate(rs.getString(11));
				salchance.setChcDueId(rs.getLong(12));
				salchance.setChcDueName(rs.getString(13));
				salchance.setChcDueDate(rs.getString(14));
				salchance.setChcStatus(rs.getString(15));
				list.add(salchance);
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
	public int insertSalchance(Salchance salchance) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;			
		String sql = "insert into sal_chance (chc_cust_name,chc_source,chc_title,chc_rate,chc_linkman,chc_tel,chc_desc,chc_create_name,chc_create_date) values (?,?,?,?,?,?,?,?,?)";
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);
			//因为要执行多次查询，使用prepareStatement;
			st.setString(1, salchance.getChcCustName());
			st.setString(2, salchance.getChcSource());
			st.setString(3, salchance.getChcTitle());
			st.setLong(4, salchance.getChcRate());
			st.setString(5, salchance.getChcLinkman());
			st.setString(6, salchance.getChcTel());
			st.setString(7, salchance.getChcDesc());
			st.setString(8, salchance.getChcCreateName());
			st.setString(9, salchance.getChcCreateDate());
			row=st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {			
			UtilConnect.close(st);
			UtilConnect.close(conn);
		}
		return row;		
	}	


	@Override
	public List<Salchance> querySalchanceByid(Salchance salchance) {
		List<Salchance> list = new ArrayList<Salchance>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select chc_id,chc_cust_name,chc_source,chc_title,chc_rate,chc_linkman,chc_tel,chc_desc,chc_create_name,"
				+ "chc_create_date,chc_due_id,chc_due_name,chc_due_date,chc_status from sal_chance where chc_id = ?";
		try{
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);
			st.setLong(1, salchance.getChcId());
			rs = st.executeQuery();		
			while (rs.next()) {	
				Salchance sal = new Salchance();
				sal.setChcId(rs.getLong(1));
				sal.setChcCustName(rs.getString(2));
				sal.setChcSource(rs.getString(3));			
				sal.setChcTitle(rs.getString(4));
				sal.setChcRate(rs.getInt(5));
				sal.setChcLinkman(rs.getString(6));
				sal.setChcTel(rs.getString(7));
				sal.setChcDesc(rs.getString(8));
				sal.setChcCreateName(rs.getString(9));
				sal.setChcCreateDate(rs.getString(10));
				sal.setChcDueId(rs.getLong(11));
				sal.setChcDueName(rs.getString(12));
				sal.setChcDueDate(rs.getString(13));
				sal.setChcStatus(rs.getString(14));
				list.add(sal);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			UtilConnect.close(rs);
			UtilConnect.close(st);
			UtilConnect.close(conn);
		}
		return list;
		}

	@Override
	public int updateSalchance(Salchance salchance) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;			
		String sql = "update  sal_chance set chc_cust_name = ?,chc_source = ?,chc_title = ?,chc_rate = ?,chc_linkman = ?,chc_tel = ?,chc_desc = ? where chc_id = ?";
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);
			//因为要执行多次查询，使用prepareStatement;
			st.setString(1, salchance.getChcCustName());
			st.setString(2, salchance.getChcSource());
			st.setString(3, salchance.getChcTitle());
			st.setLong(4, salchance.getChcRate());
			st.setString(5, salchance.getChcLinkman());
			st.setString(6, salchance.getChcTel());
			st.setString(7, salchance.getChcDesc());
			st.setLong(8, salchance.getChcId());
			row=st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {			
			UtilConnect.close(st);
			UtilConnect.close(conn);
		}
		return row;		
	}

	@Override
	public int delSalchanceByid(Salchance salchance) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;			
		String sql = "delete  from sal_chance  where chc_id = ?";
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);
			st.setLong(1, salchance.getChcId());
			row=st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {			
			UtilConnect.close(st);
			UtilConnect.close(conn);
		}
		return row;	
	}

	@Override
	public int duesalchance(Salchance salchance) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;			
		String sql = "update  sal_chance set chc_due_id = ?,chc_due_name = ?,chc_due_date = ?,chc_status = '已指派' where chc_id = ?";
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);
			//因为要执行多次查询，使用prepareStatement;
			st.setLong(1, salchance.getChcDueId());
			st.setString(2, salchance.getChcDueName());
			st.setString(3, salchance.getChcDueDate());
			st.setLong(4, salchance.getChcId());
			row=st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {			
			UtilConnect.close(st);
			UtilConnect.close(conn);
		}
		return row;	
	}



	@Override
	public List<Salchance> queryLikeNodue(String where) {
		List<Salchance> list = new ArrayList<Salchance>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		//where 1=1; 这个条件始终为True，在不定数量查询条件情况下，1=1可以很方便的规范语句
		//如果查询条件都为false时查询所有
		String sql = "select * from sal_chance  where not chc_status = '未分配'"+ where;
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);			
			rs = st.executeQuery();
			// ResultSet是个集合，里面存的是数据库的表数据，以二维表的形式呈现，
			// rs.next也是一个游标，默认情况下游标是指的第一行数据之前，当第一次调用。next()的时候游标指的是第一行数据，再次调用，指的是下一行数据
			while (rs.next()) {	
				Salchance salchance = new Salchance();
				salchance.setChcId(rs.getLong(1));
				salchance.setChcSource(rs.getString(2));
				salchance.setChcCustName(rs.getString(3));
				salchance.setChcTitle(rs.getString(4));
				salchance.setChcRate(rs.getInt(5));
				salchance.setChcLinkman(rs.getString(6));
				salchance.setChcTel(rs.getString(7));
				salchance.setChcDesc(rs.getString(8));
				salchance.setChcCreateId(rs.getLong(9));
				salchance.setChcCreateName(rs.getString(10));
				salchance.setChcCreateDate(rs.getString(11));
				salchance.setChcDueId(rs.getLong(12));
				salchance.setChcDueName(rs.getString(13));
				salchance.setChcDueDate(rs.getString(14));
				salchance.setChcStatus(rs.getString(15));
				list.add(salchance);
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
	public int updatesalsuccess(Long chcid) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;			
		String sql = "update  sal_chance set chc_status = '开发成功' where chc_id = ?";
		try {
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);
			st.setLong(1, chcid);
			row=st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {			
			UtilConnect.close(st);
			UtilConnect.close(conn);
		}
		return row;
	}



	@Override
	public int updatesaldefeat(Long chcid) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;			
		String sql = "update  sal_chance set chc_status = '开发失败' where chc_id = ?";
		try {
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);
			st.setLong(1, chcid);
			row=st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {			
			UtilConnect.close(st);
			UtilConnect.close(conn);
		}
		return row;
	}



	@Override
	public int getSalchanceCount(String where) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select  COUNT(*) from sal_chance where 1=1" + where;
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



	@Override
	public int getSalchanceNodueCount(String where) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select  COUNT(*) from sal_chance where not chc_status = '未分配'" + where;
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
