package com.crm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.crm.dao.LinkmanDao;
import com.crm.model.Linkman;
import com.crm.utils.UtilConnect;

public class LinkmanDaoImpl implements LinkmanDao {

	@Override
	public int deleteLinkman(Long lkmId) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "delete from linkman  where lkm_id = ?";
		try{
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);
			st.setLong(1, lkmId);
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
	public int insertLinkman(Linkman linkman) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st =null;
		String sql = "insert into linkman (lkm_cust_no,lkm_name,lkm_sex,lkm_postion,lkm_tel,lkm_mobile,lkm_memo) values (?,?,?,?,?,?,?)";
		try{
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);
			st.setString(1, linkman.getLkmCustNo());
			st.setString(2, linkman.getLkmName());
			st.setString(3, linkman.getLkmSex());
			st.setString(4, linkman.getLkmPostion());
			st.setString(5, linkman.getLkmTel());
			st.setString(6, linkman.getLkmMobile());
			st.setString(7, linkman.getLkmMemo());
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
	public List<Linkman> selectLinkman(String custNo,String where) {
		List<Linkman> list = new ArrayList<Linkman>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		//where 1=1; 这个条件始终为True，在不定数量查询条件情况下，1=1可以很方便的规范语句
		//如果查询条件都为false时查询所有
		String sql = "select lkm_id,lkm_cust_no,lkm_name,lkm_sex,lkm_postion,lkm_tel,lkm_mobile,lkm_memo from linkman  where lkm_cust_no = ?"+where;
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);	
			st.setString(1, custNo);
			rs = st.executeQuery();
			// ResultSet是个集合，里面存的是数据库的表数据，以二维表的形式呈现，
			// rs.next也是一个游标，默认情况下游标是指的第一行数据之前，当第一次调用。next()的时候游标指的是第一行数据，再次调用，指的是下一行数据
			while (rs.next()) {	
				Linkman linkman = new Linkman();
				linkman.setLkmId(rs.getLong(1));
				linkman.setLkmCustNo(rs.getString(2));
				linkman.setLkmName(rs.getString(3));
				linkman.setLkmSex(rs.getString(4));
				linkman.setLkmPostion(rs.getString(5));
				linkman.setLkmTel(rs.getString(6));
				linkman.setLkmMobile(rs.getString(7));
				linkman.setLkmMemo(rs.getString(8));
				list.add(linkman);
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
	public int updateLinkman(Linkman linkman) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "update linkman set lkm_name = ?,lkm_sex = ?,lkm_postion = ?,lkm_tel = ?,lkm_mobile = ?,lkm_memo = ? where lkm_id = ?";
		try{
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);					
			st.setString(1, linkman.getLkmName());
			st.setString(2, linkman.getLkmSex());
			st.setString(3, linkman.getLkmPostion());
			st.setString(4, linkman.getLkmTel());
			st.setString(5, linkman.getLkmMobile());
			st.setString(6, linkman.getLkmMemo());
			st.setLong(7, linkman.getLkmId());
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
	public List<Linkman> selectLinkmanBylkmId(Long lkmId) {
		List<Linkman> list = new ArrayList<Linkman>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		//where 1=1; 这个条件始终为True，在不定数量查询条件情况下，1=1可以很方便的规范语句
		//如果查询条件都为false时查询所有
		String sql = "select lkm_id,lkm_cust_no,lkm_name,lkm_sex,lkm_postion,lkm_tel,lkm_mobile,lkm_memo from linkman  where lkm_id = ?";
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);	
			st.setLong(1, lkmId);
			rs = st.executeQuery();
			// ResultSet是个集合，里面存的是数据库的表数据，以二维表的形式呈现，
			// rs.next也是一个游标，默认情况下游标是指的第一行数据之前，当第一次调用。next()的时候游标指的是第一行数据，再次调用，指的是下一行数据
			while (rs.next()) {	
				Linkman linkman = new Linkman();
				linkman.setLkmId(rs.getLong(1));
				linkman.setLkmCustNo(rs.getString(2));
				linkman.setLkmName(rs.getString(3));
				linkman.setLkmSex(rs.getString(4));
				linkman.setLkmPostion(rs.getString(5));
				linkman.setLkmTel(rs.getString(6));
				linkman.setLkmMobile(rs.getString(7));
				linkman.setLkmMemo(rs.getString(8));
				list.add(linkman);
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
	public int getlinkmanCount(String lkmCustNo) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select  COUNT(*) from linkman where lkm_cust_no = ?";
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);
			st.setString(1, lkmCustNo);
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
