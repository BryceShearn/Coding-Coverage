package com.skilldistillery.learning.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.learning.dao.RoadmapDAO;

@Controller
public class RoadmapController {
	
	@Autowired
	private RoadmapDAO mapDao;

	@RequestMapping(path="roadmap.do")
	public String displayRoadmap(Model model){
		
		return "results/RoadmapDisplay";
	}
}
