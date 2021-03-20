package com.skilldistillery.learning.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class PostTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Post post;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("LearningPU");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		post = em.find(Post.class, 1);
		
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		post = null;
	}

	@Test
	@DisplayName("Test Post entity mapping")
	void test1() {
		assertNotNull(post);
		assertEquals("DB design", post.getSubject());
		assertEquals("DB design is an essential aspect of full stack applications", post.getContent());
		assertEquals("DB design is an essential aspect of full stack applications", post.getContent());
		assertTrue(post.getIsBlog());
		assertFalse(post.getIsForumVisable());
		assertFalse(post.getIsExpert());
		
	}


}
