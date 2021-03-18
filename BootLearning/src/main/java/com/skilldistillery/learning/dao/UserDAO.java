package com.skilldistillery.learning.dao;

import com.skilldistillery.learning.entities.User;

public interface UserDAO {
	
	User findById(int userId);
}
