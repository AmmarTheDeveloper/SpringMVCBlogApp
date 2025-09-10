package com.blogapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blogapp.service.LogoutService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LogoutController {
	
	@Autowired
	LogoutService logoutService;

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("working");
		return this.logoutService.logout(session);
	}
	
}
