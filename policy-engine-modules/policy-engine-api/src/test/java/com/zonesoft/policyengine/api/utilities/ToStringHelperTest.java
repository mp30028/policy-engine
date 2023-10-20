package com.zonesoft.policyengine.api.utilities;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

class ToStringHelperTest {
	private static final Logger LOGGER = LoggerFactory.getLogger(ToStringHelperTest.class);
	
	@Test
	void testWithPrimitives() {
		int integerValue = 123;
		byte byteValue =  0x10;
		long longValue = 456L;
		double dblValue = 3.142;
		boolean boolValue = true;
		ToStringHelper h = new ToStringHelper();
		String result = h.endLn()
			.begin().endLn()
				.pad().key("int-Value").value(integerValue).comma().endLn()
				.pad().key("byte-Value").value(byteValue).comma().endLn()
				.pad().key("long-Value").value(longValue).comma().endLn()
				.pad().key("double-Value").value(dblValue).comma().endLn()
				.pad().key("boolean-Value").value(boolValue).endLn()
			.end()
		.build();
		LOGGER.debug("FROM SerialisationTryout.testWithPrimitives: result={}", result);
	}

	@Test
	void testWithString() {
		int integerValue = 123;
		byte byteValue =  0x10;
		long longValue = 456L;
		double dblValue = 3.142;
		boolean boolValue = true;
		String sample1 = "Hello world";
		String sample2 = "Hello again";
		String sample3 = "Goodbye world";
		String sample4 = "I am done here";
		ToStringHelper h = new ToStringHelper();
		String result = h.endLn()
			.begin().endLn()
				.pad().key("sample1").value(sample1).comma().endLn()			
				.pad().key("int-Value").value(integerValue).comma().endLn()
				.pad().key("byte-Value").value(byteValue).comma().endLn()
				.pad().key("long-Value").value(longValue).comma().endLn()
				.pad().key("sample2").value(sample2).comma().endLn()
				.pad().key("double-Value").value(dblValue).comma().endLn()
				.pad().key("sample3").value(sample3).comma().endLn()
				.pad().key("sample4").value(sample4).comma().endLn()
				.pad().key("boolean-Value").value(boolValue).endLn()
			.end()
		.build();							
		LOGGER.debug("FROM SerialisationTryout.testWithString: result={}", result);
	}	
	
	@Test
	void testWithObjects() {
		int integerValue = 123;
		byte byteValue =  0x10;
		long longValue = 456L;
		double dblValue = 3.142;
		boolean boolValue = true;
		String sample1 = "Hello world";
		String sample2 = "Hello again";
		String sample3 = "Goodbye world";
		String sample4 = "I am done here";
		ExampleChild child = new ExampleChild(100, "this is a test string");
		ToStringHelper h = new ToStringHelper();
		String result = h.endLn()
			.begin().endLn()
				.pad().key("sample1").value(sample1).comma().endLn()
				.pad().key("int-Value").value(integerValue).comma().endLn()
				.pad().key("byte-Value").value(byteValue).comma().endLn()
				.pad().key("long-Value").value(longValue).comma().endLn()
				.pad().key("sample2").value(sample2).comma().endLn()
				.pad().key("double-Value").value(dblValue).comma().endLn()
				.pad().key("sample3").value(sample3).comma().endLn()
				.pad().key("child").value(child).comma().endLn()
				.pad().key("sample4").value(sample4).comma().endLn()
				.pad().key("boolean-Value").value(boolValue).endLn()
			.end()
		.build();							
		LOGGER.debug("FROM SerialisationTryout.testWithObjects: result={}", result);
	}	

	@Test
	void testWithObjectsUsingCompactForm() {
		int integerValue = 123;
		byte byteValue =  0x10;
		long longValue = 456L;
		double dblValue = 3.142;
		boolean boolValue = true;
		String sample1 = "Hello world";
		String sample2 = "Hello again";
		String sample3 = "Goodbye world";
		String sample4 = "I am done here";
		ExampleChild child = new ExampleChild(100, "this is a test string");
		ToStringHelper h = new ToStringHelper();
		String result = 
			h.blockStart()
				.wrLn("sample1", sample1)
				.wrLn("int-Value", integerValue)
				.wrLn("byte-Value", byteValue)
				.wrLn("long-Value", longValue)
				.wrLn("sample2", sample2)
				.wrLn("double-Value", dblValue)
				.wrLn("sample3", sample3)
				.wrLn("child", child)
				.wrLn("sample4", sample4)
				.wr("boolean-Value", boolValue)
			.blockEnd();
		LOGGER.debug("FROM SerialisationTryout.testWithObjectsUsingCompactForm: result={}", result);
	}		
	
	
/********************************************************************/	
	
	class ExampleParent {
		private int id;
		private String label;
		private ExampleChild child;
		
		public ExampleParent(int id, String label, ExampleChild child) {
			this.id = id;
			this.label = label;
			this.child = child;
		}
		
		public int getId() {
			return id;
		}
		
		public void setId(int id) {
			this.id = id;
		}
		
		public String getLabel() {
			return label;
		}
		
		public void setLabel(String label) {
			this.label = label;
		}
		
		public ExampleChild getChild() {
			return child;
		}
		
		public void setChild(ExampleChild child) {
			this.child = child;
		}
		
		@Override
		public String toString() {
			ToStringHelper h = new ToStringHelper();
			String result = h.endLn()
				.begin().endLn()
					.pad().key("id").value(id).comma().endLn()
					.pad().key("label").value(label).comma().endLn()
					.pad().key("child").value(child).endLn()
				.end()
			.build();
			return result;
		}		
		
	}
	
	class ExampleChild{
		private int id;
		private String label;
		
		public ExampleChild(int id, String label) {
			super();
			this.id = id;
			this.label = label;
		}

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getLabel() {
			return label;
		}

		public void setLabel(String label) {
			this.label = label;
		}
		
		@Override
		public String toString() {
			ToStringHelper h = new ToStringHelper();
			String result = h.endLn()
				.begin().endLn()
					.pad().key("id").value(id).comma().endLn()
					.pad().key("label").value(label).endLn()
				.end()
			.build();
			return result;
		}	
	}	
	
	
	
	
	
/********************************************************************/		
	
}
