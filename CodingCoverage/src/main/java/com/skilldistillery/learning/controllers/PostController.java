package com.skilldistillery.learning.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.learning.dao.PostDAO;

@Controller
public class PostController {
	
	@Autowired
	PostDAO postDAO;
	
	@RequestMapping(path="ViewForum.do")
	public String viewForum(Model model) {
		return "forms/ViewForum";
	}
	
}
