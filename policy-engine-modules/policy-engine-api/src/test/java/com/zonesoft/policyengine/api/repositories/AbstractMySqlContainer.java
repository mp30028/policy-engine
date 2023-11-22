package com.zonesoft.policyengine.api.repositories;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.testcontainers.containers.MySQLContainer;

import com.mysql.cj.jdbc.MysqlDataSource;

@Configuration
public abstract class AbstractMySqlContainer {
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

    
    private DataSource dataSource() {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setUrl(MYSQL_CONTAINER.getJdbcUrl());
        dataSource.setUser(MYSQL_CONTAINER.getUsername());
        dataSource.setPassword(MYSQL_CONTAINER.getPassword());
        return dataSource;
    }    
    
    @Bean
	protected JdbcTemplate getTemplate() {
		return new JdbcTemplate(dataSource());
	}    
    
}