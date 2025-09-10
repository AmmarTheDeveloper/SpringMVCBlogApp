package com.blogapp.dto;

import java.time.LocalDateTime;
import java.util.List;

import com.blogapp.entities.Blog;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserResponse{

	private int id;
	private String name;
	private String email;
	private String profile_image;
	private List<Blog> blogs;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;
	
}
