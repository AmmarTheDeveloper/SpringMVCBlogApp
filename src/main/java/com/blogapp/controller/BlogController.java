package com.blogapp.controller;

import java.net.http.HttpRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.blogapp.dto.BlogRequest;
import com.blogapp.service.BlogService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/blogs")
public class BlogController {

	@Autowired
	BlogService blogService;

	@RequestMapping("/create")
	public String createBlogPage(Model m) {
		return this.blogService.createBlogPage(m);
	}

	@RequestMapping(path = "/create", method = RequestMethod.POST)
	public String createBlog(@Valid @ModelAttribute BlogRequest blog, BindingResult result, Model m,
			HttpServletRequest request, HttpSession session) {
		return this.blogService.createBlog(blog, result, m, request, session);
	}

	@RequestMapping("")
	public String blogPage(Model m, HttpSession session) {
		return this.blogService.blogsPage(m, session);
	}

	@RequestMapping("{id}")
	public String getBlog(@PathVariable("id") int id, Model m) {
		return this.blogService.getBlog(id, m);
	}

	@RequestMapping("my")
	public String getMyBlog(HttpSession session, Model m) {
		return blogService.getMyBlog(session, m);
	}

	@RequestMapping("delete/{id}")
	public String deleteBlog(@PathVariable("id") int id, HttpSession session, Model m) {
		return this.blogService.deleteBlog(id, session, m);
	}

	@RequestMapping("update/{id}")
	public String updateBlog(@PathVariable("id") int id, HttpSession session, Model m) {
		return this.blogService.updatePage(id, session, m);
	}

	@RequestMapping(path = "/update/{id}", method = RequestMethod.POST)
	public String createBlogPage(@PathVariable("id") int id,@ModelAttribute BlogRequest blog, BindingResult result, Model m,
			HttpServletRequest request, HttpSession session) {
		return this.blogService.updateBlog(id, blog, result, m, request, session);
	}

}
