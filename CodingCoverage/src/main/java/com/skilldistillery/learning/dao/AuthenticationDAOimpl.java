package com.skilldistillery.learning.dao;

import javax.persistence.EntityManager;
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
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User getUserByUserName(User uncheckedUser) {
		
		String getUser = "SELECT u FROM User u WHERE u.username = :username";
		
		User foundUser = em.createQuery(getUser, User.class).setParameter("username", uncheckedUser.getUsername()).getSingleResult();
		
		return foundUser;
	}

	@Override
	public boolean isValidUser(User u) {
		// TODO Auto-generated method stub
		return false;
	}

}
