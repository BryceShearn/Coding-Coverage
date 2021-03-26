package com.skilldistillery.learning.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.learning.dao.UserDAO;
import com.skilldistillery.learning.dao.UserRoadmapTaskDAO;
import com.skilldistillery.learning.entities.User;
import com.skilldistillery.learning.entities.UserRoadmapTask;

@Controller 
public class UserController {
	
	@Autowired 
	private UserDAO dao;
	
	@Autowired
	private UserRoadmapTaskDAO urtDao;
	
	@RequestMapping(path="logout.do")
	public String logout(HttpSession session) {
		
		session.removeAttribute("user");
		
		return "home/LoginCreateAcc";
	}
	
	@RequestMapping(path="completedTask.do", method= RequestMethod.POST)
	public String completeTask(Model model, Integer taskId, HttpSession session) {
		UserRoadmapTask urt = new UserRoadmapTask();
		
		User thisUser = (User)session.getAttribute("user");
		urt.setUser(thisUser);
		
		urtDao.createURT(urt, taskId);
		
		return "redirect:backToMaps.do";
	}
	
	@RequestMapping(path="backToMaps.do", method= RequestMethod.GET)
	public String completeTask() {
		
		
		return "results/RoadmapDisplay";
	}
}
