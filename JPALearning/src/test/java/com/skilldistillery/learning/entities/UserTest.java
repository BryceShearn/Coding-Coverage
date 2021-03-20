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

class UserTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;
	
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
		user = em.find(User.class, 2);
		
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	@DisplayName("Test User entity mapping")
	void test1() {
		assertNotNull(user);
		assertEquals("thwebel", user.getUsername());
		assertEquals("password", user.getPassword());
		assertEquals("Thomas", user.getFirstName());
		assertEquals("Webel", user.getLastName());
		assertTrue(user.getEnabled());
		
		
	}
	@Test
	@DisplayName("Test User to Comment Relationship")
	void test2() {
		assertNotNull(user);
		assertEquals("That is a ridiculous statement!", user.getComments().get(0).getContent());
	}
	@Test
	@DisplayName("Test User to Roadmap Relationship")
	void test3() {
		assertNotNull(user);
		assertEquals("Java Fundementals", user.getRoadmaps().get(0).getName());
		assertEquals("Fundementals of Java", user.getRoadmaps().get(0).getDescription());
	}
	@Test
	@DisplayName("Test User to UserRoadmapTask Relationship")
	void test4() {
		assertNotNull(user);
		assertTrue(user.getUserRoadmapTasks().get(0).getCompleted());
	}
	@Test
	@DisplayName("Test User to Post Relationship")
	void test5() {
		assertNotNull(user);
		assertEquals("DB design is an essential aspect of full stack applications",user.getPosts().get(0).getContent());
		assertEquals("DB design",user.getPosts().get(0).getSubject());
	}
	@Test
	@DisplayName("Test User to PostVote Relationship")
	void test6() {
		assertNotNull(user);
		assertTrue(user.getPostVotes().get(0).getVote());
		assertEquals("DB design is an essential aspect of full stack applications",user.getPostVotes().get(0).getPost().getContent());
	}

}
