package com.blogapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.blogapp.dto.UserLogin;
import com.blogapp.service.LoginService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	@RequestMapping("")
	public String loginPage(Model m) {
		return loginService.loginPage(m);
	}
	
	@RequestMapping(path = "",method=RequestMethod.POST)
	public String login(@Valid @ModelAttribute UserLogin user,BindingResult result,Model m, HttpSession session) {
		return loginService.loginUser(user, result, m, session);
	}

}
