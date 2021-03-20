package com.skilldistillery.learning.entities;

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
public class Roadmap {


		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private int id;
		
		private String name;
		
		private String description;
		
		@Column(name = "language_id")
		private int languageId;
		
		@ManyToMany(mappedBy = "roadmaps")
		private List<User> users;

		
		public Roadmap() {
			super();
		}

		
		public Roadmap(int id, String name, String description, int languageId) {
			super();
			this.id = id;
			this.name = name;
			this.description = description;
			this.languageId = languageId;
		}
		
// Add / Remove User
		public void addUser (User user) {
			if(users == null) { 
				users = new ArrayList<>();
			}
			if(!users.contains(user)) {
				users.add(user);
				user.addRoadmap(this);
			}
		}
		
		public void removeUser(User user) {
			if(users != null && users.contains(user)) {
				users.remove(user);
				user.removeRoadmap(this);
			}
		}

// Get / Set 
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

		public int getLanguageId() {
			return languageId;
		}

		public void setLanguageId(int languageId) {
			this.languageId = languageId;
		}


		public List<User> getUsers() {
			return users;
		}


		public void setUsers(List<User> users) {
			this.users = users;
		}


		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + ((description == null) ? 0 : description.hashCode());
			result = prime * result + id;
			result = prime * result + languageId;
			result = prime * result + ((name == null) ? 0 : name.hashCode());
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
			Roadmap other = (Roadmap) obj;
			if (description == null) {
				if (other.description != null)
					return false;
			} else if (!description.equals(other.description))
				return false;
			if (id != other.id)
				return false;
			if (languageId != other.languageId)
				return false;
			if (name == null) {
				if (other.name != null)
					return false;
			} else if (!name.equals(other.name))
				return false;
			return true;
		}


		@Override
		public String toString() {
			StringBuilder builder = new StringBuilder();
			builder.append("Roadmap [id=").append(id).append(", name=").append(name).append(", description=")
					.append(description).append(", languageId=").append(languageId).append("]");
			return builder.toString();
		}
}