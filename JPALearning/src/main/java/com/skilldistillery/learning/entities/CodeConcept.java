package com.skilldistillery.learning.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "code_concept")
public class CodeConcept {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private String description;

	@ManyToOne
	@JoinColumn(name = "roadmap_id")
	private Roadmap roadmap;
	
	@OneToMany(mappedBy="codeConcept")
	private List<Task> task;
	
	
	public CodeConcept() {
		super();
	}
	
	public CodeConcept(int id, String name, String description, Roadmap roadmap, List<Task> task) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.roadmap = roadmap;
		this.task = task;
	}

	public void addTask(Task taskStub) {
		if(task == null) task = new ArrayList<>();
		
		if (!task.contains(taskStub)) {
			task.add(taskStub);
			if (taskStub.getCodeConcept() != null) {
				taskStub.getCodeConcept().getTask().remove(taskStub);
			}
			taskStub.setCodeConcept(this);
		}
	}
	
	public void removeTask(Task taskStub) {
		taskStub.setCodeConcept(null);
		if (task != null) {
			task.remove(taskStub);
		}
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

	public Roadmap getRoadmap() {
		return roadmap;
	}

	public void setRoadmap(Roadmap roadmap) {
		this.roadmap = roadmap;
	}

	public List<Task> getTask() {
		return task;
	}

	public void setTask(List<Task> task) {
		this.task = task;
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
		return "CodeConcept [id=" + id + ", name=" + name + ", description=" + description + "]";
	}

}
