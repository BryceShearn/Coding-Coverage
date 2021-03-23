package com.skilldistillery.learning.dao;

import com.skilldistillery.learning.entities.User;

public interface AuthenticationDAO {
	
	public boolean isUserNameUnique(String username);
	
	public User getUserByUserName(User uncheckedUser);
	
	public boolean isValidUser(User u);

}
