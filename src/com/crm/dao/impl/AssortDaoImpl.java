package com.crm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.crm.dao.AssortDao;
import com.crm.model.Assort;
import com.crm.utils.UtilConnect;

public class AssortDaoImpl implements AssortDao {

	@Override
	public int deleteAssort(Long atvId) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "delete from assort  where atv_id = ?";
		try{
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);
			st.setLong(1, atvId);
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
	public int insertAssort(Assort assort) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st =null;
		String sql = "insert into assort (atv_cust_no,atv_date,atv_place,atv_title,atv_desc) values (?,?,?,?,?)";
		try{
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);
			st.setString(1, assort.getAtvCustNo());
			st.setString(2, assort.getAtvDate());
			st.setString(3, assort.getAtvPlace());
			st.setString(4, assort.getAtvTitle());
			st.setString(5, assort.getAtvDesc());
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
	public List<Assort> selectAssort(String custNo,String where) {
		List<Assort> list = new ArrayList<Assort>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		//where 1=1; �������ʼ��ΪTrue���ڲ���������ѯ��������£�1=1���Ժܷ���Ĺ淶���
		//�����ѯ������Ϊfalseʱ��ѯ����
		String sql = "select atv_Id,atv_cust_no,atv_date,atv_place,atv_title,atv_desc from assort  where atv_cust_no = ?"+where;
		try {
			conn = UtilConnect.getConn();
			// ����ִ��SQL���
			st = conn.prepareStatement(sql);	
			st.setString(1, custNo);
			rs = st.executeQuery();
			// ResultSet�Ǹ����ϣ������������ݿ�ı����ݣ��Զ�ά�����ʽ���֣�
			// rs.nextҲ��һ���α꣬Ĭ��������α���ָ�ĵ�һ������֮ǰ������һ�ε��á�next()��ʱ���α�ָ���ǵ�һ�����ݣ��ٴε��ã�ָ������һ������
			while (rs.next()) {	
				Assort assort = new Assort();
				assort.setAtvId(rs.getLong(1));
				assort.setAtvCustNo(rs.getString(2));
				assort.setAtvDate(rs.getString(3));
				assort.setAtvPlace(rs.getString(4));
				assort.setAtvTitle(rs.getString(5));
				assort.setAtvDesc(rs.getString(6));
				list.add(assort);
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
	public int updateAssort(Assort assort) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "update assort set atv_date = ?,atv_place = ?,atv_title = ?,atv_desc = ? where atv_Id = ?";
		try{
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);					
			st.setString(1, assort.getAtvDate());
			st.setString(2, assort.getAtvPlace());
			st.setString(3, assort.getAtvTitle());
			st.setString(4, assort.getAtvDesc());
			st.setLong(5, assort.getAtvId());
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
	public List<Assort> selectAssortByatvId(Long atvId) {
		List<Assort> list = new ArrayList<Assort>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		//where 1=1; �������ʼ��ΪTrue���ڲ���������ѯ��������£�1=1���Ժܷ���Ĺ淶���
		//�����ѯ������Ϊfalseʱ��ѯ����
		String sql = "select atv_Id,atv_cust_no,atv_date,atv_place,atv_title,atv_desc from assort  where atv_Id = ?";
		try {
			conn = UtilConnect.getConn();
			// ����ִ��SQL���
			st = conn.prepareStatement(sql);	
			st.setLong(1, atvId);
			rs = st.executeQuery();
			// ResultSet�Ǹ����ϣ������������ݿ�ı����ݣ��Զ�ά�����ʽ���֣�
			// rs.nextҲ��һ���α꣬Ĭ��������α���ָ�ĵ�һ������֮ǰ������һ�ε��á�next()��ʱ���α�ָ���ǵ�һ�����ݣ��ٴε��ã�ָ������һ������
			while (rs.next()) {	
				Assort assort = new Assort();
				assort.setAtvId(rs.getLong(1));
				assort.setAtvCustNo(rs.getString(2));
				assort.setAtvDate(rs.getString(3));
				assort.setAtvPlace(rs.getString(4));
				assort.setAtvTitle(rs.getString(5));
				assort.setAtvDesc(rs.getString(6));
				list.add(assort);
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
	public int getAssortCount(String custNo) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select  COUNT(*) from assort where atv_cust_no = ?";
		try {
			conn = UtilConnect.getConn();
			// ����ִ��SQL���
			st = conn.prepareStatement(sql);
			st.setString(1, custNo);
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
