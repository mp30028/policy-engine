package com.zonesoft.policyengine.api.configurations;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**")
		.allowedOrigins("http://localhost:3000","http://192.168.1.214:3000","http://127.0.0.1:3000", "http://localhost:1111")
		.allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS");		
    }
}
