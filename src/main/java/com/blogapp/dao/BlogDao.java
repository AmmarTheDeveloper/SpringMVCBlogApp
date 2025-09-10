package com.blogapp.dao;

import java.util.List;

import com.blogapp.entities.Blog;
import com.blogapp.entities.User;

public interface BlogDao {
	
	public List<Blog> getBlogs();
	
	public Blog getBlog(int id);
	
	public void insertBlog(Blog blog);
	
	public void updateBlog(Blog blog);
	
	public void deleteBlog(Blog blog);
	
	public List<Blog> getBlogsByUser(User user);

}
