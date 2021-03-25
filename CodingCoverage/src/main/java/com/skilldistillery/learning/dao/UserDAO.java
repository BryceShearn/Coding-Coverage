package com.skilldistillery.learning.dao;

import java.util.List;

import com.skilldistillery.learning.entities.User;

public interface UserDAO {
	
	User findById(int userId);
	
	List<User> findAll();
	
	User createUser(User newUser);
	
	User updateUser(User updatedUser);
	
	boolean deleteUser(User targetUser);
	
	boolean archiveUser(User targetUser);
	
	
	
}
