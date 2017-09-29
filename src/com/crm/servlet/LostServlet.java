package com.crm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crm.dao.LostDao;
import com.crm.dao.impl.LostDaoImpl;
import com.crm.model.Lost;
import com.crm.utils.Page;

public class LostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String servletPath = request.getServletPath();
		String methodName = servletPath.substring(1,servletPath.length()-3);
		try{
			Method method = getClass().getDeclaredMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);
			method.invoke(this, request,response);
		}catch(Exception e){
			System.out.println("LostServlet这里出问题了");
		}
	}
	
	protected void queryLost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		LostDao lostDao = new LostDaoImpl();
		String custName = request.getParameter("custName");
		String custManagerName = request.getParameter("custManagerName");
		String lstStatus = request.getParameter("lstStatus");
		String pageNow = request.getParameter("pageNow");
		String sql = "";
		Page page = new Page();
		if(custName!=null && !"".equals(custName)){
			sql = sql+" and cust_name like '%"+custName+"%' "; 
		}
		if(custManagerName!=null && !"".equals(custManagerName)){
			sql = sql+" and cust_manager_name like '%"+custManagerName+"%' "; 
		}
		if(lstStatus!=null && !"".equals(lstStatus)){
			sql = sql+" and lst_status like '%"+lstStatus+"%' "; 
		}
		int totalCount = (int) lostDao.getLostCount(sql);
		if (pageNow != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));
			int startPos = page.getStartPos();
			int pageSize = page.getPageSize();
			sql = sql+" "+"limit"+" "+startPos+","+" "+pageSize+""; 
			List<Lost> list = lostDao.selectByCustno(sql);
			request.setAttribute("Lost", list);
			request.setAttribute("page", page);
		} else {
			page = new Page(totalCount, 1);
			int startPos = page.getStartPos();
			int pageSize = page.getPageSize();
			sql = sql+" "+"limit"+" "+startPos+","+" "+pageSize+"";
			List<Lost> list = lostDao.selectByCustno(sql);
			request.setAttribute("Lost", list);
			request.setAttribute("page", page);
		}		
		request.getRequestDispatcher("customer_loss.jsp").forward(request, response);
	}
	
	
	protected void queryLostBylstId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Long lstId = Long.parseLong(request.getParameter("lstId"));
		String flag = request.getParameter("flag");
		LostDao lostDao = new LostDaoImpl();
		List<Lost> list = lostDao.selectByid(lstId);
		request.setAttribute("Lost", list);
		if(flag.equals("reprie")){
			request.getRequestDispatcher("customer_loss_reprieve.jsp").forward(request, response);
		}else if(flag.equals("confirm")){
			request.getRequestDispatcher("customer_loss_confirm.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("customer_loss_info.jsp").forward(request, response);
		}
		
	}
	
	protected void updatereprie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Long lstId = Long.parseLong(request.getParameter("lstId"));
		String lstDelay = request.getParameter("lstDelay");
		LostDao lostDao = new LostDaoImpl();
		Lost lost = new Lost(lstDelay,lstId);
		int row = lostDao.updatereprie(lost);
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
	protected void updateconfig(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Long lstId = Long.parseLong(request.getParameter("lstId"));
		String lstReason = request.getParameter("lstReason");
		LostDao lostDao = new LostDaoImpl();
		Lost lost = new Lost(lstReason,lstId,"config");
		int row = lostDao.updateconfig(lost);
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
