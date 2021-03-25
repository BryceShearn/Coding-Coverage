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
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
public class Post {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@NotBlank 
	@Size(min=20, max=400, message="Subject must be between 20 to 400 characters")
	private String subject;
	
	@NotBlank
	@Size(min=20, max=20000, message="Content must be more than 20 characters")
	private String content;
	
	@Column(name="date_created")
	private LocalDateTime dateCreated;
	
	@Column(name="last_update")
	private LocalDateTime lastUpdate;
	
	@OneToMany(mappedBy="post")
	private List<Comment> comments;

	@Column(name="is_blog")
	private Boolean isBlog;
	
	@Column(name="is_forum_visable")
	private Boolean isForumVisable;
	
	@Column(name="is_expert")
	private Boolean isExpert;
	
	@ManyToOne
	@JoinColumn(name="language_id")
	private Language language;
	
	@OneToMany(mappedBy="post")
	private List<PostVote> postVote;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	// Methods
	
	public Post() {
		super();
	}
	
	public Post(int id, String subject, String content, LocalDateTime dateCreated, LocalDateTime lastUpdate,
			List<Comment> comments, Boolean isBlog, Boolean isForumVisable, Boolean isExpert, Language language,
			List<PostVote> postVote) {
		super();
		this.id = id;
		this.subject = subject;
		this.content = content;
		this.dateCreated = dateCreated;
		this.lastUpdate = lastUpdate;
		this.comments = comments;
		this.isBlog = isBlog;
		this.isForumVisable = isForumVisable;
		this.isExpert = isExpert;
		this.language = language;
		this.postVote = postVote;
	}

	public int getId() {
		return id;
	}
	
	public void addComment(Comment comment) {
		if(comments == null) comments = new ArrayList<>();
		
		if (!comments.contains(comment)) {
			comments.add(comment);
			if (comment.getPost() != null) {
				comment.getPost().getComments().remove(comment);
			}
			comment.setPost(this);
		}
	}
	
	public void removeComment(Comment comment) {
		comment.setPost(null);
		if (comments != null) {
			comments.remove(comment);
		}
	}
	
	public void addPostVote(PostVote vote) {
		if(postVote == null) postVote = new ArrayList<>();
		
		if (!postVote.contains(vote)) {
			postVote.add(vote);
			if (vote.getPost() != null) {
				vote.getPost().getPostVote().remove(vote);
			}
			vote.setPost(this);
		}
	}
	
	public void removePostVote(PostVote vote) {
		vote.setPost(null);
		if (postVote != null) {
			postVote.remove(vote);
		}
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
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

	public LocalDateTime getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(LocalDateTime lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public Boolean getIsBlog() {
		return isBlog;
	}

	public void setIsBlog(Boolean isBlog) {
		this.isBlog = isBlog;
	}

	public Boolean getIsForumVisable() {
		return isForumVisable;
	}

	public void setIsForumVisable(Boolean isForumVisable) {
		this.isForumVisable = isForumVisable;
	}

	public Boolean getIsExpert() {
		return isExpert;
	}

	public void setIsExpert(Boolean isExpert) {
		this.isExpert = isExpert;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public Language getLanguage() {
		return language;
	}

	public void setLanguage(Language language) {
		this.language = language;
	}

	public List<PostVote> getPostVote() {
		return postVote;
	}

	public void setPostVote(List<PostVote> postVote) {
		this.postVote = postVote;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Post [id=" + id + ", subject=" + subject + ", content=" + content + ", dateCreated=" + dateCreated
				+ ", lastUpdate=" + lastUpdate + ", isBlog=" + isBlog + ", isForumVisable=" + isForumVisable
				+ ", isExpert=" + isExpert + "]";
	}
	
}
