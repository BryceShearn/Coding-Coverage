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

class TaskTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Task task;
	
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
		task = em.find(Task.class, 1);
		
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		task = null;
	}

	@Test
	@DisplayName("Test Task entity mapping")
	void test1() {
		assertNotNull(task);
		assertEquals("Complete Set Up", task.getName());
		assertEquals("Go read a java book", task.getDescription());
	}

	@Test
	@DisplayName("Test Task to Resource relationship")
	void test2() {
		assertNotNull(task);
		assertEquals("basic tutorial", task.getResources().get(0).getDescription());
		assertEquals("easy", task.getResources().get(0).getDifficulty());
	}
	
	@Test
	@DisplayName("Test Task ManyToOne codeConcept Relationship")
	void test3() {
		assertNotNull(task);
		assertEquals(1, task.getCodeConcept().getId());
	}

}
