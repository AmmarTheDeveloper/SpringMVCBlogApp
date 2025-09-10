package com.blogapp.dto;

import java.time.LocalDateTime;

import org.springframework.web.multipart.MultipartFile;

import com.blogapp.entities.User;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BlogResponse{

	private int id;
	private String title;
	private MultipartFile thumbnail;
	private String description;
	private String content;
	private User user;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;
	
}
