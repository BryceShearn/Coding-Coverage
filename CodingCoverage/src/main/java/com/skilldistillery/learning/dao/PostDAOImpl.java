package com.skilldistillery.learning.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.skilldistillery.learning.entities.Post;
import com.skilldistillery.learning.entities.User;

public class PostDAOImpl implements PostDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Post findById(int postId) {
		return em.find(Post.class, postId);
	}

	@Override
	public List<Post> findByUser(User user) {
		String getUsersPost = "SELECT p FROM Post p WHERE p.user.id = :userId";
		
		int id = user.getId();
		
		List<Post> comments = em.createQuery(getUsersPost, Post.class)
				.setParameter("userID", id)
				.getResultList();
		
		return comments;
	}

	@Override
	public List<Post> findAll() {
		String getAllPost = "SELECT p FROM Post p";

		List<Post> allPosts = em.createQuery(getAllPost, Post.class).getResultList();

		return allPosts;
	}

	@Override
	public Post createPost(Post newPost) {
		
		em.persist(newPost);
		em.flush();
		
		return newPost;
	}

	@Override
	public Post updatePost(Post updatedPost) {
		
		return em.merge(updatedPost);
	}

	@Override
	public boolean deletePost(Post targetPost) {
		boolean deleted = false;

		if (targetPost != null) {
			em.remove(targetPost);
		}
		deleted = !em.contains(targetPost);

		return deleted;
	}

}
