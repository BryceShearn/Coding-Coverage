package com.skilldistillery.learning.dao;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.learning.entities.Comment;
import com.skilldistillery.learning.entities.CommentVote;
import com.skilldistillery.learning.entities.Post;
import com.skilldistillery.learning.entities.PostVote;
import com.skilldistillery.learning.entities.User;

@Transactional
@Service
public class CommentDAOImpl implements CommentDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Autowired
	PostDAO postDao;
	@Autowired
	UserDAO userDao;

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
	public Comment createComment(Comment newComment, Integer postId) {
		Post post = em.find(Post.class, postId);
		newComment.setPost(post);
		newComment.setDateCreated(LocalDateTime.now());
		newComment.setDateUpdated(LocalDateTime.now());
		
		
		
		em.persist(newComment);
		em.flush();
		
		return newComment;
	}

	@Override
	public Comment updateComment(Comment updatedComment, Integer id) {
		Comment comment = em.find(Comment.class, id);
		System.out.println("**********************************" + updatedComment);
		comment.setDateUpdated(LocalDateTime.now());
		System.out.println("**********************************" + updatedComment);
		comment.setContent(updatedComment.getContent());
		System.out.println(comment);
		List<PostVote> pList = comment.getPost().getPostVote();
		if (pList != null) {
			pList.size();
		}
		List<CommentVote> cList = comment.getCommentVote();
		if (cList != null) {
			cList.size();
		}
		System.out.println(cList + "******************************************************");
		return comment;	
	}

	@Override
	public boolean deleteComment(Comment targetComment, Integer commentId) {
		targetComment = em.find(Comment.class, commentId);
		boolean deleted = false;
		
		if (targetComment != null) {
			em.remove(targetComment);
		}
		deleted = !em.contains(targetComment);

		return deleted;
	}

}
