package com.zonesoft.policyengine.api.repositories;

import static org.junit.jupiter.api.Assertions.*;

import java.text.MessageFormat;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.test.context.TestPropertySource;

import com.zonesoft.policyengine.api.entities.AssetType;
import com.zonesoft.policyengine.api.entities.Policy;

@SpringBootTest
//@TestPropertySource(locations = {"classpath:application.properties"})
//@TestPropertySource(locations = {"classpath:test-application.properties"},  properties = { "spring.jpa.hibernate.ddl-auto=none" })
@TestPropertySource(locations = {"classpath:test-application.properties"})
@TestMethodOrder(OrderAnnotation.class)
class AssetTypeRepositoryTest extends AbstractRepositoryTest<JpaRepository<AssetType,Long>, AssetType>{
	private static final Logger LOGGER = LoggerFactory.getLogger(AssetTypeRepositoryTest.class);
	
	private int EXPECTED_FIND_ALL_RECORDS = 5;
	
	public AssetTypeRepositoryTest() {		
		super();
		LOGGER.debug("FROM-CONSTRUCTOR AssetTypeRepositoryTest.AssetTypeRepositoryTest:");
		this.setExpectedNoOfFindAllRecords(EXPECTED_FIND_ALL_RECORDS);
	}
	
	@Test
	@Order(4)
	@DisplayName("Fetch an Asset-Type by ID and check it is as expected")	
	void testGetByValidId() {
		Long VALID_ID = 1L;
		String EXPECTED_NAME = "user-file";
		int EXPECTED_NUMBER_OF_ASSIGNED_POLICIES = 1;
		Optional<AssetType> findResult = repository.findById(VALID_ID);
		assertTrue(findResult.isPresent());
		AssetType assetType = findResult.get();
		assertEquals(VALID_ID, assetType.getId());
		assertEquals(EXPECTED_NAME, assetType.getName());		
		List<Policy> policiesAssigned = assetType.getPolicies();
		assertEquals(EXPECTED_NUMBER_OF_ASSIGNED_POLICIES, policiesAssigned.size());
		LOGGER.debug("FROM AssetTypeRepositoryTest.testGetByValidId: policiesAssigned = {}", policiesAssigned);
		
	}	

	@Test
	@Order(5)
	@DisplayName("Delete an Asset-Type by ID and check it's impact is as expected")	
	void testDeleteByValidId() {
		Long VALID_ID = 1L;
		String sqlStatement = "select "
				+ "(select count(*) from t_asset) as asset_count, "
				+ "(select count(*) from t_asset_type) as asset_type_count, "
				+ "(select count(*) from t_policy) as policy_count, "
				+ "(select count(*) from t_attribute) as attribute_count, "
				+ "(select count(*) from t_asset_type_policy) as asset_type_policy_count, "
				+ "(select count(*) from t_policy_attribute) as policy_attribute_count, "
				+ "(select count(*) from t_attribute_value) as attribute_value_count";
		
		List<String> resultsBeforeDelete = getTemplate().query(
			sqlStatement, 
			(rs, n) -> MessageFormat.format(
					"asset-count={0}, "
					+ "asset-type-count={1}, "
					+ "policy-count={2}, "
					+ "attribute-count={3}, "
					+ "asset-type-policy-count={4}, "
					+ "policy_attribute_count={5}, "
					+ "attribute-value-count={6}", 
					rs.getLong("asset_count"), 
					rs.getLong("asset_type_count"), 
					rs.getLong("policy_count"), 
					rs.getLong("attribute_count"),
					rs.getLong("asset_type_policy_count"), 
					rs.getLong("policy_attribute_count"), 
					rs.getLong("attribute_value_count")
			)
		);
		assertTrue(resultsBeforeDelete.size() == 1);
		repository.deleteById(VALID_ID);
		
		List<String> resultsAfterDelete = getTemplate().query(
			sqlStatement, 
			(rs, n) -> MessageFormat.format(
					"asset-count={0}, "
					+ "asset-type-count={1}, "
					+ "policy-count={2}, "
					+ "attribute-count={3}, "
					+ "asset-type-policy-count={4}, "
					+ "policy_attribute_count={5}, "
					+ "attribute-value-count={6}", 
					rs.getLong("asset_count"), 
					rs.getLong("asset_type_count"), 
					rs.getLong("policy_count"), 
					rs.getLong("attribute_count"),
					rs.getLong("asset_type_policy_count"), 
					rs.getLong("policy_attribute_count"), 
					rs.getLong("attribute_value_count")
			)
		);
		assertTrue(resultsAfterDelete.size() == 1);
		LOGGER.debug("FROM AssetTypeRepositoryTest.testDeleteByValidId: \nresultsBeforeDelete = {}", resultsBeforeDelete);
		LOGGER.debug("FROM AssetTypeRepositoryTest.testDeleteByValidId: \nresultsAfterDelete = {}", resultsAfterDelete);
	}
	
}
