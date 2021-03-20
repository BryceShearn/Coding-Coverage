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

public class CodeConceptTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private CodeConcept codeConcept;

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
		codeConcept = em.find(CodeConcept.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		codeConcept = null;
	}

	@Test
	@DisplayName("Testing Codeconcept Mappings")
	void test1() {
		assertNotNull(codeConcept);
		assertEquals("Java Setup", codeConcept.getName());
	}
	
	@Test
	@DisplayName("Test CodeConcept OneToMany task Relationship")
	void test4() {
		assertNotNull(codeConcept);
		assertEquals("Complete Set Up", codeConcept.getTask().get(0).getName());
		
	}
}