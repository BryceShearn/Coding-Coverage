package com.skilldistillery.learning.dao;

import com.skilldistillery.learning.entities.User;

public interface AuthenticationDAO {
	
	public boolean isUserNameUnique(String username);
	
	public User getUserByUserName(String username);
	
	public boolean isValidUser(User u);

}
