package com.zonesoft.policyengine.api.configurations;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
public class WebConfig implements WebMvcConfigurer {
	
	
	@Value("${com.zonesoft.allowed-origins}")
	private String allowedOriginsList;

    @Override
    public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**")
		.allowedOrigins(allowedOriginsList.split(","))
		.allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS");		
    }
}
