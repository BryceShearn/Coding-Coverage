package com.skilldistillery.learning.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="comment_vote")
public class CommentVote {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	
	private Boolean vote;
	
	@Column(name = "date_voted")
	private LocalDateTime dateVoted;
	
	@Column(name = "comment_id")
	private int commentId;
	
	@Column(name = "user_id")
	private int userId;

	
	public CommentVote() {
		super();
	}

	
	public CommentVote(int id, Boolean vote, LocalDateTime dateVoted, int commentId, int userId) {
		super();
		this.id = id;
		this.vote = vote;
		this.dateVoted = dateVoted;
		this.commentId = commentId;
		this.userId = userId;
	}

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Boolean getVote() {
		return vote;
	}

	public void setVote(Boolean vote) {
		this.vote = vote;
	}

	public LocalDateTime getDateVoted() {
		return dateVoted;
	}

	public void setDateVoted(LocalDateTime dateVoted) {
		this.dateVoted = dateVoted;
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + commentId;
		result = prime * result + ((dateVoted == null) ? 0 : dateVoted.hashCode());
		result = prime * result + id;
		result = prime * result + userId;
		result = prime * result + ((vote == null) ? 0 : vote.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CommentVote other = (CommentVote) obj;
		if (commentId != other.commentId)
			return false;
		if (dateVoted == null) {
			if (other.dateVoted != null)
				return false;
		} else if (!dateVoted.equals(other.dateVoted))
			return false;
		if (id != other.id)
			return false;
		if (userId != other.userId)
			return false;
		if (vote == null) {
			if (other.vote != null)
				return false;
		} else if (!vote.equals(other.vote))
			return false;
		return true;
	}

	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Commentvote [id=").append(id).append(", vote=").append(vote).append(", dateVoted=")
				.append(dateVoted).append(", commentId=").append(commentId).append(", userId=").append(userId)
				.append("]");
		return builder.toString();
	}
}
