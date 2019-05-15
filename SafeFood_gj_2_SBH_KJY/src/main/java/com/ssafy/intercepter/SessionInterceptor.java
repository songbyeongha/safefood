package com.ssafy.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ssafy.dto.Member;

@Component
public class SessionInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean userFlag = false;
		System.out.println("page interceptor");
		Member member = (Member) request.getSession().getAttribute("userInfo");
		System.out.println("page : " + " "+(Integer)request.getSession().getAttribute("authority"));
		if(request.getSession().getAttribute("userInfo") != null && member.getAuthority() == 2) {
			logger.trace("page : {}", (Integer)request.getSession().getAttribute("authority"));
			System.out.println("세션 인증!!");
			userFlag = true;
		}
		else {
			System.out.println("no session");
			logger.trace("page : {}", (Integer)request.getSession().getAttribute("authority"));
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			
			userFlag = false;
		}
		return userFlag;
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



