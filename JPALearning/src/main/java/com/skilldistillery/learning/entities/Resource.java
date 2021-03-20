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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Resource {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String link;
	
	private String description;
	
	private String difficulty;
	
	@Column(name="date_added")
	private LocalDateTime dateAdded;

	@ManyToMany
	@JoinTable(name = "resource_has_language", joinColumns =
	@JoinColumn(name = "resource_id"), inverseJoinColumns =
	@JoinColumn(name = "language_id"))
	private List<Language> languages;
	
// Methods
	
	public Resource() {
		super();
	}
	
// Add / Remove Language
	public void addLanguage (Language language) {
		if(languages == null) { 
			languages = new ArrayList<>();
		}
		if(!languages.contains(language)) {
			languages.add(language);
		}
	}
	
	public void removeLanguage(Language language) {
		if(languages != null && languages.contains(language)) {
			languages.remove(language);
		}
	}
	
// Get / Set
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDateTime getDateAdded() {
		return dateAdded;
	}

	public void setDateAdded(LocalDateTime dateAdded) {
		this.dateAdded = dateAdded;
	}

	public String getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}

	public List<Language> getLanguages() {
		return languages;
	}

	public void setLanguages(List<Language> languages) {
		this.languages = languages;
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
		Resource other = (Resource) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Resource [id=" + id + ", link=" + link + ", description=" + description + ", dateAdded=" + dateAdded
				+ ", difficulty=" + difficulty + "]";
	}
	
	
}	
	