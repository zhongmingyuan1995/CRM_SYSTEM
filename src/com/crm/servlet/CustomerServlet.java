package com.crm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crm.dao.BasdictDao;
import com.crm.dao.CustomerDao;
import com.crm.dao.UserDao;
import com.crm.dao.impl.BasdictDaoImpl;
import com.crm.dao.impl.CustomerDaoImpl;
import com.crm.dao.impl.UserDaoImpl;
import com.crm.model.Basdict;
import com.crm.model.Customer;
import com.crm.model.Salchance;
import com.crm.model.User;
import com.crm.utils.Page;


public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public CustomerServlet() {
        super();     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String servletPath = request.getServletPath();
		String methodName = servletPath.substring(1,servletPath.length()-3);
		try{
			Method method = getClass().getDeclaredMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);
			method.invoke(this,request,response);
		}catch(Exception e){
			System.out.print("CutomerServlet这里出错了！");
		}
	}
	
	protected void querycustomerLike(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		CustomerDao customerDao = new CustomerDaoImpl();
		String custno = request.getParameter("custno");
		String custname = request.getParameter("custname");
		String custregion = request.getParameter("custregion");
		//System.out.println(custno);测试通过
		String sql = "";
		String pageNow = request.getParameter("pageNow");
		Page page = new Page();
		if(custno!=null && !"".equals(custno)){
			sql = sql+" and cust_no like '%"+custno+"%' "; 
		}
		if(custname!=null && !"".equals(custname)){
			sql = sql+" and cust_name like '%"+custname+"%' "; 
		}
		if(custregion!=null && !"".equals(custregion)){
			sql = sql+" and cust_region like '%"+custregion+"%' "; 
		}
		int totalCount = (int) customerDao.getCustomerCount(sql);
		if (pageNow != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));
			int startPos = page.getStartPos();
			int pageSize = page.getPageSize();
			sql = sql+" "+"limit"+" "+startPos+","+" "+pageSize+""; 
			List<Customer> list = customerDao.queryLike(sql);
			request.setAttribute("Customer", list);		
			request.setAttribute("page", page);
		} else {
			page = new Page(totalCount, 1);
			int startPos = page.getStartPos();
			int pageSize = page.getPageSize();
			sql = sql+" "+"limit"+" "+startPos+","+" "+pageSize+"";
			List<Customer> list = customerDao.queryLike(sql);
			request.setAttribute("Customer", list);		
			request.setAttribute("page", page);
		}		
		
		BasdictDao basdictDao = new BasdictDaoImpl();
		List<Basdict> Basdict = basdictDao.queryBasdict();
		request.setAttribute("Basdict", Basdict);
		request.getRequestDispatcher("customer_index.jsp").forward(request, response);
	}
	
	protected void queryBasdict(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BasdictDao basdictDao = new BasdictDaoImpl();
		List<Basdict> list = basdictDao.queryBasdict();
		request.setAttribute("Basdict", list);
		
		UserDao userdao = new UserDaoImpl();
		List<User> user = userdao.queryUserFlag();
		request.setAttribute("User", user);
		request.getRequestDispatcher("customer_create.jsp").forward(request, response);
	}
	
	protected void insertcustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		CustomerDao customerDao = new CustomerDaoImpl();
		String custNo = request.getParameter("custNo");
		String custName = request.getParameter("custName");
		String custRegion = request.getParameter("custRegion");
		Long custManagerId = Long.parseLong(request.getParameter("custManagerId"));
		String custManagerName = request.getParameter("custManagerName");
		Integer custLevel = Integer.parseInt(request.getParameter("custLevel"));
		String custLevelLabel = request.getParameter("custLevelLabel");
		Integer custSatisfy = Integer.parseInt(request.getParameter("custSatisfy"));
		Integer custCredit = Integer.parseInt(request.getParameter("custCredit"));
		String custAddr = request.getParameter("custAddr");
		String custZip = request.getParameter("custZip");
		String custTel = request.getParameter("custTel");
		String custFax = request.getParameter("custFax");
		String custWebsite = request.getParameter("custWebsite");
		String custLicenceNo = request.getParameter("custLicenceNo");
		String custChieftain = request.getParameter("custChieftain");
		Long custBankroll = Long.parseLong(request.getParameter("custBankroll"));
		Long custTurnover = Long.parseLong(request.getParameter("custTurnover"));
		String custBank = request.getParameter("custBank");
		String custBankAccount = request.getParameter("custBankAccount");
		String custLocalTaxNo = request.getParameter("custLocalTaxNo");
		String custNationalTaxNo = request.getParameter("custNationalTaxNo");
		//System.out.println(custNo);测试通过
		Customer customer = new Customer(custNo,custName,custRegion,custManagerId,custManagerName,
				custLevel, custLevelLabel, custSatisfy,custCredit, custAddr,custZip, custTel, custFax,
				custWebsite, custLicenceNo,custChieftain,custBankroll, custTurnover, custBank, custBankAccount,
				custLocalTaxNo, custNationalTaxNo);
		int row = customerDao.insertCustomer(customer);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=utf-8");//文本信息
		response.setCharacterEncoding("utf-8");//输入的帐号和密码作为参数去数据库查询
		//System.out.println(row);测试通过
		if(row>0){
			out.write("1");
		}else{
			out.write("2");
		 }
		 out.flush();
		 out.close(); 
	}
	
	protected void editcustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BasdictDao basdictDao = new BasdictDaoImpl();
		List<Basdict> Basdict = basdictDao.queryBasdict();
		request.setAttribute("Basdict", Basdict);
		
		UserDao userdao = new UserDaoImpl();
		List<User> user = userdao.queryUserFlag();
		request.setAttribute("User", user);
		
		CustomerDao customerDao = new CustomerDaoImpl();
		String custNo = request.getParameter("custNo");
		//System.out.println(custNo);
		List<Customer> list = customerDao.queryBycustId(custNo);
		request.setAttribute("Customer", list);		
		request.getRequestDispatcher("customer_edit.jsp").forward(request, response);
	}
	
	protected void updatecustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		CustomerDao customerDao = new CustomerDaoImpl();
		String custNo = request.getParameter("custNo");
		String custName = request.getParameter("custName");
		String custRegion = request.getParameter("custRegion");
		Long custManagerId = Long.parseLong(request.getParameter("custManagerId"));
		String custManagerName = request.getParameter("custManagerName");
		Integer custLevel = Integer.parseInt(request.getParameter("custLevel"));
		String custLevelLabel = request.getParameter("custLevelLabel");
		Integer custSatisfy = Integer.parseInt(request.getParameter("custSatisfy"));
		Integer custCredit = Integer.parseInt(request.getParameter("custCredit"));
		String custAddr = request.getParameter("custAddr");
		String custZip = request.getParameter("custZip");
		String custTel = request.getParameter("custTel");
		String custFax = request.getParameter("custFax");
		String custWebsite = request.getParameter("custWebsite");
		String custLicenceNo = request.getParameter("custLicenceNo");
		String custChieftain = request.getParameter("custChieftain");
		Long custBankroll = Long.parseLong(request.getParameter("custBankroll"));
		Long custTurnover = Long.parseLong(request.getParameter("custTurnover"));
		String custBank = request.getParameter("custBank");
		String custBankAccount = request.getParameter("custBankAccount");
		String custLocalTaxNo = request.getParameter("custLocalTaxNo");
		String custNationalTaxNo = request.getParameter("custNationalTaxNo");
		//System.out.println(custNo);测试通过
		Customer customer = new Customer(custName,custRegion,custManagerId,custManagerName,
				custLevel, custLevelLabel, custSatisfy,custCredit, custAddr,custZip, custTel, custFax,
				custWebsite, custLicenceNo,custChieftain,custBankroll, custTurnover, custBank, custBankAccount,
				custLocalTaxNo, custNationalTaxNo,custNo);
		int row = customerDao.updateBycustId(customer);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=utf-8");//文本信息
		response.setCharacterEncoding("utf-8");//输入的帐号和密码作为参数去数据库查询
		//System.out.println(row);
		if(row>0){
			out.write("1");
		}else{
			out.write("2");
		 }
		 out.flush();
		 out.close(); 
	}

}
