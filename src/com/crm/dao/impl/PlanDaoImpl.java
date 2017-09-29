package com.crm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.crm.dao.PlanDao;
import com.crm.model.Plan;
import com.crm.utils.UtilConnect;

public class PlanDaoImpl implements PlanDao {

	@Override
	public int insertPlan(Plan plan) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st =null;
		String sql = "insert into plan (pla_chc_id,pla_date,pla_todo) values (?,?,?)";
		try{
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);
			st.setLong(1, plan.getPlaChcId());
			st.setString(2, plan.getPlaDate());
			st.setString(3, plan.getPlaTodo());
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
	public List<Plan> selectBychcid(Plan plan) {
		List<Plan> list = new ArrayList<Plan>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select pla_id,pla_chc_id,pla_date,pla_todo,pla_result from plan where pla_chc_id = ?";
		try{
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);
			st.setLong(1, plan.getPlaChcId());
			rs = st.executeQuery();
			while(rs.next()){
				Plan pla = new Plan();
				pla.setPlaId(rs.getLong(1));
				pla.setPlaChcId(rs.getLong(2));
				pla.setPlaDate(rs.getString(3));
				pla.setPlaTodo(rs.getString(4));
				pla.setPlaResult(rs.getString(5));
				list.add(pla);
			}
		}catch(SQLException e){
				e.printStackTrace();
			}finally{
				UtilConnect.close(rs);
				UtilConnect.close(st);
				UtilConnect.close(conn);
			}
		return list;
	}

	@Override
	public int updateByid(Plan plan) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "update plan set pla_todo = ? where pla_id = ?";
		try{
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);			
			st.setString(1, plan.getPlaTodo());
			st.setLong(2, plan.getPlaId());
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
	public int deleteByid(Long planid) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "delete from plan  where pla_id = ?";
		try{
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);
			st.setLong(1, planid);
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
	public int updateresultByid(String planresult, Long planid) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "update plan set pla_result = ? where pla_id = ?";
		try{
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);			
			st.setString(1, planresult);
			st.setLong(2, planid);
			row = st.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			UtilConnect.close(st);
			UtilConnect.close(conn);
		}
		return row;
	}

}
