package com.blogapp.service;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class LogoutService {

	public String logout(HttpSession session) {

		session.removeAttribute("user");

		return "redirect:/login";
	}

}
