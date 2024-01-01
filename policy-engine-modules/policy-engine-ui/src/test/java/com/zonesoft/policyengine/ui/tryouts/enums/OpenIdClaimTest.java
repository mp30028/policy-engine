package com.zonesoft.policyengine.ui.tryouts.enums;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



class OpenIdClaimTest {
	private static final Logger LOGGER = LoggerFactory.getLogger(OpenIdClaimTest.class);
	
	@Test
	void test() {
		LOGGER.debug("ACCESS_TOKEN_HASH.name() = {} and .claim = {}", OpenIdClaim.ACCESS_TOKEN_HASH.name(), OpenIdClaim.ACCESS_TOKEN_HASH.claim);
		LOGGER.debug("AUDIENCE = {} and .claim = {}", OpenIdClaim.AUDIENCE, OpenIdClaim.AUDIENCE.claim);
	}

}
