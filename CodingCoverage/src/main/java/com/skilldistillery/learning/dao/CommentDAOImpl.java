package com.skilldistillery.learning.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.learning.entities.Comment;
import com.skilldistillery.learning.entities.User;

@Transactional
@Service
public class CommentDAOImpl implements CommentDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Comment findById(int commentId) {
		
		return em.find(Comment.class, commentId);
	}

	@Override
	public List<Comment> findByUser(User user) {
		String getUsersComments = "SELECT c FROM Comment c WHERE c.user.id = :userId";
		
		int id = user.getId();
		
		List<Comment> comments = em.createQuery(getUsersComments, Comment.class)
				.setParameter("userID", id)
				.getResultList();
		
		return comments;
	}

	@Override
	public List<Comment> findAll() {
		
		String getAllComment = "SELECT c FROM Comment c";

		List<Comment> allComments = em.createQuery(getAllComment, Comment.class).getResultList();

		return allComments;
	}

	@Override
	public Comment createComment(Comment newComment) {
		
		em.persist(newComment);
		em.flush();
		
		return newComment;
	}

	@Override
	public Comment updateComment(Comment updatedComment) {
		
		return em.merge(updatedComment);	
	}

	@Override
	public boolean deleteComment(Comment targetComment) {
		boolean deleted = false;

		if (targetComment != null) {
			em.remove(targetComment);
		}
		deleted = !em.contains(targetComment);

		return deleted;
	}

}
