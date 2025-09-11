package com.blogapp.service;

import java.io.File;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import com.blogapp.dao.BlogDao;
import com.blogapp.dto.BlogRequest;
import com.blogapp.entities.Blog;
import com.blogapp.entities.Blog.BlogBuilder;
import com.blogapp.entities.User;
import com.blogapp.utils.FileHandling;
import com.blogapp.utils.ImageValidator;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class BlogService {

	@Autowired
	BlogDao blogDao;

	public String createBlogPage(Model m) {
		m.addAttribute("blogRequest", new BlogRequest());
		return "create_blog";
	}

	public String createBlog(BlogRequest blog, BindingResult result, Model m, HttpServletRequest request,
			HttpSession session) {

		if (result.hasErrors()) {
			Map<String, String> fieldErrors = new HashMap<>();
			for (FieldError error : result.getFieldErrors()) {
				fieldErrors.put(error.getField(), error.getDefaultMessage());
			}

			m.addAttribute("fieldErrors", fieldErrors);
			return "create_blog";
		}
		try {
			String fileName = "";
			if (blog.getThumbnail() != null && !blog.getThumbnail().isEmpty()) {

				String path = request.getServletContext().getRealPath("/uploads");

				fileName = new Date().getTime() + "-" + blog.getThumbnail().getOriginalFilename();

				// adding timestamp to generate uinque name for every image
				path = path + File.separator + fileName;

				FileHandling.saveFile(blog.getThumbnail(), new ImageValidator(), path);

			} else {
				throw new Exception("Blog thumbnail is not provided");
			}

			BlogBuilder new_blog = Blog.builder();
			new_blog.title(blog.getTitle()).description(blog.getDescription()).content(blog.getContent())
					.thumbnail(fileName).user((User) session.getAttribute("user"));

			blogDao.insertBlog(new_blog.build());

			m.addAttribute("success", "Your blog has been created successfully");
			m.addAttribute("blogRequest", new BlogRequest()); // clearing the form with new empty object

			return "create_blog";
		} catch (Exception e) {
			m.addAttribute("blogRequest", blog);
			m.addAttribute("imgError", e.getMessage());
			return "create_blog";
		}
	}

	public String blogsPage(Model m, HttpSession session) {
		List<Blog> blogsByUser = blogDao.getBlogsByUser((User) session.getAttribute("user"));
		m.addAttribute("blogs", blogsByUser);
		return "blogs";
	}

	public String getBlog(int id, Model m) {
		Blog blog = blogDao.getBlog(id);

		m.addAttribute("blog", blog);
		return "blog";
	}

	public String getMyBlog(HttpSession session, Model m) {

		User user = (User) session.getAttribute("user");

		List<Blog> blogs = blogDao.getBlogsByUser(user);

		m.addAttribute("blogs", blogs);

		return "myblogs";
	}

	public String deleteBlog(int id, HttpSession session, Model m) {

		User current_user = (User) session.getAttribute("user");

		try {

			Blog blog = blogDao.getBlog(id);

			if (blog == null) {
				throw new Exception("Blog not found");
			}

			if (blog.getUser().getId() != current_user.getId()) {
				throw new Exception("Unauthorized access");
			}

			blogDao.deleteBlog(blog);

			m.addAttribute("success", "Blog deleted successfully...");

		} catch (Exception e) {

			m.addAttribute("error", e.getMessage());

		}
		
		List<Blog> blogs = blogDao.getBlogsByUser(current_user);
		m.addAttribute("blogs", blogs);

		return "myblogs";
	}

	public String updatePage(int id, HttpSession session, Model m) {
		try {

			User current_user = (User) session.getAttribute("user");
			Blog blog = blogDao.getBlog(id);

			if (blog == null) {
				throw new Exception("Blog not found");
			}

			if (blog.getUser().getId() != current_user.getId()) {
				throw new Exception("Unauthorized access");
			}

			m.addAttribute("blog", blog);

		} catch (Exception e) {

			m.addAttribute("error", e.getMessage());

		}

		return "update_blog";
	}
	
	
	public String updateBlog(int id, BlogRequest blog, BindingResult result, Model m, HttpServletRequest request,
			HttpSession session) {
		

		User current_user = (User) session.getAttribute("user");
		Blog found_blog = blogDao.getBlog(id);

		try {
			
			if (found_blog == null) {
				throw new Exception("Blog not found");
			}

			if (found_blog.getUser().getId() != current_user.getId()) {
				throw new Exception("Unauthorized access");
			}
			
		}catch (Exception e) {
			
			List<Blog> blogs = blogDao.getBlogs();
			
			//if unauthorized or blog not found then send to myblogs & say blog not found or unauthorized access
			m.addAttribute("error", e.getMessage());
			m.addAttribute("blogs",blogs);
			return "myblogs";
		}
		

		if (result.hasErrors()) {
			Map<String, String> fieldErrors = new HashMap<>();
			for (FieldError error : result.getFieldErrors()) {
				fieldErrors.put(error.getField(), error.getDefaultMessage());
			}

			m.addAttribute("fieldErrors", fieldErrors);
			return "update_blog";
		}
		
		try {
			String fileName = found_blog.getThumbnail();
						
			if (blog.getThumbnail() != null && !blog.getThumbnail().isEmpty()) {

				String path = request.getServletContext().getRealPath("/uploads");

				// previous image will be replaced with new image as name is same
				path = path + File.separator + fileName;

				FileHandling.saveFile(blog.getThumbnail(), new ImageValidator(), path);
				
				System.out.println("File sved ========================= ========================================================");

			}
			
			found_blog.setTitle(blog.getTitle());
			found_blog.setContent(blog.getContent());
			found_blog.setDescription(blog.getDescription());
			
			blogDao.updateBlog(found_blog);
			
			m.addAttribute("blog",found_blog);
			m.addAttribute("success", "Your blog has been updated successfully");
			
			return "update_blog";
		} catch (Exception e) {
			m.addAttribute("blog", found_blog);
			e.printStackTrace();
			m.addAttribute("imgError", e.getMessage());
			return "update_blog";
		}
	}

}
