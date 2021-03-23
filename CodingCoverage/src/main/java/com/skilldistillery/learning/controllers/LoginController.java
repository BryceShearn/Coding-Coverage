package com.skilldistillery.learning.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.learning.dao.AuthenticationDAO;
import com.skilldistillery.learning.dao.UserDAO;
import com.skilldistillery.learning.entities.User;

@Controller 
public class LoginController {
	
	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private AuthenticationDAO authDao;
	
	@RequestMapping(path="login.do", method = RequestMethod.GET)
	public String login(Model model, User uncheckedUser, HttpSession session) {
		
		User storedUser = authDao.getUserByUserName(uncheckedUser);
		if (storedUser.getPassword().equals(uncheckedUser.getPassword())) {
			session.setAttribute("user", storedUser);
			return "results/ProfilePage";
		} else {
			
			return "home/LoginCreateAcc";
		}
	}
}
