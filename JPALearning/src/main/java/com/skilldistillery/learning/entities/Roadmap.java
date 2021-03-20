package com.skilldistillery.learning.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;

@Entity
public class Roadmap {


		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private int id;
		
		private String name;
		
		private String description;
		
		@OneToOne
		@JoinColumn(name = "language_id")
		private Language language;
		
		@ManyToMany(mappedBy = "roadmaps")
		private List<User> users;
		
		
		public Roadmap() {
			super();
		}

		
public Roadmap(int id, String name, String description, Language language, List<User> users) {
			super();
			this.id = id;
			this.name = name;
			this.description = description;
			this.language = language;
			this.users = users;
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


		public List<User> getUsers() {
			return users;
		}


		public void setUsers(List<User> users) {
			this.users = users;
		}


		public Language getLanguage() {
			return language;
		}


		public void setLanguage(Language language) {
			this.language = language;
		}


		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + ((description == null) ? 0 : description.hashCode());
			result = prime * result + id;
			result = prime * result + ((language == null) ? 0 : language.hashCode());
			result = prime * result + ((name == null) ? 0 : name.hashCode());
			result = prime * result + ((users == null) ? 0 : users.hashCode());
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
			if (language == null) {
				if (other.language != null)
					return false;
			} else if (!language.equals(other.language))
				return false;
			if (name == null) {
				if (other.name != null)
					return false;
			} else if (!name.equals(other.name))
				return false;
			if (users == null) {
				if (other.users != null)
					return false;
			} else if (!users.equals(other.users))
				return false;
			return true;
		}


		@Override
		public String toString() {
			StringBuilder builder = new StringBuilder();
			builder.append("Roadmap [id=").append(id).append(", name=").append(name).append(", description=")
					.append(description).append(", language=").append(language).append(", users=").append(users)
					.append("]");
			return builder.toString();
		}
}