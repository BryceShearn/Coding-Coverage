package com.skilldistillery.learning.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

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
	
	@Column(name="is_blog")
	private Boolean isBlog;
	
	@Column(name="is_forum_visable")
	private Boolean isForumVisable;
	
	@Column(name="is_expert")
	private Boolean isExpert;
	
	public Post() {
		super();
	}

	public Post(int id, String subject, String content, LocalDateTime dateCreated, LocalDateTime lastUpdate,
			Boolean isBlog, Boolean isForumVisable, Boolean isExpert) {
		super();
		this.id = id;
		this.subject = subject;
		this.content = content;
		this.dateCreated = dateCreated;
		this.lastUpdate = lastUpdate;
		this.isBlog = isBlog;
		this.isForumVisable = isForumVisable;
		this.isExpert = isExpert;
	}

	public int getId() {
		return id;
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Post [id=").append(id).append(", subject=").append(subject).append(", content=").append(content)
				.append(", dateCreated=").append(dateCreated).append(", lastUpdate=").append(lastUpdate)
				.append(", isBlog=").append(isBlog).append(", isForumVisable=").append(isForumVisable)
				.append(", isExpert=").append(isExpert).append("]");
		return builder.toString();
	}
	
	
	
}
