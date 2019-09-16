package com.safefood.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.safefood.dto.Member;

@Component
public class AdminInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean adminFlag = false;
		Member member = (Member) request.getSession().getAttribute("adminInfo");
		logger.trace("admin : {}", member);
		if(request.getSession().getAttribute("adminInfo") != null && member.getAuthority() == 1) {
			System.out.println("세션 인증!!");
			adminFlag = true;
		}
		else {
			System.out.println("no session");
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			adminFlag = false;
		}
		return adminFlag;
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

