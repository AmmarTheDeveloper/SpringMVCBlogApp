package com.blogapp.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blogapp.dao.BlogDao;
import com.blogapp.entities.Blog;
import com.blogapp.entities.User;

import jakarta.transaction.Transactional;

@Repository
@Transactional
public class BlogDaoImpl implements BlogDao {
	
	@Autowired
	SessionFactory factory;
	
	public  List<Blog> getBlogsByUser(User user) {
		List<Blog> blogs = factory.getCurrentSession().createQuery("FROM Blog where user = :user",Blog.class)
				.setParameter("user", user).list();
		return blogs;
	}

	@Override
	public List<Blog> getBlogs() {
		List<Blog> blogs = factory.getCurrentSession().createQuery("FROM Blog",Blog.class).list();
		return blogs;
	}

	@Override
	public Blog getBlog(int id) {
		Blog blog = factory.getCurrentSession().find(Blog.class, id);
		return blog;
	}

	@Override
	public void insertBlog(Blog blog) {
		factory.getCurrentSession().persist(blog);
	}

	@Override
	public void updateBlog(Blog blog) {
		factory.getCurrentSession().merge(blog);
		
	}

	@Override
	public void deleteBlog(Blog blog) {
		factory.getCurrentSession().remove(blog);
		
	}


}
