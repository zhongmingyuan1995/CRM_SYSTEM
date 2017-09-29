package com.crm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crm.dao.PlanDao;
import com.crm.dao.SalchanceDao;
import com.crm.dao.impl.PlanDaoImpl;
import com.crm.dao.impl.SalchanceDaoImpl;
import com.crm.model.Plan;
import com.crm.model.Salchance;


public class PlanServlet extends HttpServlet {
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
			System.out.print("PlanServlet这里出错了！");
		}
	}
	
	protected void saveplan(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		Long chcid = Long.parseLong(request.getParameter("chcid"));
		String plandate = request.getParameter("plandate");
		String plantodo = request.getParameter("plantodo");
		//System.out.print(chcid);测试通过
		Plan plan = new Plan(chcid,plandate,plantodo);
		PlanDao planDao = new PlanDaoImpl();
		int row = planDao.insertPlan(plan);
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
	
	protected void queryplan(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		Long chcid = Long.parseLong(request.getParameter("chcid"));
		Plan plan = new Plan(chcid);
		PlanDao planDao = new PlanDaoImpl();
		List<Plan> planlist = planDao.selectBychcid(plan);
		request.setAttribute("Plan", planlist);
				
		String flag = request.getParameter("flag");
		SalchanceDao salchanceDao = new SalchanceDaoImpl();
		Salchance salchance = new Salchance(chcid);
		List<Salchance> salchancelist = salchanceDao.querySalchanceByid(salchance);	
		request.setAttribute("Salchance", salchancelist);
		if(flag.equals("zdplan")){
			request.getRequestDispatcher("create_plan.jsp").forward(request, response);
		}else if(flag.equals("zxplan")){
			request.getRequestDispatcher("plan_work.jsp").forward(request, response);
		}else if(flag.equals("succplan")){
			request.getRequestDispatcher("plan_success.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("plan_defeat.jsp").forward(request, response);
		}
		
	}
	
	protected void updateplan(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		String plantodo = request.getParameter("plantodo");
		Long planid = Long.parseLong(request.getParameter("planid"));
		Plan plan = new Plan(plantodo,planid);
		PlanDao planDao = new PlanDaoImpl();
		int row = planDao.updateByid(plan);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		//System.out.println(planid);测试通过
		if(row>0){
			out.write("1");
		}else{
			out.write("2");
		 }
		 out.flush();
		 out.close(); 
	}
	
	protected void deleteplan(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		Long planid = Long.parseLong(request.getParameter("planid"));
		//Plan plan = new Plan(planid);
		PlanDao planDao = new PlanDaoImpl();
		int row = planDao.deleteByid(planid);
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
	
	protected void updateplanresult(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		String planresult = request.getParameter("planresult");
		Long planid = Long.parseLong(request.getParameter("planid"));
		//Plan plan = new Plan(planresult,planid);
		PlanDao planDao = new PlanDaoImpl();
		int row = planDao.updateresultByid(planresult,planid);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		//System.out.println(planid);测试通过
		if(row>0){
			out.write("1");
		}else{
			out.write("2");
		 }
		 out.flush();
		 out.close(); 
	}
	
	
}
