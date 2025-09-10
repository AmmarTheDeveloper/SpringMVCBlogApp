package com.blogapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.blogapp.dto.UserRegister;
import com.blogapp.service.RegisterService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller()
@RequestMapping("/register")
public class RegisterController {

	@Autowired
	RegisterService registerService;

	@RequestMapping(path = "", method = RequestMethod.GET)
	public String registerPage(Model m) {
		return registerService.registerPage(m);
	}

	@RequestMapping(path = "", method = RequestMethod.POST)
	//binding result should be placed right after @valid so that the errors are sended in it, other wise we get exception our application will be terminated
	public String register(@Valid @ModelAttribute UserRegister userRegister,BindingResult result, HttpServletRequest request, Model m) {
		return registerService.registerUser(userRegister, result,request,m);
	}

}
