package com.skilldistillery.learning.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Comment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String content;
	
	@Column(name="date_created")
	private LocalDateTime dateCreated;

	@Column(name="date_updated")
	private LocalDateTime dateUpdated;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	//TODO post_id Post obj relation 
	
	@ManyToOne
	@JoinColumn(name="post_id")
	private Post post;
	
	@OneToMany(mappedBy="comment")
	private List<CommentVote> commentVote;
	
	public Comment() {
		super();
	}
	
	public void addCommentVote(CommentVote vote) {
		if(commentVote == null) commentVote = new ArrayList<>();
		
		if (!commentVote.contains(vote)) {
			commentVote.add(vote);
			if (vote.getComment() != null) {
				vote.getComment().getCommentVote().remove(vote);
			}
			vote.setComment(this);
		}
	}
	
	public void removeCommentVote(CommentVote vote) {
		vote.setComment(null);
		if (commentVote != null) {
			commentVote.remove(vote);
		}
	}

	public Comment(int id, String content, LocalDateTime dateCreated, LocalDateTime dateUpdated, User user, Post post,
			List<CommentVote> commentVote) {
		super();
		this.id = id;
		this.content = content;
		this.dateCreated = dateCreated;
		this.dateUpdated = dateUpdated;
		this.user = user;
		this.post = post;
		this.commentVote = commentVote;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDateTime getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(LocalDateTime dateCreated) {
		this.dateCreated = dateCreated;
	}

	public LocalDateTime getDateUpdated() {
		return dateUpdated;
	}

	public void setDateUpdated(LocalDateTime dateUpdated) {
		this.dateUpdated = dateUpdated;
	}
	

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<CommentVote> getCommentVote() {
		return commentVote;
	}

	public void setCommentVote(List<CommentVote> commentVote) {
		this.commentVote = commentVote;
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
		Comment other = (Comment) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", content=" + content + ", dateCreated=" + dateCreated + ", dateUpdated="
				+ dateUpdated + ", user=" + user + ", post=" + post + ", commentVote=" + commentVote + "]";
	}
	
}
