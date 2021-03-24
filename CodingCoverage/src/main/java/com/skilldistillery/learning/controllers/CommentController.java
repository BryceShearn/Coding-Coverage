package com.skilldistillery.learning.controllers;

import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.learning.dao.CommentDAO;
import com.skilldistillery.learning.entities.Comment;

@Controller
public class CommentController {

	@Autowired
	private CommentDAO commentDao;
	
	@RequestMapping(path= "createComment.do", method= RequestMethod.POST)
	public String createComment(Model model, Comment comment) {
		
		comment.setDateCreated(LocalDateTime.now());
		comment.setDateUpdated(LocalDateTime.now());
		commentDao.createComment(comment);
		return "forms/ViewingForum";
	}
	
	@RequestMapping(path= "viewComment.do", params= "id")
	public String viewComment(Model model, HttpSession session, @RequestParam("id")Integer commentId) {
		model.addAttribute("comment", commentDao.findById(commentId));
		return "results/ViewComment";
	}
}
