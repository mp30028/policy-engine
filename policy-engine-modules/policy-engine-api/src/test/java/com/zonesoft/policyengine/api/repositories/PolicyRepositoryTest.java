package com.zonesoft.policyengine.api.repositories;

import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.jpa.repository.JpaRepository;

import com.zonesoft.policyengine.api.entities.Policy;

@SpringBootTest
class PolicyRepositoryTest extends AbstractRepositoryTest<JpaRepository<Policy,Long>, Policy>{
	
	private int EXPECTED_FIND_ALL_RECORDS = 3;
	
	public PolicyRepositoryTest() {
		super();
		this.setExpectedNoOfFindAllRecords(EXPECTED_FIND_ALL_RECORDS);
	}
}
