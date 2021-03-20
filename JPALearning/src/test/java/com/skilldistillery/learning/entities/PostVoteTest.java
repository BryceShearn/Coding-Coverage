package com.skilldistillery.learning.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class PostVoteTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private PostVote postVote;
	
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
		postVote = em.find(PostVote.class, 1);
		
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		postVote = null;
	}

	@Test
	@DisplayName("Test PostVote entity mapping")
	void test1() {
		assertNotNull(postVote);
		assertTrue(postVote.getVote());
	}
	
	@Test
	@DisplayName("Test PostVote ManyToOne post_id Relationship")
	void test2() {
		assertNotNull(postVote);
		assertEquals(1, postVote.getPost().getId());
	}

}
