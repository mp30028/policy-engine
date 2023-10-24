package com.zonesoft.policyengine.api.repositories;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;
import java.util.Objects;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;

@TestMethodOrder(OrderAnnotation.class)
abstract class AbstractRepositoryTest<R extends JpaRepository<E,Long>, E> extends AbstractMySqlContainer{
	private static final Logger LOGGER = LoggerFactory.getLogger(AbstractRepositoryTest.class);
	
	private int expectedNoOfFindAllRecords;
	
	@Autowired R repository;
	
	public int getExpectedNoOfFindAllRecords() {
		return expectedNoOfFindAllRecords;
	}

	public void setExpectedNoOfFindAllRecords(int expectedNoOfFindAllRecords) {
		this.expectedNoOfFindAllRecords = expectedNoOfFindAllRecords;
	}

	@Test
	@Order(1)
	@DisplayName("Check test-container has been instantiated")	
	void testContainerIsCreated() {
		assertNotNull(MYSQL_CONTAINER);
		LOGGER.debug("FROM AbstractRepositoryTest.testContainerIsCreated: Test-Container was started on host={} and listening on port={}", MYSQL_CONTAINER.getHost(), MYSQL_CONTAINER.getFirstMappedPort());
	}
	
	
	@Test
	@Order(2)
	@DisplayName("Check repository gets autowired")
	void testRepoistoryIsWiredUp() {
		LOGGER.debug("FROM AbstractRepositoryTest.testRepoistoryIsWiredUp: repository-is-null = {}", Objects.isNull(repository));
		assertNotNull(repository);
	}
	
	
	@Test
	@Order(3)
	@DisplayName("Check connectivity to db via repository and fetch a few records and check the number returned is as expected")	
	void testFindAll() {		
		List<E> findAllResults = repository.findAll();
		assertEquals(expectedNoOfFindAllRecords, findAllResults.size());
		LOGGER.debug("FROM AbstractRepositoryTest.testFindAll: repository.findAll returned {} records", findAllResults.size());
		for (E result: findAllResults) {
			LOGGER.debug("FROM AbstractRepositoryTest.testFindAll: {} =  {}",result.getClass().getName(), result);
		}
	}
	
}
