package com.skilldistillery.learning.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="code_concept")
public class CodeConcept {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@Column(name="roadmap_id")
	private Integer roadmapId;
	
	private String description;

public CodeConcept() {
	super();
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getDescription() {
	return description;
}

public void setDescription(String description) {
	this.description = description;
}

public Integer getRoadmapId() {
	return roadmapId;
}

public void setRoadmapId(Integer roadmapId) {
	this.roadmapId = roadmapId;
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
	CodeConcept other = (CodeConcept) obj;
	if (id != other.id)
		return false;
	return true;
}

@Override
public String toString() {
	return "Codeconcept [id=" + id + ", name=" + name + ", roadmapId=" + roadmapId + ", description=" + description
			+ "]";
}
	
	
	
	
}
