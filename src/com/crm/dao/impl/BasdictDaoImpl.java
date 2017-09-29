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
		//where 1=1; �������ʼ��ΪTrue���ڲ���������ѯ��������£�1=1���Ժܷ���Ĺ淶���
		//�����ѯ������Ϊfalseʱ��ѯ����
		String sql = "select * from bas_dict  where  dict_is_editable = 1";
		try {
			conn = UtilConnect.getConn();
			// ����ִ��SQL���
			st = conn.prepareStatement(sql);			
			rs = st.executeQuery();
			// ResultSet�Ǹ����ϣ������������ݿ�ı����ݣ��Զ�ά�����ʽ���֣�
			// rs.nextҲ��һ���α꣬Ĭ��������α���ָ�ĵ�һ������֮ǰ������һ�ε��á�next()��ʱ���α�ָ���ǵ�һ�����ݣ��ٴε��ã�ָ������һ������
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
		//where 1=1; �������ʼ��ΪTrue���ڲ���������ѯ��������£�1=1���Ժܷ���Ĺ淶���
		//�����ѯ������Ϊfalseʱ��ѯ����
		String sql = "select * from bas_dict where 1=1"+where;
		try {
			conn = UtilConnect.getConn();
			// ����ִ��SQL���
			st = conn.prepareStatement(sql);			
			rs = st.executeQuery();
			// ResultSet�Ǹ����ϣ������������ݿ�ı����ݣ��Զ�ά�����ʽ���֣�
			// rs.nextҲ��һ���α꣬Ĭ��������α���ָ�ĵ�һ������֮ǰ������һ�ε��á�next()��ʱ���α�ָ���ǵ�һ�����ݣ��ٴε��ã�ָ������һ������
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
			// ����ִ��SQL���
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
