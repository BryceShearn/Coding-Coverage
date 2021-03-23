package com.skilldistillery.learning.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
	
	@Column(name = "user_id")
	private int userId;
	
	@ManyToOne
	@JoinColumn(name="comment_id")
	private Comment comment;

	
	public CommentVote() {
		super();
	}

	public CommentVote(int id, Boolean vote, LocalDateTime dateVoted, int userId, Comment comment) {
		super();
		this.id = id;
		this.vote = vote;
		this.dateVoted = dateVoted;
		this.userId = userId;
		this.comment = comment;
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

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
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
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "CommentVote [id=" + id + ", vote=" + vote + ", dateVoted=" + dateVoted + "]";
	}

}
