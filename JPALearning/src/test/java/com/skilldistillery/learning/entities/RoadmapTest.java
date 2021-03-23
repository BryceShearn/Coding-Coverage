package com.skilldistillery.learning.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class RoadmapTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Roadmap roadmap;
	
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
		roadmap = em.find(Roadmap.class, 1);
	}
	
	@AfterEach
	void tearDown() throws Exception {
		em.close();
		roadmap = null;
	}
	
	@Test
	@DisplayName("Testing Roadmap Class Mappings")
	void test1() {
		assertNotNull(roadmap);
		assertEquals("Java Fundementals", roadmap.getName());
		assertEquals("Learn the fundemental aspect of Java! This roadmap will guide you through your first Java program while establishing key concepts along the way.", roadmap.getDescription());
	}
	@Test
	@DisplayName("Testing Roadmap to User relationship")
	void test2() {
		assertNotNull(roadmap);
		assertEquals("Thomas", roadmap.getUsers().get(0).getFirstName());
		assertEquals("thwebel", roadmap.getUsers().get(0).getUsername());
	}
	@Test
	@DisplayName("Testing Roadmap to language relationship")
	void test3() {
		assertNotNull(roadmap);
		assertEquals("Java", roadmap.getLanguage().getName());
	}
	@Test
	@DisplayName("Testing Roadmap to language relationship")
	void test4() {
		assertNotNull(roadmap);
		assertEquals("Java Setup and First Steps", roadmap.getCodeConcepts().get(0).getName());
		assertEquals("Description: Setup your coding environment and download necessary dependencies, i.e. make sure your tire has wheels before trying to drive.", roadmap.getCodeConcepts().get(0).getDescription());
	}
}
