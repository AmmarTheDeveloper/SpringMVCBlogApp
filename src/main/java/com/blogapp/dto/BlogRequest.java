package com.blogapp.dto;

import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BlogRequest {

	
	@NotBlank(message = "Title is required")
	private String title;
	
	private MultipartFile thumbnail;
	
	@NotBlank(message = "Description is required")
	@Size(min = 10,message = "Description minimum length is 10 characters")
	private String description;
	
	@NotBlank(message = "Content is required")
	@Size(min = 20,message = "Content minimum length is 20 characters")
	private String content;
	
}
