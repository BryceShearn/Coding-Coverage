package com.skilldistillery.learning.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.learning.dao.UserDAO;
import com.skilldistillery.learning.dao.UserRoadmapTaskDAO;

@Controller 
public class UserController {
	
	@Autowired 
	private UserDAO dao;
	
	@Autowired
	private UserRoadmapTaskDAO urtDao;
	
	@RequestMapping(path="completedTask.do", method= RequestMethod.POST)
	public String completeTask(Model model, Integer taskId, HttpSession session) {
		
		
		return "redirect:backToMaps.do";
	}
	
	
	@RequestMapping(path="backToMaps.do", method= RequestMethod.GET)
	public String completeTask() {
		
		
		return "results/RoadmapDisplay";
	}
}
