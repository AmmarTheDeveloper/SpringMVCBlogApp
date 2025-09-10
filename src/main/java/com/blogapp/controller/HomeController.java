package com.blogapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blogapp.service.BlogService;
import com.blogapp.service.HomeService;

@Controller
public class HomeController {
	
		@Autowired
		HomeService homeService;
	

		@RequestMapping("/")
		public String homePage(Model m)throws Exception {
			return this.homeService.homePage(m);
		}
	
	
}
