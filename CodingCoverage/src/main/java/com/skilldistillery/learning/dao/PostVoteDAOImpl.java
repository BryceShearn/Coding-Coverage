package com.skilldistillery.learning.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.learning.entities.PostVote;

@Service
@Transactional
public class PostVoteDAOImpl implements PostVoteDAO {
	
	@PersistenceContext
	private EntityManager em;

// create vote method
	@Override
	public PostVote createPostVote(PostVote newVote) {
		return null;
	}

// update vote method	
	@Override
	public PostVote updatePostVote(PostVote updatedVote) {
		return null;
	}

// delete vote method	
	@Override
	public boolean deletePostVote(PostVote targetVote) {
		return false;
	}
}
