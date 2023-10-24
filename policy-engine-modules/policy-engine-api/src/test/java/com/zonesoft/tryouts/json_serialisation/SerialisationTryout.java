package com.zonesoft.tryouts.json_serialisation;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;



class SerialisationTryout {
	private static final Logger LOGGER = LoggerFactory.getLogger(SerialisationTryout.class);
	

	
	@Test
	void testSerialisationToJson() throws JsonProcessingException {
		ExampleParent parent = new ExampleParent(0, "Test-Example-Parent", new ExampleChild(0, "Test-Example-Child"));
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString( parent );
		LOGGER.debug("FROM SerialisationTryout.testSerialisationToJson: json={}", json);		
	}
		

	@Test
	void testSerialisationFromJson() throws JsonProcessingException {
		String json = "{\"id\":0,\"label\":\"Test-Example-Parent\",\"child\":{\"id\":0,\"label\":\"Test-Example-Child\"}}";
		//ExampleParent parent = new ExampleParent(0, "Test-Example-Parent", new ExampleChild(0, "Test-Example-Child"));
		ObjectMapper mapper = new ObjectMapper();
		ExampleParent parent = mapper.readValue(json, ExampleParent.class);
		LOGGER.debug("FROM SerialisationTryout.testSerialisationToJson: parent-id={}, parent-label={},child-id={}, child-label={}", parent.getId(),parent.getLabel(),parent.getChild().getId(),parent.getChild().getLabel());		
	}
	
	
	
}