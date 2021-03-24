package com.skilldistillery.learning.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.learning.dao.PostDAO;

@Controller
public class PostController {
	
	@Autowired
	PostDAO postDAO;
	
	@RequestMapping(path="ViewForum.do")
	public String viewForum(Model model) {
		model.addAttribute("post", postDAO.findAll());
		return "forms/ViewForum";
	}
	
	@RequestMapping(path="searchFilters.do", params= {"keyword", "language_id"})
	public String searchFilters(String keyword, @RequestParam("language_id")Integer languageId, Model model) {
		model.addAttribute("post", postDAO.filterByLanguageAndKeyword(keyword, languageId));
		return "forms/ViewForum";
	}
	
	@RequestMapping(path="ViewExpertForum.do")
	public String viewExpertForum(Model model) {
		model.addAttribute("post", postDAO.findAll());
		return "forms/ViewExpertForum";
	}
	
	@RequestMapping(path="searchFiltersExpertForum.do", params= {"keyword", "language_id"})
	public String searchFiltersExpertForum(String keyword, @RequestParam("language_id")Integer languageId, Model model) {
		model.addAttribute("post", postDAO.filterByLanguageAndKeyword(keyword, languageId));
		return "forms/ViewExpertForum"; 
	}
	
	@RequestMapping(path="viewForumPost.do", params= "id")
	public String viewForumPost(Model model, @RequestParam("id")Integer postId) {
		model.addAttribute("post", postDAO.viewPost(postId));
		return "results/ViewForumPost";
	}

	
}
