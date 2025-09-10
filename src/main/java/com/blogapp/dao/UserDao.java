package com.blogapp.dao;

import java.util.List;

import com.blogapp.entities.User;

public interface UserDao {
	
	public User getUser(int id);
	
	public User getUserByEmail(String email);
	
	public List<User> getUsers();
	
	public void insert(User user);
	
	public void update(User user);
	
	public void delete(User user);
	
	public User findByEmailAndPassword(String email,String password);

}
