package com.skilldistillery.learning.dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.learning.entities.User;

@Service
@Transactional 
public class AuthenticationDAOimpl implements AuthenticationDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public boolean isUserNameUnique(String username) {
		String count = "SELECT COUNT(u) FROM User u WHERE u.username = :username";
		Long numUsers = em.createQuery(count, Long.class).setParameter("username", username).getSingleResult(); 
		if (numUsers > 0) {
			return false;
		} else { 
			return true;
		}
	}

	@Override
	public User getUserByUserName(User uncheckedUser) {
		
		String getUser = "SELECT u FROM User u WHERE u.username = :username";
		User foundUser =  null;
		try {
			foundUser = em.createQuery(getUser, User.class).setParameter("username", uncheckedUser.getUsername()).getSingleResult();	
		}catch (NoResultException e) {
			return null;
		}
		
		foundUser.getComments().size();
		foundUser.getRoadmaps().size();
		foundUser.getUserRoadmapTasks().size();
		foundUser.getPosts().size();
		return foundUser;
	}

	@Override
	public boolean isValidUser(User u) {
		// TODO Auto-generated method stub
		return false;
	}

}
