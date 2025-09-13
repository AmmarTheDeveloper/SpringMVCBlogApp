package com.blogapp.service;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import com.blogapp.dao.UserDao;
import com.blogapp.dto.UserRegister;
import com.blogapp.entities.User;
import com.blogapp.utils.FileHandling;
import com.blogapp.utils.ImageValidator;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class RegisterService {
	
	@Autowired
	UserDao userDao;

	public String registerPage(Model m) {
	    // create empty DTO so JSP has something to bind
	    if (!m.containsAttribute("userRegister")) {
	        m.addAttribute("userRegister", new UserRegister());
	    }
	    
		return "Register";
	}

	public String registerUser(UserRegister user,  BindingResult result,HttpServletRequest request , Model m) {

		if (result.hasErrors()) {
			
			Map<String, String> fieldErrors = new HashMap<>();
			
			for(FieldError error: result.getFieldErrors()) {
				fieldErrors.put(error.getField(), error.getDefaultMessage());
			}
			
			m.addAttribute("fieldErrors", fieldErrors);
			m.addAttribute("userRegister",user);
			return "Register";
		}
		
		if(userDao.getUserByEmail(user.getEmail()) != null) {
			m.addAttribute("error", "User already exists");
			return "Register";
		}
		
		try {
			String fileName = "";
			if (user.getProfile_image() != null && !user.getProfile_image().isEmpty()) {

				String path = request.getServletContext().getRealPath("/uploads");
				
				fileName = new Date().getTime() + "-" + user.getProfile_image().getOriginalFilename();
				
				//adding timestamp to generate uinque name for every image
				path = path + File.separator + fileName;
					
				FileHandling.saveFile(user.getProfile_image(), new ImageValidator(), path);
				
			}else {
				throw new Exception("Profile image not provided");
			}
			
			User userBuilder=User.builder()
			.name(user.getName())
			.email(user.getEmail())
			.password(user.getPassword())
			.profile(fileName)
			.build();
			
			userDao.insert(userBuilder);
			
			m.addAttribute("success","Your account has been created successfully");
			m.addAttribute("userRegister", new UserRegister()); // clearing the form with new empty object
			
			return "Register";
		}catch (Exception e) {
			m.addAttribute("userRegister",user);
			m.addAttribute("imgError", e.getMessage());
			return "Register";
		}
	}

}
