package com.skilldistillery.learning.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.learning.entities.Roadmap;

@Service
@Transactional
public class RoadmapDAOimpl implements RoadmapDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Roadmap findRoadmapById(int id) {
		
		return em.find(Roadmap.class, id);
	}
}
