package com.crm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.crm.dao.BasdictDao;
import com.crm.dao.CustomerDao;
import com.crm.dao.ServiceDao;
import com.crm.dao.UserDao;
import com.crm.dao.impl.BasdictDaoImpl;
import com.crm.dao.impl.CustomerDaoImpl;
import com.crm.dao.impl.ServiceDaoImpl;
import com.crm.dao.impl.UserDaoImpl;
import com.crm.model.Basdict;
import com.crm.model.Customer;
import com.crm.model.Salchance;
import com.crm.model.Service;
import com.crm.model.User;
import com.crm.utils.Page;

public class ServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String servletPath = request.getServletPath();
		String methodName = servletPath.substring(1,servletPath.length()-3);
		try{
			Method method = getClass().getDeclaredMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);
			method.invoke(this,request,response);
		}catch(Exception e){
			System.out.print("ServiceServlet这里出错了！");
		}
	}
	
	protected void createService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(); 
		String username = (String) session.getAttribute("username");
		//System.out.println(username);
		UserDao userDao = new UserDaoImpl();
		List<User>  user = userDao.getUserId(username);
		request.setAttribute("UserId", user.get(0).getUserId());
		
		CustomerDao customerDao = new CustomerDaoImpl();	
		List<Customer> list2 = customerDao.queryCusName();
		request.setAttribute("Customer", list2);
		
		BasdictDao basdictDao = new BasdictDaoImpl();
		List<Basdict> Basdict = basdictDao.queryBasdict();
		request.setAttribute("Basdict", Basdict);
		request.getRequestDispatcher("service_create.jsp").forward(request, response);
	}
	
	protected void insertService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(); 
		Long svrId = Long.parseLong(request.getParameter("svrId"));
		String svrType = request.getParameter("svrType");
		String svrTitle = request.getParameter("svrTitle");
		String svrCustNo = request.getParameter("svrCustNo");
		String svrRequest = request.getParameter("svrRequest");
		Long svrCreateId = Long.parseLong(request.getParameter("svrCreateId"));
		String svrCreateName = (String) session.getAttribute("username");
		String svrCreateDate = request.getParameter("svrCreateDate");
		Service service = new Service(svrId,svrType,svrTitle,svrCustNo,svrRequest,svrCreateId,svrCreateName,svrCreateDate);
		ServiceDao serviceDao = new ServiceDaoImpl();
		int  row = serviceDao.insertService(service);
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
	
	protected void queryLikeService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String svrType = request.getParameter("svrType");
		String svrTitle = request.getParameter("svrTitle");
		String custName = request.getParameter("custName");
		String svrCreateDate = request.getParameter("svrCreateDate");
		String svrendCreateDate = request.getParameter("svrendCreateDate");
		String svrStatus = request.getParameter("svrStatus");
		String flag = request.getParameter("flag");
		ServiceDao serviceDao = new ServiceDaoImpl();
		String pageNow = request.getParameter("pageNow");
		Page page = new Page();
		//System.out.println(svrStatus);
		String sql = "";
		if(custName!=null && !"".equals(custName)){
			sql = sql+" and customer.cust_name like '%"+custName+"%' "; 
		}
		if(svrTitle!=null && !"".equals(svrTitle)){
			sql = sql+" and svr_title like '%"+svrTitle+"%' "; 
		}
		if(svrType!=null && !"".equals(svrType)){
			sql = sql+" and svr_type = '"+svrType+"' "; 
		}
		if(svrCreateDate!=null && !"".equals(svrCreateDate)){
			sql = sql+" and svr_create_date between '"+svrCreateDate+"' and '"+svrendCreateDate+"'"; 
		}
		if(svrStatus!=null && !"".equals(svrStatus)){
			sql = sql+" and svr_status = '"+svrStatus+"' "; 
		}
		int totalCount = (int) serviceDao.getServiceCount(sql);
		if (pageNow != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));
			int startPos = page.getStartPos();
			int pageSize = page.getPageSize();
			sql = sql+" "+"limit"+" "+startPos+","+" "+pageSize+""; 
			List<Service> list = serviceDao.queryLikeService(sql);
			request.setAttribute("Service", list);
			request.setAttribute("page", page);
		} else {
			page = new Page(totalCount, 1);
			int startPos = page.getStartPos();
			int pageSize = page.getPageSize();
			sql = sql+" "+"limit"+" "+startPos+","+" "+pageSize+"";
			List<Service> list = serviceDao.queryLikeService(sql);
			request.setAttribute("Service", list);
			request.setAttribute("page", page);
		}		
		
		UserDao userDao = new UserDaoImpl();
		List<User> user = userDao.queryUserFlag();
		request.setAttribute("User", user);
		
		BasdictDao basdictDao = new BasdictDaoImpl();
		List<Basdict> Basdict = basdictDao.queryBasdict();
		request.setAttribute("Basdict", Basdict);
		if(flag.equals("distribute")){
			request.getRequestDispatcher("service_distribute.jsp").forward(request, response);
		}else if(flag.equals("handle")){
			request.getRequestDispatcher("service_handle.jsp").forward(request, response);
		}else if(flag.equals("feedback")){
			request.getRequestDispatcher("service_feedback.jsp").forward(request, response);
		}else if(flag.equals("file")){
			request.getRequestDispatcher("service_file.jsp").forward(request, response);
		}
	}
	
	protected void distributeService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Long svrId = Long.parseLong(request.getParameter("svrId"));
		Long svrDueId = Long.parseLong(request.getParameter("svrDueId"));
		String svrDueName = request.getParameter("svrDueName");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String svrDueDate = sdf.format(date);
	    //System.out.println(svrDueId);
		Service service = new Service(svrDueId,svrDueName,svrDueDate,svrId);
		ServiceDao serviceDao = new ServiceDaoImpl();
		int  row = serviceDao.distributeService(service);
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
	
	protected void deleteService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Long svrId = Long.parseLong(request.getParameter("svrId"));
	    //System.out.println(svrId);
		Service service = new Service(svrId);
		ServiceDao serviceDao = new ServiceDaoImpl();
		int  row = serviceDao.deleteService(service);
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
	
	protected void handleService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");	
		Long svrId = Long.parseLong(request.getParameter("svrId"));
		Service service = new Service(svrId);
		ServiceDao serviceDao = new ServiceDaoImpl();
		List<Service> list = serviceDao.handleService(svrId);
		request.setAttribute("Service", list);
		
		HttpSession session = request.getSession(); 
		String username = (String) session.getAttribute("username");
		//System.out.println(username);
		UserDao userDao = new UserDaoImpl();
		List<User>  user = userDao.getUserId(username);
		request.setAttribute("UserId", user.get(0).getUserId());
		request.getRequestDispatcher("service_handle_method.jsp").forward(request, response);
	}
	
	protected void dealService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Long svrId = Long.parseLong(request.getParameter("svrId"));
		HttpSession session = request.getSession(); 
		String svrDealName = (String) session.getAttribute("username");
		Long svrDealId = Long.parseLong(request.getParameter("svrDealId"));
		String svrDealDate = request.getParameter("svrDealDate");
		String svrDeal = request.getParameter("svrDeal");
	    //System.out.println(svrId);
	    //System.out.println(svrDeal);
		Service service = new Service(svrDeal,svrDealId,svrDealName,svrDealDate,svrId);
		ServiceDao serviceDao = new ServiceDaoImpl();
		int  row = serviceDao.dealService(service);
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
	
	protected void feedbackService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");	
		Long svrId = Long.parseLong(request.getParameter("svrId"));
		ServiceDao serviceDao = new ServiceDaoImpl();
		List<Service> list = serviceDao.feedbackService(svrId);
		request.setAttribute("Service", list);
		request.getRequestDispatcher("service_feedback_result.jsp").forward(request, response);
	}
	
	protected void savesvrResult(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Long svrId = Long.parseLong(request.getParameter("svrId"));
		String svrResult = request.getParameter("svrResult");
		Integer svrSatisfy = Integer.parseInt(request.getParameter("svrSatisfy"));
	    //System.out.println(svrId);
	    //System.out.println(svrSatisfy);
		Service service = new Service(svrResult,svrSatisfy,svrId);
		ServiceDao serviceDao = new ServiceDaoImpl();
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=utf-8");//文本信息
		response.setCharacterEncoding("utf-8");//输入的帐号和密码作为参数去数据库查询
		if(svrSatisfy>=3){
			int  row = serviceDao.savesvrResult(service);
			if(row>0){
				out.write("1");
			}else{
				out.write("2");
			 }
			 out.flush();
			 out.close(); 
		}else{
			int  row = serviceDao.savesvrResult2(service);
			if(row>0){
				out.write("1");
			}else{
				out.write("2");
			 }
			 out.flush();
			 out.close(); 
		}
	}
	
	protected void fileService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");	
		Long svrId = Long.parseLong(request.getParameter("svrId"));
		ServiceDao serviceDao = new ServiceDaoImpl();
		List<Service> list = serviceDao.fileService(svrId);
		request.setAttribute("Service", list);
		request.getRequestDispatcher("service_file_result.jsp").forward(request, response);
	}

}
