package com.blogapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blogapp.service.AccountService;

@Controller
public class AccountController {

	@Autowired
	AccountService accountService;
	
	
	@RequestMapping("/account")
	public String accountPage() {
		return accountService.accountPage();
	}
	
}
