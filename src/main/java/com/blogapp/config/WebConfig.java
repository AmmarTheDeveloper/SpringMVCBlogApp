package com.blogapp.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.blogapp.interceptors.AuthInterceptor;
import com.blogapp.interceptors.NonAuthInterceptor;

@Configuration
@EnableWebMvc
public class WebConfig implements WebMvcConfigurer {

	/*
	 * same as <mvc:resources location="/WEB-INF/uploads/"
	 * mapping="/resources/**"></mvc:resources>
	 */
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {

		registry.addResourceHandler("/uploads/**").addResourceLocations("/uploads/");

		registry.addResourceHandler("/static/**").addResourceLocations("/WEB-INF/static/");

	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		//for pages which requires user's to be logged in
		registry.addInterceptor(new AuthInterceptor()).addPathPatterns("/**").excludePathPatterns("/","/login", "/register",
				"/static/**", "/uploads/**");
		
		
		//for login register page so that logged in user's cannot access it
		registry.addInterceptor(new NonAuthInterceptor()).addPathPatterns("/login","/register");
	}

}
