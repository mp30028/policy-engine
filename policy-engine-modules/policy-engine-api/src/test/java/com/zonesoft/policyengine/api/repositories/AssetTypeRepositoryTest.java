package com.zonesoft.policyengine.api.repositories;

import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.jpa.repository.JpaRepository;

import com.zonesoft.policyengine.api.entities.AssetType;

@SpringBootTest
class AssetTypeRepositoryTest extends AbstractRepositoryTest<JpaRepository<AssetType,Long>, AssetType>{

	private int EXPECTED_FIND_ALL_RECORDS = 5;
	
	public AssetTypeRepositoryTest() {
		super();
		this.setExpectedNoOfFindAllRecords(EXPECTED_FIND_ALL_RECORDS);
	}
	
	
	
}
