package com.yc.web.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class RightFilter implements Filter {


//	@Override
//	public void doFilter(ServletRequest request, ServletResponse respones, FilterChain chain)
//			throws IOException, ServletException {
//		HttpServletRequest req=(HttpServletRequest) request;
//		if(req.getSession().getAttribute("users")!=null){
//			chain.doFilter(request, respones);
//		}else{
//			
//			request.getRequestDispatcher("/WEB-INF/jsp/userlogin.jsp").forward(request, respones);
//		}
//		
//	}
//
//	@Override
//	public void init(FilterConfig arg0) throws ServletException {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public void destroy() {
//		// TODO Auto-generated method stub
//		
//	}
	
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("过滤器1销毁方法");
	}
 
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req = (HttpServletRequest) request;
		System.out.println(req.getRequestURL());
		if(req.getSession().getAttribute("users")!=null) {
			System.out.println("过滤器1，客户端向Servlet发送的请求被我拦截到了");
			chain.doFilter(req, response);
			System.out.println("过滤器1，Servlet向客户端发送的响应被我拦截到了");
		}else {
            request.getRequestDispatcher("userlogininfo").forward(request, response);
		}
		
	}
 
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("过滤器1初始化方法");
	}

}
