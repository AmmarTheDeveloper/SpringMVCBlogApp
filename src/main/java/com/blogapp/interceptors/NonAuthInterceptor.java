package com.blogapp.interceptors;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


// for login & register page
public class NonAuthInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			HttpSession session = request.getSession();
			Object user = session.getAttribute("user");
			
			if(user == null) return true;
			
			response.sendRedirect(request.getContextPath() + "/");
			return true;
	}

}
