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

import com.crm.dao.SalchanceDao;
import com.crm.dao.UserDao;
import com.crm.dao.impl.SalchanceDaoImpl;
import com.crm.dao.impl.UserDaoImpl;
import com.crm.model.Salchance;
import com.crm.model.User;
import com.crm.utils.Page;


public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // 获取方法名字
        String servletPath = request.getServletPath();// /xxxxxx.do
        // 去掉斜杠和.do
        String methodName = servletPath.substring(1, servletPath.length() - 3);// xxxxxx
        try {
            // 利用反射获取方法
            Method method = getClass().getDeclaredMethod(methodName,
                    HttpServletRequest.class, HttpServletResponse.class);
            // 执行相应的方法
            method.invoke(this, request, response);
        } catch (Exception e) {
        	System.out.print("UserServlet这里出错了！");
        }
	}
	
	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	    //把表单的数据存到user对象中    
	    String username = request.getParameter("username");	
	    String password = request.getParameter("password");
	    User user = new User(username,password);    
	    //登录验证
	    UserDao userdao = new UserDaoImpl();
	    boolean result = false;
		result = userdao.login(user);
		PrintWriter out = response.getWriter();
		 //如果是中文的返回信息
		 response.setContentType("text/html;charset=utf-8");//文本信息
		 response.setCharacterEncoding("utf-8");//输入的帐号和密码作为参数去数据库查询		
	    if(result){
	    	out.write("1");
	    	HttpSession session = request.getSession(); 
	    	session.setAttribute("username", username);
	    }else{
			 out.write("2");
		 }
		 out.close(); 
	}
	
	protected void exit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().invalidate();
		response.sendRedirect("login.jsp");  
	}
	
	protected void querysalchance(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		SalchanceDao salchanceDao = new SalchanceDaoImpl();
		String pageNow = request.getParameter("pageNow");
		Page page = new Page();
		String chcCustName = request.getParameter("chcCustName");
		String chcTitle = request.getParameter("chcTitle");
		String chcLinkman = request.getParameter("chcLinkman");
		String sql = "";
		if(chcCustName!=null && !"".equals(chcCustName)){
			sql = sql+" and chc_cust_name like '%"+chcCustName+"%'"; 
		}
		if(chcTitle!=null && !"".equals(chcTitle)){
			sql = sql+" and chc_title like '%"+chcTitle+"%'"; 
		}
		if(chcLinkman!=null && !"".equals(chcLinkman)){
			sql = sql+" and chc_linkman like '%"+chcLinkman+"%'"; 
		}
		int totalCount = (int) salchanceDao.getSalchanceCount(sql);
		//System.out.println(totalCount);
		if (pageNow != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));
			int startPos = page.getStartPos();
			int pageSize = page.getPageSize();
			sql = sql+" "+"limit"+" "+startPos+","+" "+pageSize+""; 
			List<Salchance> list = salchanceDao.queryLike(sql);
			request.setAttribute("page", page);
			request.setAttribute("salList", list);
		} else {
			page = new Page(totalCount, 1);
			int startPos = page.getStartPos();
			int pageSize = page.getPageSize();
			sql = sql+" "+"limit"+" "+startPos+","+" "+pageSize+"";
			List<Salchance> list = salchanceDao.queryLike(sql);
			request.setAttribute("page", page);
			request.setAttribute("salList", list);
		}				
		request.getRequestDispatcher("index.jsp").forward(request, response);			
	}
	
	protected void insertsalchance(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		SalchanceDao salchanceDao = new SalchanceDaoImpl();
		String chccustname = request.getParameter("chccustname");
		String chcsource = request.getParameter("chcsource");
		String chctitle = request.getParameter("chctitle");
		Integer chcrate = Integer.parseInt(request.getParameter("chcrate"));
		String chclinkman = request.getParameter("chclinkman");
		String chctel = request.getParameter("chctel");
		String chcdesc = request.getParameter("chcdesc");
		HttpSession session = request.getSession(); 
		String chccreatename = (String)session.getAttribute("username");
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String chccreatedate = sdf.format(date);
		Salchance salchance = new Salchance(chccustname,chcsource,chctitle, chcrate, chclinkman, chctel, chcdesc, chccreatename, chccreatedate);
		int row = salchanceDao.insertSalchance(salchance);	
		PrintWriter out = response.getWriter();
		 //如果是中文的返回信息
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
	
	protected void editsalchance(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		SalchanceDao salchanceDao = new SalchanceDaoImpl();		
		Long chcid = Long.parseLong(request.getParameter("chcid"));	
		String flag = request.getParameter("flag");
		Salchance salchance = new Salchance(chcid);
		List<Salchance> list = salchanceDao.querySalchanceByid(salchance);	
		request.setAttribute("Salchance", list);		
		if(flag.equals("edit")){
			request.getRequestDispatcher("edit_salchance.jsp").forward(request, response);
		}else if(flag.equals("due")){
			User user = new User();
			UserDao userDao = new UserDaoImpl();
			List<User> due = userDao.queryUserRole();
			request.setAttribute("UserRole", due);
			request.getRequestDispatcher("due_salchance.jsp").forward(request, response);
		}else if(flag.equals("plan")){
			request.getRequestDispatcher("create_plan.jsp").forward(request, response);
		}
	}
	
	protected void updatesalchance(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		SalchanceDao salchanceDao = new SalchanceDaoImpl();
		String chccustname = request.getParameter("chccustname");
		String chcsource = request.getParameter("chcsource");
		String chctitle = request.getParameter("chctitle");
		Integer chcrate = Integer.parseInt(request.getParameter("chcrate"));
		String chclinkman = request.getParameter("chclinkman");
		String chctel = request.getParameter("chctel");
		String chcdesc = request.getParameter("chcdesc");
		Long chcid = Long.parseLong(request.getParameter("chcid"));	
		Salchance salchance = new Salchance(chccustname,chcsource,chctitle, chcrate, chclinkman, chctel, chcdesc, chcid);
		int row = salchanceDao.updateSalchance(salchance);	
		PrintWriter out = response.getWriter();
		 //如果是中文的返回信息
		response.setContentType("text/html;charset=utf-8");//文本信息
		response.setCharacterEncoding("utf-8");//输入的帐号和密码作为参数去数据库查询	
		if(row>0){
			out.write("1");
		}else{
			out.write("2");
		 }
		 out.close(); 
	}
	
	protected void delsalchance(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		SalchanceDao salchanceDao = new SalchanceDaoImpl();		
		Long chcid = Long.parseLong(request.getParameter("chcid"));	
		Salchance salchance = new Salchance(chcid);
		int row = salchanceDao.delSalchanceByid(salchance);	
		PrintWriter out = response.getWriter();
		 //如果是中文的返回信息
		response.setContentType("text/html;charset=utf-8");//文本信息
		response.setCharacterEncoding("utf-8");//输入的帐号和密码作为参数去数据库查询	
		if(row>0){
			out.write("1");
		}else{
			out.write("2");
		 }
		 out.close(); 
	}
	
	protected void duesalchance(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		SalchanceDao salchanceDao = new SalchanceDaoImpl();
		String chcduename = request.getParameter("chcduename");
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String chcduedate = sdf.format(date);
	    Long chcid = Long.parseLong(request.getParameter("chcid"));
	    Long chcdueid = Long.parseLong(request.getParameter("chcdueid"));
		Salchance salchance = new Salchance(chcdueid,chcduename,chcduedate,chcid);
		int row = salchanceDao.duesalchance(salchance);	
		//System.out.print(row);
		PrintWriter out = response.getWriter();
		 //如果是中文的返回信息
		response.setContentType("text/html;charset=utf-8");//文本信息
		response.setCharacterEncoding("utf-8");//输入的帐号和密码作为参数去数据库查询	
		if(row>0){
			out.write("1");
		}else{
			out.write("2");
		 }
		 out.flush();
		 out.close(); 
	}
	
	protected void querysalchanceNodue(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		SalchanceDao salchanceDao = new SalchanceDaoImpl();
		String pageNow = request.getParameter("pageNow");
		Page page = new Page();
		String chcCustName = request.getParameter("chcCustName");
		String chcTitle = request.getParameter("chcTitle");
		String chcLinkman = request.getParameter("chcLinkman");
		String sql = "";
		if(chcCustName!=null && !"".equals(chcCustName)){
			sql = sql+" and chc_cust_name like '%"+chcCustName+"%'"; 
		}
		if(chcTitle!=null && !"".equals(chcTitle)){
			sql = sql+" and chc_title like '%"+chcTitle+"%'"; 
		}
		if(chcLinkman!=null && !"".equals(chcLinkman)){
			sql = sql+" and chc_linkman like '%"+chcLinkman+"%'"; 
		}
		int totalCount = (int) salchanceDao.getSalchanceNodueCount(sql);
		//System.out.println(totalCount);
		if (pageNow != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));
			int startPos = page.getStartPos();
			int pageSize = page.getPageSize();
			sql = sql+" "+"limit"+" "+startPos+","+" "+pageSize+""; 
			List<Salchance> list = salchanceDao.queryLikeNodue(sql);
			request.setAttribute("salList", list);	
			request.setAttribute("page", page);
		} else {
			page = new Page(totalCount, 1);
			int startPos = page.getStartPos();
			int pageSize = page.getPageSize();
			sql = sql+" "+"limit"+" "+startPos+","+" "+pageSize+"";
			List<Salchance> list = salchanceDao.queryLikeNodue(sql);
			request.setAttribute("salList", list);	
			request.setAttribute("page", page);
		}				
			request.getRequestDispatcher("plan_index.jsp").forward(request, response);		
		
	}
	
	protected void updatesalsuccess(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		Long chcid = Long.parseLong(request.getParameter("chcid"));
		SalchanceDao salchanceDao = new SalchanceDaoImpl();
		int row = salchanceDao.updatesalsuccess(chcid);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		//System.out.println(row);
		if(row>0){
			out.write("1");
		}else{
			out.write("2");
		 }
		 out.flush();
		 out.close(); 
	}
	
	protected void updatesaldefeat(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		Long chcid = Long.parseLong(request.getParameter("chcid"));
		SalchanceDao salchanceDao = new SalchanceDaoImpl();
		int row = salchanceDao.updatesaldefeat(chcid);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
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
