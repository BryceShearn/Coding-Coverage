package com.skilldistillery.learning.dao;

import com.skilldistillery.learning.entities.PostVote;

public interface PostVoteDAO {

	PostVote createPostVote(PostVote newVote);

	PostVote updatePostVote(PostVote updatedVote);

	boolean deletePostVote(PostVote targetVote);
}