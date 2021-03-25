package com.skilldistillery.learning.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.learning.entities.Language;

@Service
@Transactional
public class LanguageDAOImpl implements LanguageDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Language findById(int id) {
		
		return em.find(Language.class, id);
	}

}
