package com.blogapp.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class UserLogin {
	
	@NotBlank(message = "Email field is required")
	@Email(message = "Invalid email format")
	private String email;
	
	@NotBlank(message = "Password field is required")
	private String password;

}
