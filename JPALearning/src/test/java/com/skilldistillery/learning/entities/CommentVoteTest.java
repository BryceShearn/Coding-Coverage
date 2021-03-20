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

class CommentVoteTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private CommentVote commentVote;
	
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
		commentVote = em.find(CommentVote.class, 1);
	}
	
	@AfterEach
	void tearDown() throws Exception {
		em.close();
		commentVote = null;
	}
	
	@Test
	@DisplayName("Testing RoadMap Class Mappings")
	void test1() {
		assertNotNull(commentVote);
		assertEquals(1, commentVote.getId());
		assertTrue(commentVote.getVote());
		assertEquals(2, commentVote.getUserId());
	}
	
	@Test
	@DisplayName("Test PostVote ManyToOne post_id Relationship")
	void test2() {
		assertNotNull(commentVote);
		assertEquals(1, commentVote.getComment().getId());
	}
}
