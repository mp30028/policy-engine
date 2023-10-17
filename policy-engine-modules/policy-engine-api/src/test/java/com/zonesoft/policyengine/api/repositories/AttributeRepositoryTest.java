package com.zonesoft.policyengine.api.repositories;

import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.jpa.repository.JpaRepository;

import com.zonesoft.policyengine.api.entities.Attribute;

@SpringBootTest
class AttributeRepositoryTest extends AbstractRepositoryTest<JpaRepository<Attribute,Long>, Attribute>{
	
	private int EXPECTED_FIND_ALL_RECORDS = 4;
	
	public AttributeRepositoryTest() {
		super();
		this.setExpectedNoOfFindAllRecords(EXPECTED_FIND_ALL_RECORDS);
	}
}
