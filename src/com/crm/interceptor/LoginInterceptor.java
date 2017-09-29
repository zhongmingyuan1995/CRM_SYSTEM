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
			   // ��������������Ҫ�õ�request,response,session����
		       HttpServletRequest servletRequest = (HttpServletRequest) request;
		       HttpServletResponse servletResponse = (HttpServletResponse) response;
		       HttpSession session = servletRequest.getSession();		
		       // ����û������URI
		       //String path = servletRequest.getRequestURI();
		       String path = servletRequest.getServletPath();
		       //System.out.println(path);
		       // ��session��ȡ�û���Ϣ
		       String username = (String) session.getAttribute("username");
		       // ��½ҳ���������
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
               // �ж����û��ȡ���û���Ϣ,����ת����½ҳ��
               if (username == null || "".equals(username)) {
            	    // ��ת����½ҳ��
                    servletResponse.sendRedirect("loginout.jsp");
                } else {
                    // �Ѿ���½,�����˴�����
                    chain.doFilter(request, response);
               }
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
