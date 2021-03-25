package com.skilldistillery.learning.dao;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.learning.entities.User;
import com.skilldistillery.learning.entities.UserRoadmapTask;

@Service
@Transactional
public class UserRoadmapTaskDAOImpl implements UserRoadmapTaskDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public UserRoadmapTask findById(int urtId) {
		// TODO Auto-generated method stub
		return em.find(UserRoadmapTask.class, urtId);
	}

	@Override
	public List<UserRoadmapTask> findByUser(User user) {
		String getUsersPost = "SELECT urt FROM UserRoadmapTask urt WHERE p.user.id = :userId";
		
		int id = user.getId();
		
		List<UserRoadmapTask> urts = em.createQuery(getUsersPost, UserRoadmapTask.class)
				.setParameter("userID", id)
				.getResultList();
		
		return urts;
	}

	@Override
	public List<UserRoadmapTask> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserRoadmapTask createURT(UserRoadmapTask newUrt) {
		
		newUrt.setStartDate(LocalDateTime.now());
		newUrt.setEndDate(LocalDateTime.now());
		newUrt.setCompleted(true);
		
		em.persist(newUrt);
		em.flush();
		
		return newUrt;
	}

	@Override
	public UserRoadmapTask updateURT(UserRoadmapTask updatedUrt) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteURT(UserRoadmapTask targetUrt) {
		// TODO Auto-generated method stub
		return false;
	}

}
