package com.skilldistillery.learning.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.learning.entities.Language;
import com.skilldistillery.learning.entities.Resource;

@Service
@Transactional
public class ResourceDAOImpl implements ResourceDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<Resource> findAll() {
		List<Resource> resources = null;
		String jpql = "SELECT r FROM Resource r";
		resources = em.createQuery(jpql, Resource.class).getResultList();
		return resources;
	}

	@Override
	public List<Resource> filterByLanguageAndKeyword(String keyword, Integer languageId) {
		List<Resource> resources = null;
		keyword = "%" + keyword + "%";
		if (languageId < 1) {
			String keywordQuery = "SELECT r FROM Resource r WHERE r.description LIKE :keyword";
			resources = em.createQuery(keywordQuery, Resource.class).setParameter("keyword", keyword).getResultList();
			System.out.println(resources);
			return resources;
		}
		else {
			String languageKeywordQuery = "SELECT DISTINCT r FROM Resource r JOIN FETCH r.languages WHERE :language MEMBER OF r.languages AND r.description LIKE :keyword OR r.difficulty LIKE :keyword";
			Language language = em.find(Language.class, languageId);
			resources = em.createQuery(languageKeywordQuery, Resource.class).setParameter("keyword", keyword).setParameter("language", language).getResultList();
			System.out.println(resources);
			return resources;
		}
	}

}



