package com.blogapp.interceptors;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


//Since Spring 5.3 (2020), HandlerInterceptorAdapter is deprecated.
//Reason: Java 8 introduced default methods in interfaces → you can now implement only the methods you need without needing an adapter class.
public class AuthInterceptor implements HandlerInterceptor {
	
	//for pages which requires user's login
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Object user = session.getAttribute("user");
		
		if(user != null) return true;
		
		response.sendRedirect(request.getContextPath() + "/login");
		return false;
	}
	
	
}
