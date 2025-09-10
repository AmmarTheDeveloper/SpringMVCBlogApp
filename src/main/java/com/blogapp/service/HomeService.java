package com.blogapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.blogapp.dao.BlogDao;
import com.blogapp.entities.Blog;

@Service
public class HomeService {
	
	@Autowired
	BlogDao blogDao;
	
	public String homePage(Model m) {
		List<Blog> blogs = blogDao.getBlogs();
		
		// If list has more than 10 elements, keep only first 10
		if (blogs.size() > 10) {
		    blogs = blogs.subList(0, 10); // subList(fromIndex, toIndex) → 0 to 10 (exclusive)
		}
		
		m.addAttribute("blogs",blogs);
		return "index";
	}
	

}
