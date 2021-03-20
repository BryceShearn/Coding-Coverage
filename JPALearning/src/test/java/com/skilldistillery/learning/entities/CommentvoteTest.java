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

class CommentvoteTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Commentvote commentvote;
	
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
		commentvote = em.find(Commentvote.class, 1);
	}
	
	@AfterEach
	void tearDown() throws Exception {
		em.close();
		commentvote = null;
	}
	
	@Test
	@DisplayName("Testing RoadMap Class Mappings")
	void test1() {
		assertNotNull(commentvote);
		assertEquals("", commentvote.getId());
		assertEquals("", commentvote.getDateVoted());
		assertEquals("", commentvote.getVote());
		assertEquals("", commentvote.getCommentId());
		assertEquals("", commentvote.getUserId());
	}
}
