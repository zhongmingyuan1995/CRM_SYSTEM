package com.crm.servlet;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crm.dao.BasdictDao;
import com.crm.dao.impl.BasdictDaoImpl;
import com.crm.model.Basdict;
import com.crm.utils.Page;

public class BasdictServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BasdictServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
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
			System.out.print("BasdictServlet这里出错了！");
		}
	}
	
	protected void queryLikeBasdict(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BasdictDao basdictDao = new BasdictDaoImpl();
		String dictItem = request.getParameter("dictItem");
		String dictType = request.getParameter("dictType");
		String dictValue = request.getParameter("dictValue");
		String pageNow = request.getParameter("pageNow");
		Page page = new Page();
		String sql = "";
		//System.out.println(dictItem);
		if(dictItem!=null && !"".equals(dictItem)){
			sql = sql+" and dict_item like '%"+dictItem+"%'"; 
		}
		if(dictType!=null && !"".equals(dictType)){
			sql = sql+" and dict_type like '%"+dictType+"%'"; 
		}
		if(dictValue!=null && !"".equals(dictValue)){
			sql = sql+" and dict_value like '%"+dictValue+"%'"; 
		}
		int totalCount = (int) basdictDao.getBasdictCount(sql);
		if (pageNow != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));
			int startPos = page.getStartPos();
			int pageSize = page.getPageSize();
			sql = sql+" "+"limit"+" "+startPos+","+" "+pageSize+""; 
			List<Basdict> Basdict = basdictDao.queryLikeBasdict(sql);
			request.setAttribute("Basdict", Basdict);
			request.setAttribute("page", page);
		} else {
			page = new Page(totalCount, 1);
			int startPos = page.getStartPos();
			int pageSize = page.getPageSize();
			sql = sql+" "+"limit"+" "+startPos+","+" "+pageSize+"";
			List<Basdict> Basdict = basdictDao.queryLikeBasdict(sql);
			request.setAttribute("Basdict", Basdict);
			request.setAttribute("page", page);
		}		
		request.getRequestDispatcher("data_dictionary.jsp").forward(request, response);
	}
	
	protected void dotest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("data_dictionary.jsp").forward(request, response);
	}

}
