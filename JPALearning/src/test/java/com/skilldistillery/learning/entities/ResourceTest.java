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

public class ResourceTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Resource resource;

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
			resource = em.find(Resource.class, 1);
		}

		@AfterEach
		void tearDown() throws Exception {
			em.close();
			resource = null;
		}

		@Test
		@DisplayName("Testing Resource Mappings")
		void test1() {
			assertNotNull(resource);
			assertEquals("https://www.tutorialspoint.com/java/java_environment_setup.htm", resource.getLink());
		}
		
		@Test
		@DisplayName("Test resource to language relationship")
		void test2() {
			assertNotNull(resource);
			assertEquals("Java", resource.getLanguages().get(0).getName());
			assertEquals("HTML", resource.getLanguages().get(1).getName());
		}
}
