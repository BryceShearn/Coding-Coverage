package com.skilldistillery.learning.dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.learning.entities.CodeConcept;
import com.skilldistillery.learning.entities.Comment;
import com.skilldistillery.learning.entities.Post;
import com.skilldistillery.learning.entities.Resource;
import com.skilldistillery.learning.entities.Roadmap;
import com.skilldistillery.learning.entities.Task;
import com.skilldistillery.learning.entities.User;

@Service
@Transactional 
public class AuthenticationDAOimpl implements AuthenticationDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public boolean isUserNameUnique(String username) {
		String count = "SELECT COUNT(u) FROM User u WHERE u.username = :username";
		Long numUsers = em.createQuery(count, Long.class).setParameter("username", username).getSingleResult(); 
		if (numUsers > 0) {
			return false;
		} else { 
			return true;
		}
	}

	@Override
	public User getUserByUserName(User uncheckedUser) {
		
		String getUser = "SELECT u FROM User u WHERE u.username = :username";
		User foundUser =  null;
		
		try {
			foundUser = em.createQuery(getUser, User.class).setParameter("username", uncheckedUser.getUsername()).getSingleResult();	
		}catch (NoResultException e) {
			return null;
		}
		
		if(foundUser.getComments()!= null) {
			foundUser.getComments().size();
		}
		
		if(foundUser.getRoadmaps()!= null) {
			foundUser.getRoadmaps().size();
		}
		
		if(foundUser.getUserRoadmapTasks()!= null) {
			foundUser.getUserRoadmapTasks().size();
		}
		
		if(foundUser.getPosts()!= null) {
			for (Post post : foundUser.getPosts()) {
				if(post.getPostVote() != null) {
					post.getPostVote().size();
				}
			}
		}
		
		if(foundUser.getComments()!= null) {
			for (Comment comment : foundUser.getComments()) {
				if(comment.getCommentVote() != null) {
					comment.getCommentVote().size();
				}
			}
		}
		// load Rm -> CC -> T -> Re Lists 
		for (Roadmap map : foundUser.getRoadmaps()) {
			for (CodeConcept concept : map.getCodeConcepts()) {
				for (Task task : concept.getTask()) {
					task.getResources().size();
				}
			}
		}
		
		return foundUser;
	}

	@Override
	public boolean isValidUser(User u) {
		// TODO Auto-generated method stub
		return false;
	}

}
