package com.crm.servlet;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crm.dao.AssortDao;
import com.crm.dao.CustomerDao;
import com.crm.dao.OrderDao;
import com.crm.dao.impl.AssortDaoImpl;
import com.crm.dao.impl.CustomerDaoImpl;
import com.crm.dao.impl.OrderDaoImpl;
import com.crm.model.Assort;
import com.crm.model.Customer;
import com.crm.model.Order;
import com.crm.utils.Page;

public class OrderServlet extends HttpServlet {
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
			System.out.print("OrderServlet这里出错了！");
		}
	}
	protected void queryOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String odrCustNo = request.getParameter("odrCustNo");
		OrderDao orderDao = new OrderDaoImpl();
		String pageNow = request.getParameter("pageNow");
		Page page = new Page();
		String sql = "";
		int totalCount = (int) orderDao.getOrderCount(odrCustNo);
		if (pageNow != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));
			int startPos = page.getStartPos();
			int pageSize = page.getPageSize();
			sql = sql+" "+"limit"+" "+startPos+","+" "+pageSize+""; 
			List<Order> list = orderDao.selectOrder(odrCustNo,sql);
			request.setAttribute("Order", list);
			request.setAttribute("page", page);
		} else {
			page = new Page(totalCount, 1);
			int startPos = page.getStartPos();
			int pageSize = page.getPageSize();
			sql = sql+" "+"limit"+" "+startPos+","+" "+pageSize+"";
			List<Order> list = orderDao.selectOrder(odrCustNo,sql);
			request.setAttribute("Order", list);
			request.setAttribute("page", page);
		}			
		
		CustomerDao customerDao = new CustomerDaoImpl();
		//System.out.println(lkmCustNo);
		List<Customer> Customer = customerDao.queryBycustId(odrCustNo);
		request.setAttribute("Customer", Customer);	
		request.getRequestDispatcher("customer_order_history.jsp").forward(request, response);
		
	}
	
	protected void viewOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String adrCustNo = request.getParameter("adrCustNo");
		//System.out.println(assortCustNo);
		request.setAttribute("adrCustNo", adrCustNo);
			Long adrId = Long.parseLong(request.getParameter("adrId"));
			OrderDao orderDao = new OrderDaoImpl();
			List<Order> list = orderDao.selectOrderByodrId(adrId);
			request.setAttribute("Order", list);
			request.setAttribute("adrCustNo", adrCustNo);
			request.getRequestDispatcher("customer_edit_contect_recond.jsp").forward(request, response);	
	}
}
