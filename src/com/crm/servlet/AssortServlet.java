package com.crm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crm.dao.AssortDao;
import com.crm.dao.CustomerDao;
import com.crm.dao.LinkmanDao;
import com.crm.dao.impl.AssortDaoImpl;
import com.crm.dao.impl.CustomerDaoImpl;
import com.crm.dao.impl.LinkmanDaoImpl;
import com.crm.model.Assort;
import com.crm.model.Customer;
import com.crm.model.Linkman;
import com.crm.utils.Page;

public class AssortServlet extends HttpServlet {
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
			System.out.print("AssortServlet这里出错了！");
		}
	}
	
	protected void queryAssort(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String assortCustNo = request.getParameter("assortCustNo");
		AssortDao AssortDao = new AssortDaoImpl();
		String pageNow = request.getParameter("pageNow");
		Page page = new Page();
		String sql = "";
		int totalCount = (int) AssortDao.getAssortCount(assortCustNo);
		if (pageNow != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));
			int startPos = page.getStartPos();
			int pageSize = page.getPageSize();
			sql = sql+" "+"limit"+" "+startPos+","+" "+pageSize+""; 
			List<Assort> list = AssortDao.selectAssort(assortCustNo,sql);
			request.setAttribute("Assort", list);
			request.setAttribute("page", page);
		} else {
			page = new Page(totalCount, 1);
			int startPos = page.getStartPos();
			int pageSize = page.getPageSize();
			sql = sql+" "+"limit"+" "+startPos+","+" "+pageSize+"";
			List<Assort> list = AssortDao.selectAssort(assortCustNo,sql);
			request.setAttribute("Assort", list);
			request.setAttribute("page", page);
		}	
		CustomerDao customerDao = new CustomerDaoImpl();
		//System.out.println(lkmCustNo);
		List<Customer> Customer = customerDao.queryBycustId(assortCustNo);
		request.setAttribute("Customer", Customer);	
		request.getRequestDispatcher("customer_contect_recond.jsp").forward(request, response);
		
	}
	
	protected void createoreditAssort(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String assortCustNo = request.getParameter("assortCustNo");
		String flag = request.getParameter("flag");
		//System.out.println(assortCustNo);
		request.setAttribute("assortCustNo", assortCustNo);
		if(flag.equals("create")){
			request.getRequestDispatcher("customer_create_contect_recond.jsp").forward(request, response);
		}else{
			Long assortId = Long.parseLong(request.getParameter("assortId"));
			AssortDao assortDao = new AssortDaoImpl();
			List<Assort> list = assortDao.selectAssortByatvId(assortId);
			request.setAttribute("Assort", list);
			request.setAttribute("assortId", assortId);
			request.getRequestDispatcher("customer_edit_contect_recond.jsp").forward(request, response);
		}
	}
	
	protected void insertAssort(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		String assortCustNo = request.getParameter("assortCustNo");
		String atvDate = request.getParameter("atvDate");
		String atvPlace = request.getParameter("atvPlace");
		String atvTitle = request.getParameter("atvTitle");
		String atvDesc = request.getParameter("atvDesc");
		//System.out.print(atvPlace);
		Assort assort = new Assort(assortCustNo,atvDate,atvPlace,atvTitle,atvDesc);
		AssortDao assortDao = new AssortDaoImpl();
		int row = assortDao.insertAssort(assort);
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
	
	protected void updateAssort(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		Long atvId = Long.parseLong(request.getParameter("atvId"));
		String atvDate = request.getParameter("atvDate");
		String atvPlace = request.getParameter("atvPlace");
		String atvTitle = request.getParameter("atvTitle");
		String atvDesc = request.getParameter("atvDesc");
		//System.out.print(lkmId);
		Assort assort = new Assort(atvDate,atvPlace,atvTitle,atvDesc,atvId);
		AssortDao assortDao = new AssortDaoImpl();
		int row = assortDao.updateAssort(assort);
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
	
	protected void delAssort(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Long atvId = Long.parseLong(request.getParameter("atvId"));
		AssortDao assortDao = new AssortDaoImpl();
		int row = assortDao.deleteAssort(atvId);
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
