package com.skilldistillery.learning.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.skilldistillery.learning.entities.PostVote;

public class PostVoteDAOImpl implements PostVoteDAO {
	
	@PersistenceContext
	private EntityManager em;

// create vote method
	@Override
	public PostVote createPostVote(PostVote newVote) {
		return null;
	}
}
