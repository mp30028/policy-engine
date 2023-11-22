package com.zonesoft.tryouts.jdbc_template;

import static org.junit.Assert.assertNotNull;

import java.text.MessageFormat;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import com.zonesoft.policyengine.api.PolicyEngineApiApp;
import com.zonesoft.policyengine.api.repositories.AbstractMySqlContainer;


@SpringBootTest
@ContextConfiguration(classes = PolicyEngineApiApp.class)
public class ExampleUsingJdbcTemplate  extends AbstractMySqlContainer{
	private static final Logger LOGGER = LoggerFactory.getLogger(ExampleUsingJdbcTemplate.class);
	

	@Test
	 void runExample() throws Exception {
		assertNotNull(MYSQL_CONTAINER);

		String sqlStatement = "select\r\n"
				+ "	(select count(*) from t_asset) as asset_count, "
				+ "    (select count(*) from t_asset_type) as asset_type_count, "
				+ "    (select count(*) from t_policy) as policy_count, "
				+ "    (select count(*) from t_attribute) as attribute_count";
		
		getTemplate().query(
			sqlStatement, 
			(rs, n) -> MessageFormat.format(
							"asset-count={0}, asset-type-count={1}, policy-count={2}, attribute-count={3}", 
							rs.getLong("asset_count"), rs.getLong("asset_type_count"), rs.getLong("policy_count"), rs.getLong("attribute_count")								
			)
		).forEach(s -> LOGGER.debug(s));		
	  }



}
