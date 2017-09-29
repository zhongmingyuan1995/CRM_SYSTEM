package com.crm.interceptor;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements Filter {

    public LoginInterceptor() {
      
    }

	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
			   // 获得在下面代码中要用的request,response,session对象
		       HttpServletRequest servletRequest = (HttpServletRequest) request;
		       HttpServletResponse servletResponse = (HttpServletResponse) response;
		       HttpSession session = servletRequest.getSession();		
		       // 获得用户请求的URI
		       //String path = servletRequest.getRequestURI();
		       String path = servletRequest.getServletPath();
		       //System.out.println(path);
		       // 从session里取用户信息
		       String username = (String) session.getAttribute("username");
		       // 登陆页面无需过滤
               if(path.indexOf("login.jsp") > -1) {
                   chain.doFilter(servletRequest, servletResponse);
                   return;
                }
               if(path.indexOf("loginout.jsp") > -1) {
                   chain.doFilter(servletRequest, servletResponse);
                   return;
                }
               if(path.indexOf("exit.do") > -1) {
                   chain.doFilter(servletRequest, servletResponse);
                   return;
                }
               // 判断如果没有取到用户信息,就跳转到登陆页面
               if (username == null || "".equals(username)) {
            	    // 跳转到登陆页面
                    servletResponse.sendRedirect("loginout.jsp");
                } else {
                    // 已经登陆,继续此次请求
                    chain.doFilter(request, response);
               }
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
