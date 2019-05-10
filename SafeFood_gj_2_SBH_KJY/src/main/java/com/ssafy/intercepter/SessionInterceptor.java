package com.ssafy.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


@Component
public class SessionInterceptor extends HandlerInterceptorAdapter 
{
	private static final Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);
	//@Override
	/*public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
	{
		HttpSession session = request.getSession();
		UserInfo userInfo = (UserInfo)session.getAttribute("loginUser");
		if(userInfo != null)
		{
			logger.trace("세션 통과");
			return true;
		}
		else
		{
			logger.trace("세션 없음");
			response.sendRedirect(request.getContextPath());
			return false;
		}
	}*/
}