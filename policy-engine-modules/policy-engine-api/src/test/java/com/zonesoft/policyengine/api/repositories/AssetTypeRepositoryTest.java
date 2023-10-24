package com.zonesoft.policyengine.api.repositories;

//import static org.junit.Assert.assertTrue;
//import static org.junit.jupiter.api.Assertions.assertNotNull;

//import java.util.Objects;

//import org.junit.jupiter.api.Disabled;
//import org.junit.jupiter.api.DisplayName;
//import org.junit.jupiter.api.Order;
//import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.jpa.repository.JpaRepository;

import com.zonesoft.policyengine.api.entities.AssetType;

@SpringBootTest
class AssetTypeRepositoryTest extends AbstractRepositoryTest<JpaRepository<AssetType,Long>, AssetType>{
	private static final Logger LOGGER = LoggerFactory.getLogger(AssetTypeRepositoryTest.class);
	
	private int EXPECTED_FIND_ALL_RECORDS = 5;
	
	public AssetTypeRepositoryTest() {		
		super();
		LOGGER.debug("FROM-CONSTRUCTOR AssetTypeRepositoryTest.AssetTypeRepositoryTest:");
		this.setExpectedNoOfFindAllRecords(EXPECTED_FIND_ALL_RECORDS);
	}
	
//	@Test
//	@Override
//	void testRepoistoryIsWiredUp() {
//		LOGGER.debug("FROM AssetTypeRepositoryTest.testRepoistoryIsWiredUp:");
//		assertTrue(true);
//	}
	
}
