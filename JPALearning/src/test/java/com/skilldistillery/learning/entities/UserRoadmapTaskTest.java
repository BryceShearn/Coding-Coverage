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

class UserRoadmapTaskTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private UserRoadmapTask userroadmaptask;
	
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
		userroadmaptask = em.find(UserRoadmapTask.class, 1);
	}
	
	@AfterEach
	void tearDown() throws Exception {
		em.close();
		userroadmaptask = null;
	}
	
	@Test
	@DisplayName("Testing UserRoadmapTask Class Mappings")
	void test1() {
		assertNotNull(userroadmaptask);
		assertTrue(userroadmaptask.getCompleted());

	}
	
	@Test
	@DisplayName("Testing UserRoadmapTask to user relationship")
	void test2() {
		assertNotNull(userroadmaptask);
		assertEquals("Thomas",userroadmaptask.getUser().getFirstName());
		assertEquals("thwebel",userroadmaptask.getUser().getUsername());
		
	}
	
	@Test
	@DisplayName("Testing UserRoadmapTask to Test relationship")
	void test3() {
		assertNotNull(userroadmaptask);
		assertEquals("Complete Set Up", userroadmaptask.getTask().getName());
		assertEquals("Go read a java book",userroadmaptask.getTask().getDescription());
	}
}
