package com.zonesoft.policyengine.api.repositories;

import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.testcontainers.containers.MySQLContainer;

abstract class AbstractMySqlContainer {
	private static final String IMAGE_NAME = "mysql:8.0.33";
	private static final String DATABASE_NAME = 	"policy-engine-db";
	private static final String INITIALISATION_SCRIPT = "db/initialise-policy-engine-db.sql";	                                                                               
	protected static final MySQLContainer<?> MYSQL_CONTAINER;

    static {
    	MYSQL_CONTAINER = (MySQLContainer<?>)new MySQLContainer<>(IMAGE_NAME)
    			.withDatabaseName(DATABASE_NAME)
    		    .withUsername("root")
    		    .withPassword("RootPa55word")
    		    .withEnv("MYSQL_ROOT_PASSWORD", "RootPa55word")
    		    .withInitScript(INITIALISATION_SCRIPT);    		
        MYSQL_CONTAINER.start();
    }
    
    @DynamicPropertySource
    private static void registerProperties(DynamicPropertyRegistry registry) {
        registry.add("spring.datasource.url", MYSQL_CONTAINER::getJdbcUrl);
        registry.add("spring.datasource.username", MYSQL_CONTAINER::getUsername);
        registry.add("spring.datasource.password", MYSQL_CONTAINER::getPassword);
    }
    
}