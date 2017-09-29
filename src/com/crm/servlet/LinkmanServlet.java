package com.crm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crm.dao.CustomerDao;
import com.crm.dao.LinkmanDao;
import com.crm.dao.impl.CustomerDaoImpl;
import com.crm.dao.impl.LinkmanDaoImpl;
import com.crm.model.Customer;
import com.crm.model.Linkman;
import com.crm.utils.Page;

public class LinkmanServlet extends HttpServlet {
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
			System.out.print("LinkmanServlet这里出错了！");
		}
	}
	
	protected void queryLinkman(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String lkmCustNo = request.getParameter("lkmCustNo");
		LinkmanDao linkmanDao = new LinkmanDaoImpl();
		String pageNow = request.getParameter("pageNow");
		Page page = new Page();
		String sql = "";
		int totalCount = (int) linkmanDao.getlinkmanCount(lkmCustNo);
		if (pageNow != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));
			int startPos = page.getStartPos();
			int pageSize = page.getPageSize();
			sql = sql+" "+"limit"+" "+startPos+","+" "+pageSize+""; 
			List<Linkman> list = linkmanDao.selectLinkman(lkmCustNo,sql);
			request.setAttribute("Linkman", list);
			request.setAttribute("page", page);
		} else {
			page = new Page(totalCount, 1);
			int startPos = page.getStartPos();
			int pageSize = page.getPageSize();
			sql = sql+" "+"limit"+" "+startPos+","+" "+pageSize+"";
			List<Linkman> list = linkmanDao.selectLinkman(lkmCustNo,sql);
			request.setAttribute("Linkman", list);
			request.setAttribute("page", page);
		}	
		
		CustomerDao customerDao = new CustomerDaoImpl();
		//System.out.println(lkmCustNo);
		List<Customer> Customer = customerDao.queryBycustId(lkmCustNo);
		request.setAttribute("Customer", Customer);	
		request.getRequestDispatcher("customer_linkman.jsp").forward(request, response);
		
	}
	
	protected void createoreditLinkman(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String lkmCustNo = request.getParameter("lkmCustNo");
		String flag = request.getParameter("flag");
		request.setAttribute("lkmCustNo", lkmCustNo);
		if(flag.equals("create")){
			request.getRequestDispatcher("customer_create_linkman.jsp").forward(request, response);
		}else{
			Long lkmId = Long.parseLong(request.getParameter("lkmId"));
			LinkmanDao linkmanDao = new LinkmanDaoImpl();
			List<Linkman> list = linkmanDao.selectLinkmanBylkmId(lkmId);
			request.setAttribute("Linkman", list);
			request.setAttribute("lkmId", lkmId);
			request.getRequestDispatcher("customer_edit_linkman.jsp").forward(request, response);
		}
		
		
	}
	
	protected void insertLinkman(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		String lkmCustNo = request.getParameter("lkmCustNo");
		String lkmName = request.getParameter("lkmName");
		String lkmSex = request.getParameter("lkmSex");
		String lkmPostion = request.getParameter("lkmPostion");
		String lkmTel = request.getParameter("lkmTel");
		String lkmMobile = request.getParameter("lkmMobile");
		String lkmMemo = request.getParameter("lkmMemo");
		//System.out.print(lkmCustNo);
		Linkman linkman = new Linkman(lkmCustNo,lkmName,lkmSex,lkmPostion,lkmTel,lkmMobile,lkmMemo);
		LinkmanDao linkmanDao = new LinkmanDaoImpl();
		int row = linkmanDao.insertLinkman(linkman);
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
	
	protected void updateLinkman(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		Long lkmId = Long.parseLong(request.getParameter("lkmId"));
		String lkmName = request.getParameter("lkmName");
		String lkmSex = request.getParameter("lkmSex");
		String lkmPostion = request.getParameter("lkmPostion");
		String lkmTel = request.getParameter("lkmTel");
		String lkmMobile = request.getParameter("lkmMobile");
		String lkmMemo = request.getParameter("lkmMemo");
		//System.out.print(lkmId);
		Linkman linkman = new Linkman(lkmName,lkmSex,lkmPostion,lkmTel,lkmMobile,lkmMemo,lkmId);
		LinkmanDao linkmanDao = new LinkmanDaoImpl();
		int row = linkmanDao.updateLinkman(linkman);
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
	
	protected void delLinkman(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Long lkmId = Long.parseLong(request.getParameter("lkmId"));
		LinkmanDao linkmanDao = new LinkmanDaoImpl();
		int row = linkmanDao.deleteLinkman(lkmId);
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
