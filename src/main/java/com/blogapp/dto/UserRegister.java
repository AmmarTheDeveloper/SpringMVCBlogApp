package com.blogapp.dto;

import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class UserRegister{
	
	@NotBlank(message = "Name field is required")
	private String name;
	
	@NotBlank(message = "Email field is required")
	@Email(message = "Invalid email format")
	private String email;
	
	@NotBlank(message = "Password field is required")
	@Size(min = 6,message = "Password must be at least 6 characters")
	private String password;
	
	private MultipartFile profile_image;
	
}
