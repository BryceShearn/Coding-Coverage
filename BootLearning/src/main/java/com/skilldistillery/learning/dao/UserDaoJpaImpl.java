package com.skilldistillery.learning.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.learning.entities.User;

@Service
@Transactional
public class UserDaoJpaImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public User findById(int userId) {
		// TODO Auto-generated method stub
		return em.find(User.class, userId);
	}

}
