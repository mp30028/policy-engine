package com.zonesoft.policyengine.api.repositories;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

class AssetTypeRepositoryTest extends AbstractMySqlContainer{
	private static final Logger LOGGER = LoggerFactory.getLogger(AssetTypeRepositoryTest.class);

	@Test
	void testContainerIsCreated() {
		assertNotNull(MYSQL_CONTAINER);
		LOGGER.debug("FROM AssetTypeRepositoryTest.testContainerIsCreated: Test-Container was started on host={} and listening on port={}", MYSQL_CONTAINER.getHost(), MYSQL_CONTAINER.getFirstMappedPort());
	}
}
