package com.skilldistillery.learning.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.learning.dao.AuthenticationDAO;
import com.skilldistillery.learning.dao.UserDAO;
import com.skilldistillery.learning.entities.User;

@Controller
public class RegistrationController {

	@Autowired
	private UserDAO userDao;

	@Autowired
	private AuthenticationDAO authDao;

	@RequestMapping(path = "createAccountForm.do", method = RequestMethod.GET)
	public ModelAndView createAccountPage() {
		ModelAndView mv = new ModelAndView();
		User u = new User();

		mv.addObject("user", u);
		mv.setViewName("forms/CreateAccount");

		return mv;
	}

	@RequestMapping(path = "createAccount.do", method = RequestMethod.POST)
	public String createAccount(@Valid User user, Errors errors, HttpSession session) {
		if (errors.hasErrors()) {
			return "forms/CreateAccount";
		}
		if (!authDao.isUserNameUnique(user.getUsername())) {
			errors.rejectValue("username", "error.username", "Usename already in use!");
			return "forms/CreateAccount";
		}
		userDao.createUser(user);
		session.setAttribute("user", user);

		return "results/ProfilePage";
	}
}
