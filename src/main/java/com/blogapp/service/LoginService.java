package com.blogapp.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import com.blogapp.dao.UserDao;
import com.blogapp.dto.UserLogin;
import com.blogapp.entities.User;

import jakarta.servlet.http.HttpSession;

@Service
public class LoginService {
	
	@Autowired
	UserDao userDao;

	public String loginPage(Model m) {
		m.asMap().remove("success");
		return "Login";
	}
	
	//using redirectAttribute so that the added errors & success messages disappear after the next request
	//in model we have to manually removeit from the backend we can't remove from jsp it is a issue
	public String loginUser(UserLogin user, BindingResult result, Model m,HttpSession session) {
		
		if(result.hasErrors()) {
			Map<String,String> fieldErrors = new HashMap<>();
			for(FieldError error: result.getFieldErrors()) {
				fieldErrors.put(error.getField(),error.getDefaultMessage());
			}
			
			m.addAttribute("fieldErrors",fieldErrors);
			return "Login";
		}
		
		User found_user = userDao.findByEmailAndPassword(user.getEmail()	, user.getPassword());
		if(found_user == null) {
			m.addAttribute("error","Invalid email or password");
			return "Login";
		}
		
		System.out.println(found_user);
		
		session.setAttribute("user", found_user);
		m.addAttribute("success","User  logged in successfully");
		return "Login";
	}
	
}
