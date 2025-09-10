package com.blogapp.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blogapp.dao.UserDao;
import com.blogapp.entities.User;

import jakarta.transaction.Transactional;

@Repository("userDao")
@Transactional
public class UserDaoImpl implements UserDao {
	
	@Autowired
	SessionFactory factory;

	@Override
	public User getUser(int id) {
		User user = factory.getCurrentSession().find(User.class, id);
		return user;
	}

	@Override
	public List<User> getUsers() {
		List<User> users = factory.getCurrentSession().createQuery("FROM User",User.class).list();
		return users;
	}
	
	public User getUserByEmail(String email) {
		User user = factory.getCurrentSession().createQuery("FROM User where email= :email",User.class)
				.setParameter("email", email)
				.uniqueResultOptional().orElse(null);
		return user;
	}

	@Override
	public void insert(User user) {
		factory.getCurrentSession().persist(user);
	}

	@Override
	public void update(User user) {
		factory.getCurrentSession().merge(user);
		
	}

	@Override
	public void delete(User user) {
		factory.getCurrentSession().remove(user);
		
	}

	@Override
	public User findByEmailAndPassword(String email, String password) {
		
		User user = factory.getCurrentSession().createQuery("FROM User where email = :email AND password = :password",User.class)
		.setParameter("email", email)
		.setParameter("password", password)
		.uniqueResultOptional()
		.orElse(null);
		
		return user;
	}
	
}
