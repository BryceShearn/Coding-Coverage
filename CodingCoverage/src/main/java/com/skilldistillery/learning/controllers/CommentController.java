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

import com.skilldistillery.learning.dao.AuthenticationDAO;
import com.skilldistillery.learning.dao.CommentDAO;
import com.skilldistillery.learning.dao.PostDAO;
import com.skilldistillery.learning.dao.UserDAO;
import com.skilldistillery.learning.entities.Comment;
import com.skilldistillery.learning.entities.Post;
import com.skilldistillery.learning.entities.User;

@Controller
public class CommentController {

	@Autowired
	private CommentDAO commentDao;
	@Autowired
	private UserDAO userDao;
	@Autowired
	private PostDAO postDao;
	@Autowired
	private AuthenticationDAO authDao;
	
	
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
	
	@RequestMapping(path="updateComment.do", params= {"commentId", "postId", "userId"})
	public String updateComment(Model model, Comment comment, Post post, Integer commentId, Integer postId, Integer userId, HttpSession session) {
		System.out.println(comment + "********888********************************");
		comment.setUser(userDao.findById(userId));
		comment.setPost(postDao.findById(postId));
		User thisUser = (User)session.getAttribute("user");
//		thisUser.removeComment(commentDao.findById(comment.getId()));
//		thisUser.addComment(comment);
		commentDao.updateComment(comment, commentId);
		session.setAttribute("user", authDao.getUserByUserName(thisUser));
		return "redirect:viewSessionUserComments.do";
	}
	
	@RequestMapping(path="deleteComment.do", params = {"commentId", "userId"} )
	public String deleteComment(Model mode, Comment targetComment, Post post, Integer commentId, Integer userId, HttpSession session) {
		commentDao.deleteComment(targetComment, commentId);
		session.setAttribute("user", userDao.findById(userId));
		return "redirect:viewSessionUserComments.do";
	}
	
	
}
