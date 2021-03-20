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
public class Post {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String subject;
	
	private String content;
	
	@Column(name="date_created")
	private LocalDateTime dateCreated;
	
	@Column(name="last_update")
	private LocalDateTime lastUpdate;
	
	// TODO user_id add user obj relation
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
	
	// Methods
	
	public Post() {
		super();
	}

	public Post(int id, String subject, String content, LocalDateTime dateCreated, LocalDateTime lastUpdate,
			List<Comment> comments, Boolean isBlog, Boolean isForumVisable, Boolean isExpert, Language language) {
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

	@Override
	public String toString() {
		return "Post [id=" + id + ", subject=" + subject + ", content=" + content + ", dateCreated=" + dateCreated
				+ ", lastUpdate=" + lastUpdate + ", comments=" + comments + ", isBlog=" + isBlog + ", isForumVisable="
				+ isForumVisable + ", isExpert=" + isExpert + ", language=" + language + "]";
	}
	
}
