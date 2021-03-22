package com.skilldistillery.learning.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.skilldistillery.learning.entities.Language;
import com.skilldistillery.learning.entities.Resource;

@SpringBootTest
class ResourceDAOTest {

	@Autowired
	ResourceDAO resourceDAO;	

	@Test
	@DisplayName("Test searching resource by keyword/filter by language")
	void test() {
		Language lang = new Language();
		lang.setName("Java");
		lang.setId(1);
		List<Resource> resources = resourceDAO.filterByLanguageAndKeyword("basic", lang);
		assertNotNull(resources);
		assertTrue(resources.size() > 0);
		assertEquals("easy", resources.get(0).getDifficulty());
	}
	
	@Test
	@DisplayName("Test display all resources")
	void test2() {
		List<Resource> resources = resourceDAO.findAll();
		assertEquals(1, resources.get(0).getId());
		assertEquals("easy", resources.get(0).getDifficulty());
	}

}
