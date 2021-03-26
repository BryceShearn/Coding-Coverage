package com.skilldistillery.learning.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.learning.entities.CodeConcept;
import com.skilldistillery.learning.entities.Comment;
import com.skilldistillery.learning.entities.Post;
import com.skilldistillery.learning.entities.Roadmap;
import com.skilldistillery.learning.entities.Task;
import com.skilldistillery.learning.entities.User;

@Service
@Transactional
public class UserDaoJpaImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int userId) {

		User foundUser = em.find(User.class, userId);
		
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
				if(post.getComments() != null) {
					post.getComments().size();
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
	public List<User> findAll() {
		String getAllUsers = "SELECT u FROM User u";

		List<User> allUsers = em.createQuery(getAllUsers, User.class).getResultList();

		return allUsers;
	}

	// Create
	@Override
	public User createUser(User newUser) {
		em.persist(newUser);
		em.flush();

		return newUser;
	}

	// Update
	@Override
	public User updateUser(User updatedUser) {

		return em.merge(updatedUser);
	}

	// Deleted
	@Override
	public boolean deleteUser(User targetUser) {
		boolean deleted = false;

		if (targetUser != null) {
			em.remove(targetUser);
		}
		deleted = !em.contains(targetUser);

		return deleted;
	}
	
	// archive 
	@Override
	public boolean archiveUser(User targetUser) {
		User tempUser = null;
		targetUser.setEnabled(false);
		tempUser = em.merge(targetUser);
		
		if (tempUser.getEnabled()) {
			return false;
		}
		
		return true;
	}


}
