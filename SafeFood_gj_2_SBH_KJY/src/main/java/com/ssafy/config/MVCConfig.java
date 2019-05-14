package com.ssafy.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.ssafy.intercepter.AdminInterceptor;
import com.ssafy.intercepter.SessionInterceptor;

@Configuration
public class MVCConfig extends WebMvcConfigurerAdapter {
	// 매핑되지 않은 URL은 뷰 리졸버가 처리해서 파일로 연결시킨다.

	@Bean
	public ViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/view/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
   
	// static 자료들 맵핑
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/static/**").addResourceLocations("/WEB-INF/static/");
	}

	@Autowired
	SessionInterceptor sessionInterceptor;
	@Autowired
	AdminInterceptor adminInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(sessionInterceptor).addPathPatterns("/session/*", "/foodDetail", "/foodIntake", "/foodWish" );
		registry.addInterceptor(adminInterceptor).addPathPatterns("/adminpage");
	}
}