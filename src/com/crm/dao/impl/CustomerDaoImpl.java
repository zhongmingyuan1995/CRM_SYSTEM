package com.crm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.crm.dao.CustomerDao;
import com.crm.model.Customer;
import com.crm.utils.UtilConnect;

public class CustomerDaoImpl implements CustomerDao {

	@Override
	public int insertCustomer(Customer customer) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "insert into customer (cust_no,cust_name,cust_region,cust_manager_id,cust_manager_name,cust_level,cust_level_label,"
				+ "cust_satisfy,cust_credit,cust_addr,cust_zip,cust_tel,cust_fax,cust_website,cust_licence_no,cust_chieftain,cust_bankroll,"
				+ "cust_turnover,cust_bank,cust_bank_account,cust_local_tax_no,cust_national_tax_no) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);
			st.setString(1, customer.getCustNo());
			st.setString(2, customer.getCustName());
			st.setString(3, customer.getCustRegion());
			st.setLong(4, customer.getCustManagerId());
			st.setString(5, customer.getCustManagerName());
			st.setInt(6, customer.getCustLevel());
			st.setString(7, customer.getCustLevelLabel());
			st.setInt(8, customer.getCustSatisfy());
			st.setInt(9, customer.getCustCredit());
			st.setString(10, customer.getCustAddr());
			st.setString(11, customer.getCustZip());
			st.setString(12, customer.getCustTel());
			st.setString(13, customer.getCustFax());
			st.setString(14, customer.getCustWebsite());
			st.setString(15, customer.getCustLicenceNo());
			st.setString(16, customer.getCustChieftain());
			st.setLong(17, customer.getCustBankroll());
			st.setLong(18, customer.getCustTurnover());
			st.setString(19, customer.getCustBank());
			st.setString(20, customer.getCustBankAccount());
			st.setString(21, customer.getCustLocalTaxNo());
			st.setString(22, customer.getCustNationalTaxNo());
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
	public List<Customer> queryLike(String where) {
		List<Customer> list = new ArrayList<Customer>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		//where 1=1; 这个条件始终为True，在不定数量查询条件情况下，1=1可以很方便的规范语句
		//如果查询条件都为false时查询所有
		String sql = "select * from customer  where 1=1"+ where;
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);			
			rs = st.executeQuery();
			// ResultSet是个集合，里面存的是数据库的表数据，以二维表的形式呈现，
			// rs.next也是一个游标，默认情况下游标是指的第一行数据之前，当第一次调用。next()的时候游标指的是第一行数据，再次调用，指的是下一行数据
			while (rs.next()) {	
				Customer customer = new Customer();
				customer.setCustNo(rs.getString(1));
				customer.setCustName(rs.getString(2));
				customer.setCustRegion(rs.getString(3));
				customer.setCustManagerId(rs.getLong(4));
				customer.setCustManagerName(rs.getString(5));
				customer.setCustLevel(rs.getInt(6));
				customer.setCustLevelLabel(rs.getString(7));
				customer.setCustSatisfy(rs.getInt(8));
				customer.setCustCredit(rs.getInt(9));
				customer.setCustAddr(rs.getString(10));
				customer.setCustZip(rs.getString(11));
				customer.setCustTel(rs.getString(12));
				customer.setCustFax(rs.getString(13));
				customer.setCustWebsite(rs.getString(14));
				customer.setCustLicenceNo(rs.getString(15));
				customer.setCustChieftain(rs.getString(16));			
				customer.setCustBankroll(rs.getLong(17));
				customer.setCustTurnover(rs.getLong(18));
				customer.setCustBank(rs.getString(19));
				customer.setCustBankAccount(rs.getString(20));
				customer.setCustLocalTaxNo(rs.getString(21));
				customer.setCustNationalTaxNo(rs.getString(22));
				customer.setCustStatus(rs.getString(23));
				list.add(customer);
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
	public List<Customer> queryBycustId(String custNo) {
		List<Customer> list = new ArrayList<Customer>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		//where 1=1; 这个条件始终为True，在不定数量查询条件情况下，1=1可以很方便的规范语句
		//如果查询条件都为false时查询所有
		String sql = "select * from customer  where cust_no = ?";
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);
			st.setString(1, custNo);
			rs = st.executeQuery();
			// ResultSet是个集合，里面存的是数据库的表数据，以二维表的形式呈现，
			// rs.next也是一个游标，默认情况下游标是指的第一行数据之前，当第一次调用。next()的时候游标指的是第一行数据，再次调用，指的是下一行数据
			while (rs.next()) {	
				Customer customer = new Customer();
				customer.setCustNo(rs.getString(1));
				customer.setCustName(rs.getString(2));
				customer.setCustRegion(rs.getString(3));
				customer.setCustManagerId(rs.getLong(4));
				customer.setCustManagerName(rs.getString(5));
				customer.setCustLevel(rs.getInt(6));
				customer.setCustLevelLabel(rs.getString(7));
				customer.setCustSatisfy(rs.getInt(8));
				customer.setCustCredit(rs.getInt(9));
				customer.setCustAddr(rs.getString(10));
				customer.setCustZip(rs.getString(11));
				customer.setCustTel(rs.getString(12));
				customer.setCustFax(rs.getString(13));
				customer.setCustWebsite(rs.getString(14));
				customer.setCustLicenceNo(rs.getString(15));
				customer.setCustChieftain(rs.getString(16));			
				customer.setCustBankroll(rs.getLong(17));
				customer.setCustTurnover(rs.getLong(18));
				customer.setCustBank(rs.getString(19));
				customer.setCustBankAccount(rs.getString(20));
				customer.setCustLocalTaxNo(rs.getString(21));
				customer.setCustNationalTaxNo(rs.getString(22));
				customer.setCustStatus(rs.getString(23));
				list.add(customer);
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
	public int updateBycustId(Customer customer) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "update  customer set cust_name = ?,cust_region = ?,cust_manager_id = ?,cust_manager_name = ?,cust_level = ?,cust_level_label = ?,"
				+ "cust_satisfy = ?,cust_credit = ?,cust_addr = ?,cust_zip = ?,cust_tel = ?,cust_fax = ?,cust_website = ?,cust_licence_no = ?,cust_chieftain = ?,cust_bankroll = ?,"
				+ "cust_turnover = ?,cust_bank = ?,cust_bank_account = ?,cust_local_tax_no = ?,cust_national_tax_no = ? where cust_no = ?";
		try {
			conn = UtilConnect.getConn();
			st = conn.prepareStatement(sql);	
			st.setString(1, customer.getCustName());
			st.setString(2, customer.getCustRegion());
			st.setLong(3, customer.getCustManagerId());
			st.setString(4, customer.getCustManagerName());
			st.setInt(5, customer.getCustLevel());
			st.setString(6, customer.getCustLevelLabel());
			st.setInt(7, customer.getCustSatisfy());
			st.setInt(8, customer.getCustCredit());
			st.setString(9, customer.getCustAddr());
			st.setString(10, customer.getCustZip());
			st.setString(11, customer.getCustTel());
			st.setString(12, customer.getCustFax());
			st.setString(13, customer.getCustWebsite());
			st.setString(14, customer.getCustLicenceNo());
			st.setString(15, customer.getCustChieftain());
			st.setLong(16, customer.getCustBankroll());
			st.setLong(17, customer.getCustTurnover());
			st.setString(18, customer.getCustBank());
			st.setString(19, customer.getCustBankAccount());
			st.setString(20, customer.getCustLocalTaxNo());
			st.setString(21, customer.getCustNationalTaxNo());
			st.setString(22, customer.getCustNo());
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
	public List<Customer> queryCusName() {
		List<Customer> list = new ArrayList<Customer>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		//where 1=1; 这个条件始终为True，在不定数量查询条件情况下，1=1可以很方便的规范语句
		//如果查询条件都为false时查询所有
		String sql = "select cust_no,cust_name from customer";
		try {
			conn = UtilConnect.getConn();
			// 负责执行SQL语句
			st = conn.prepareStatement(sql);			
			rs = st.executeQuery();
			// ResultSet是个集合，里面存的是数据库的表数据，以二维表的形式呈现，
			// rs.next也是一个游标，默认情况下游标是指的第一行数据之前，当第一次调用。next()的时候游标指的是第一行数据，再次调用，指的是下一行数据
			while (rs.next()) {	
				Customer customer = new Customer();
				customer.setCustNo(rs.getString(1));
				customer.setCustName(rs.getString(2));
				list.add(customer);
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
	public int getCustomerCount(String where) {
		int row = 0;
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select  COUNT(*) from customer where 1=1" + where;
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
