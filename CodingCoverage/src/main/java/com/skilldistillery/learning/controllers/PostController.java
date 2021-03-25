package com.skilldistillery.learning.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.learning.dao.LanguageDAO;
import com.skilldistillery.learning.dao.PostDAO;
import com.skilldistillery.learning.entities.Language;
import com.skilldistillery.learning.entities.Post;
import com.skilldistillery.learning.entities.User;

@Controller
public class PostController {
	
	@Autowired
	PostDAO postDAO;
	
	@Autowired
	LanguageDAO langDao;
	
//  redirect:ViewForum.do from createForumPost.do
	@RequestMapping(path="ViewForum.do")
	public String viewForum(Model model) {
		model.addAttribute("posts", postDAO.findAll());
		return "forms/ViewForum2";
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
	
	@RequestMapping(path="getForumPostForm.do")
	public String getForumPostForm(Model model, Post post) {
		
		return "forms/CreateForumPost";
	}
	// Create Forum Post
	@RequestMapping(path="createForumPost.do", method=RequestMethod.POST)
	public String createForumPost(Model model, @Valid Post post, Errors errors, HttpSession session, Integer langId) {
		
		if(errors.getErrorCount()>0) {
			return "forms/CreateForumPost";
		}
		
		User thisUser = (User)session.getAttribute("user");
		post.setUser(thisUser);
		
		Language lang = langDao.findById(langId);
		post.setLanguage(lang);
		
		
		postDAO.createPost(post);
		return "redirect:ViewForum.do";
	}
	
	
}
