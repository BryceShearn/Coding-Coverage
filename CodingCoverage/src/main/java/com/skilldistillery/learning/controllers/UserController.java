package com.skilldistillery.learning.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.learning.dao.UserDAO;

@Controller 
public class UserController {
	
	@Autowired 
	private UserDAO dao;
	
	
	public String login() {
		
		return null;
	}

}
