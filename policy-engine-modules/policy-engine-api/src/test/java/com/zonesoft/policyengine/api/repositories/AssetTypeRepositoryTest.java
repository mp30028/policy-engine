package com.zonesoft.policyengine.api.repositories;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.zonesoft.policyengine.api.entities.AssetType;

@SpringBootTest
@TestMethodOrder(OrderAnnotation.class)
class AssetTypeRepositoryTest extends AbstractMySqlContainer{
	private static final Logger LOGGER = LoggerFactory.getLogger(AssetTypeRepositoryTest.class);

	@Autowired AssetTypeRepository repository;
	
	@Test
	@Order(1)
	@DisplayName("Check test-container has been instantiated")	
	void testContainerIsCreated() {
		assertNotNull(MYSQL_CONTAINER);
		LOGGER.debug("FROM AssetTypeRepositoryTest.testContainerIsCreated: Test-Container was started on host={} and listening on port={}", MYSQL_CONTAINER.getHost(), MYSQL_CONTAINER.getFirstMappedPort());
	}
	
	@Test
	@Order(2)
	@DisplayName("Check repository gets autowired")
	void testRepoistoryIsWiredUp() {
		assertNotNull(repository);
	}
	
	@Test
	@Order(3)
	@DisplayName("Check connectivity to db via repository and fetch a few records and check the number returned is as expected")	
	void testFindAll() {
		int EXPECTED_NO_OF_RECORDS = 5;
		List<AssetType> findAllResults = repository.findAll();
		assertEquals(EXPECTED_NO_OF_RECORDS, findAllResults.size());
		LOGGER.debug("FROM AssetTypeRepositoryTest.testFindAll: repository.findAll returned {} records", findAllResults.size());
		for (AssetType result: findAllResults) {
			LOGGER.debug("FROM AssetTypeRepositoryTest.testFindAll: AssetType =  {}",result);
		}
	}
	
}
