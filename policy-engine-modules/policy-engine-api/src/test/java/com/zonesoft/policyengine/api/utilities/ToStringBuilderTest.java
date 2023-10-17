package com.zonesoft.policyengine.api.utilities;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static com.zonesoft.policyengine.api.utilities.ToStringBuilder.*;

class ToStringBuilderTest {
	private static final Logger LOGGER = LoggerFactory.getLogger(ToStringBuilderTest.class);
	
	private static final String EXPECTED_BUILT_TO_STRING = 
			"\n{\n"
			+ "\t\"example-text\": \"Simple test string\",\n"
			+ "\t\"example-int\": \"123\",\n"
			+ "\t\"example-double\": \"123.456\",\n"
			+ "\t\"example-long\": \"456\"\n"
			+ "}";
	
	@Test
	void testItemeByItemBuild() {
		int INT_VALUE = 123;
		long LONG_VALUE = 456L;
		String TEXT_VALUE = "Simple test string";
		double DOUBLE_VALUE = 123.456000;
		
		ToStringBuilder b = new ToStringBuilder();
		String builtString =b.build(
			indent, key("example-text"), value(TEXT_VALUE), comma, newline,
			indent, key("example-int"), value(INT_VALUE), comma, newline,
			indent, key("example-double"), value(DOUBLE_VALUE), comma, newline,
			indent, key("example-long"), value(LONG_VALUE)
		);
		LOGGER.debug("FROM ToStringBuilderTest.testItemByItemBuild: builtString={}", builtString);
		LOGGER.debug("FROM ToStringBuilderTest.testItemByItemBuild: EXPECTED_BUILT_TO_STRING={}", EXPECTED_BUILT_TO_STRING);
		assertEquals(0,EXPECTED_BUILT_TO_STRING.compareTo(builtString));		
	}

	@Test
	void testLineByLineBuild() {
		int INT_VALUE = 123;
		long LONG_VALUE = 456L;
		String TEXT_VALUE = "Simple test string";
		double DOUBLE_VALUE = 123.456000;
		
		ToStringBuilder b = new ToStringBuilder();
		String builtString = b.build(
				line("example-text", TEXT_VALUE),
				line("example-int", INT_VALUE),
				line("example-double", DOUBLE_VALUE),
				lastLine("example-long", LONG_VALUE)
				
		);
		LOGGER.debug("FROM ToStringBuilderTest.testLineByLineBuild: builtString={}", builtString);
		LOGGER.debug("FROM ToStringBuilderTest.testLineByLineBuild: EXPECTED_BUILT_TO_STRING={}", EXPECTED_BUILT_TO_STRING);
		assertEquals(0,EXPECTED_BUILT_TO_STRING.compareTo(builtString));
	}
	
}
