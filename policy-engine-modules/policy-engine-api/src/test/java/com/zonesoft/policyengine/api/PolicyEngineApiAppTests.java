package com.zonesoft.policyengine.api;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;

@SpringBootTest
@TestPropertySource(locations = {"classpath:test-application.properties"})
class PolicyEngineApiAppTests {

	@Test
	void contextLoads() {
	}

}
