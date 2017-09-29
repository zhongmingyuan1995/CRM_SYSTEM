package com.crm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.crm.dao.ServiceDao;
import com.crm.model.Customer;
import com.crm.model.Service;
import com.crm.utils.UtilConnect;

public class ServiceDaoImpl implements ServiceDao {

	@Override
	public int insertService(Service service) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st =null;
		String sql = "insert into service (svr_id,svr_type,svr_title,svr_cust_no,svr_status,svr_request,svr_create_id,svr_create_name,svr_create_date) values (?,?,?,?,'新创建',?,?,?,?)";
		try{
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);
			st.setLong(1, service.getSvrId());
			st.setString(2, service.getSvrType());
			st.setString(3, service.getSvrTitle());
			st.setString(4, service.getSvrCustNo());
			st.setString(5, service.getSvrRequest());
			st.setLong(6, service.getSvrCreateId());
			st.setString(7, service.getSvrCreateName());
			st.setString(8, service.getSvrCreateDate());
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
	public List<Service> queryLikeService(String where) {
		List<Service> list = new ArrayList<Service>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		//where 1=1; 这个条件始终为True，在不定数量查询条件情况下，1=1可以很方便的规范语句
		//如果查询条件都为false时查询所有
		String sql = "select svr_id,svr_type,svr_title,svr_cust_no,customer.cust_name,svr_status,svr_request,svr_create_id,svr_create_name,svr_create_date from "
				+ "(service inner join customer on customer.cust_no = service.svr_cust_no)  where 1=1"+ where;
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);			
			rs = st.executeQuery();
			// ResultSet是个集合，里面存的是数据库的表数据，以二维表的形式呈现，
			// rs.next也是一个游标，默认情况下游标是指的第一行数据之前，当第一次调用。next()的时候游标指的是第一行数据，再次调用，指的是下一行数据
			while (rs.next()) {	
				Service service = new Service();
				service.setSvrId(rs.getLong(1));
				service.setSvrType(rs.getString(2));
				service.setSvrTitle(rs.getString(3));
				Customer customer  = new Customer();
				customer.setCustNo(rs.getString(4));
				customer.setCustName(rs.getString(5));
				service.setCustomer(customer);
				service.setSvrStatus(rs.getString(6));
				service.setSvrRequest(rs.getString(7));
				service.setSvrCreateId(rs.getLong(8));
				service.setSvrCreateName(rs.getString(9));
				service.setSvrCreateDate(rs.getString(10));
				list.add(service);
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
	public int distributeService(Service service) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "update service set svr_due_id = ?,svr_due_name = ?,svr_due_date = ?,svr_status = '已分配' where svr_id = ?";
		try{
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);					
			st.setLong(1, service.getSvrDueId());
			st.setString(2, service.getSvrDueName());
			st.setString(3, service.getSvrDueDate());
			st.setLong(4, service.getSvrId());
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
	public int deleteService(Service service) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "delete from service where svr_id = ?";
		try{
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);					
			st.setLong(1, service.getSvrId());
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
	public List<Service> handleService(Long svrId) {
		List<Service> list = new ArrayList<Service>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		//where 1=1; 这个条件始终为True，在不定数量查询条件情况下，1=1可以很方便的规范语句
		//如果查询条件都为false时查询所有
		String sql = "select svr_id,svr_type,svr_title,svr_cust_no,customer.cust_name,svr_status,svr_request,svr_create_id,svr_create_name,svr_create_date,"
				+ "svr_due_id,svr_due_name,svr_due_date from "
				+ "(service inner join customer on customer.cust_no = service.svr_cust_no)  where svr_id = ?";
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);
			st.setLong(1, svrId);
			rs = st.executeQuery();
			// ResultSet是个集合，里面存的是数据库的表数据，以二维表的形式呈现，
			// rs.next也是一个游标，默认情况下游标是指的第一行数据之前，当第一次调用。next()的时候游标指的是第一行数据，再次调用，指的是下一行数据
			while (rs.next()) {	
				Service service = new Service();
				service.setSvrId(rs.getLong(1));
				service.setSvrType(rs.getString(2));
				service.setSvrTitle(rs.getString(3));
				Customer customer  = new Customer();
				customer.setCustNo(rs.getString(4));
				customer.setCustName(rs.getString(5));
				service.setCustomer(customer);
				service.setSvrStatus(rs.getString(6));
				service.setSvrRequest(rs.getString(7));
				service.setSvrCreateId(rs.getLong(8));
				service.setSvrCreateName(rs.getString(9));
				service.setSvrCreateDate(rs.getString(10));
				service.setSvrDueId(rs.getLong(11));
				service.setSvrDueName(rs.getString(12));
				service.setSvrDueDate(rs.getString(13));
				list.add(service);
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
	public int dealService(Service service) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "update service set svr_deal = ?,svr_deal_id = ?,svr_deal_name = ?,svr_deal_date = ?,svr_status = '已处理' where svr_id = ?";
		try{
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);
			st.setString(1, service.getSvrDeal());
			st.setLong(2, service.getSvrDealId());
			st.setString(3, service.getSvrDealName());
			st.setString(4, service.getSvrDealDate());
			st.setLong(5, service.getSvrId());
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
	public List<Service> feedbackService(Long svrId) {
		List<Service> list = new ArrayList<Service>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		//where 1=1; 这个条件始终为True，在不定数量查询条件情况下，1=1可以很方便的规范语句
		//如果查询条件都为false时查询所有
		String sql = "select svr_id,svr_type,svr_title,svr_cust_no,customer.cust_name,svr_status,svr_request,svr_create_id,svr_create_name,svr_create_date,"
				+ "svr_due_id,svr_due_name,svr_due_date,svr_deal,svr_deal_id,svr_deal_name,svr_deal_date from "
				+ "(service inner join customer on customer.cust_no = service.svr_cust_no)  where svr_id = ?";
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);
			st.setLong(1, svrId);
			rs = st.executeQuery();
			// ResultSet是个集合，里面存的是数据库的表数据，以二维表的形式呈现，
			// rs.next也是一个游标，默认情况下游标是指的第一行数据之前，当第一次调用。next()的时候游标指的是第一行数据，再次调用，指的是下一行数据
			while (rs.next()) {	
				Service service = new Service();
				service.setSvrId(rs.getLong(1));
				service.setSvrType(rs.getString(2));
				service.setSvrTitle(rs.getString(3));
				Customer customer  = new Customer();
				customer.setCustNo(rs.getString(4));
				customer.setCustName(rs.getString(5));
				service.setCustomer(customer);
				service.setSvrStatus(rs.getString(6));
				service.setSvrRequest(rs.getString(7));
				service.setSvrCreateId(rs.getLong(8));
				service.setSvrCreateName(rs.getString(9));
				service.setSvrCreateDate(rs.getString(10));
				service.setSvrDueId(rs.getLong(11));
				service.setSvrDueName(rs.getString(12));
				service.setSvrDueDate(rs.getString(13));
				service.setSvrDeal(rs.getString(14));
				service.setSvrDealId(rs.getLong(15));
				service.setSvrDealName(rs.getString(16));
				service.setSvrDealDate(rs.getString(17));
				list.add(service);
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
	public int savesvrResult(Service service) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "update service set svr_result = ?,svr_satisfy = ?,svr_status = '已归档' where svr_id = ?";
		try{
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);
			st.setString(1, service.getSvrResult());
			st.setInt(2, service.getSvrSatisfy());
			st.setLong(3, service.getSvrId());
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
	public int savesvrResult2(Service service) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "update service set svr_result = ?,svr_satisfy = ?,svr_status = '已分配' where svr_id = ?";
		try{
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);
			st.setString(1, service.getSvrResult());
			st.setInt(2, service.getSvrSatisfy());
			st.setLong(3, service.getSvrId());
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
	public List<Service> fileService(Long svrId) {
		List<Service> list = new ArrayList<Service>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		//where 1=1; 这个条件始终为True，在不定数量查询条件情况下，1=1可以很方便的规范语句
		//如果查询条件都为false时查询所有
		String sql = "select svr_id,svr_type,svr_title,svr_cust_no,customer.cust_name,svr_status,svr_request,svr_create_id,svr_create_name,svr_create_date,"
				+ "svr_due_id,svr_due_name,svr_due_date,svr_deal,svr_deal_id,svr_deal_name,svr_deal_date,svr_result,svr_satisfy from "
				+ "(service inner join customer on customer.cust_no = service.svr_cust_no)  where svr_id = ?";
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);
			st.setLong(1, svrId);
			rs = st.executeQuery();
			// ResultSet是个集合，里面存的是数据库的表数据，以二维表的形式呈现，
			// rs.next也是一个游标，默认情况下游标是指的第一行数据之前，当第一次调用。next()的时候游标指的是第一行数据，再次调用，指的是下一行数据
			while (rs.next()) {	
				Service service = new Service();
				service.setSvrId(rs.getLong(1));
				service.setSvrType(rs.getString(2));
				service.setSvrTitle(rs.getString(3));
				Customer customer  = new Customer();
				customer.setCustNo(rs.getString(4));
				customer.setCustName(rs.getString(5));
				service.setCustomer(customer);
				service.setSvrStatus(rs.getString(6));
				service.setSvrRequest(rs.getString(7));
				service.setSvrCreateId(rs.getLong(8));
				service.setSvrCreateName(rs.getString(9));
				service.setSvrCreateDate(rs.getString(10));
				service.setSvrDueId(rs.getLong(11));
				service.setSvrDueName(rs.getString(12));
				service.setSvrDueDate(rs.getString(13));
				service.setSvrDeal(rs.getString(14));
				service.setSvrDealId(rs.getLong(15));
				service.setSvrDealName(rs.getString(16));
				service.setSvrDealDate(rs.getString(17));
				service.setSvrResult(rs.getString(18));
				service.setSvrSatisfy(rs.getInt(19));
				list.add(service);
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
	public int getServiceCount(String where) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select  COUNT(*) from (service inner join customer on customer.cust_no = service.svr_cust_no) where 1=1" + where;
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
