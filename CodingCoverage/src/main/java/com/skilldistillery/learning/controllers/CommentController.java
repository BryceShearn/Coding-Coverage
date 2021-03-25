package com.skilldistillery.learning.controllers;

import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.annotation.SessionScope;

import com.skilldistillery.learning.dao.CommentDAO;
import com.skilldistillery.learning.entities.Comment;
import com.skilldistillery.learning.entities.Post;

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
	
	@RequestMapping(path= "showIndividualComment.do", params= "id")
	public String viewComment(Model model, @RequestParam("id")Integer commentId, Comment comment) {
		model.addAttribute("comment", commentDao.findById(commentId));
		return "forms/EditComment";
	}
	
	@RequestMapping(path="viewSessionUserComments.do")
	public String viewSessionUserComments(Model model) {
		return "results/ViewUserComments";
	}
	
	@RequestMapping(path="updateComment.do", params= {"id"})
	public String updateComment(Model model, Comment comment, Post post) {
		commentDao.updateComment(comment);
		return "redirect:viewSessionUserComments.do";
	}
	
	
}
