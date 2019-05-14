package com.ssafy.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class SessionInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean masterFlag = false;
		System.out.println("page interceptor");
		
		if(request.getSession().getAttribute("userInfo") != null) {
			System.out.println("세션 인증!!");
			masterFlag = true;
		}
		else {
			System.out.println("no session");
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			
			masterFlag = false;
		}
		return masterFlag;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
		super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception{
		super.afterCompletion(request, response, handler, ex);
	}

}