package com.zonesoft.policyengine.ui.configurations;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.authority.mapping.GrantedAuthoritiesMapper;
import org.springframework.security.oauth2.core.oidc.OidcIdToken;
import org.springframework.security.oauth2.core.oidc.user.OidcUserAuthority;
import org.springframework.security.web.SecurityFilterChain;
import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig {

	private static final String RESOURCE_ACCESS = "resource_access";
	private static final String REALM_ACCESS = "realm_access";
	private static final String ROLES = "roles";

	@Value("${spring.security.oauth2.client.registration.keycloak.client-id}")
	private String oauth2ClientId;
	private static final Logger LOGGER = LoggerFactory.getLogger(WebSecurityConfig.class);
	
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
    	httpSecurity
			.authorizeHttpRequests((authorizeRequests) ->
				authorizeRequests
					.anyRequest().authenticated()
			).oauth2Login(withDefaults());
		return httpSecurity.build();
    }	
	
	@Bean
	public GrantedAuthoritiesMapper userAuthoritiesMapper() {
		LOGGER.debug("userAuthoritiesMapper-Bean Invoked");
		
		return (authorities) -> {
			LOGGER.debug("userAuthoritiesMapper-Function Invoked");
			Set<GrantedAuthority> mappedAuthorities = new HashSet<>();
			authorities.forEach(authority -> {
				if (OidcUserAuthority.class.isInstance(authority)) {
					OidcUserAuthority oidcUserAuthority = (OidcUserAuthority)authority;
					OidcIdToken idToken = oidcUserAuthority.getIdToken();
					mappedAuthorities.addAll(extractRoles(idToken));
				}
			});
			return mappedAuthorities;
		};
	}
	
	private Collection<? extends GrantedAuthority> extractRoles(OidcIdToken idToken) {
		LOGGER.debug("extractRoles from  idToken invoked");
		Collection<GrantedAuthority> grantedAuthorities = new ArrayList<>();
		Map<String, Object> claims = idToken.getClaims();
		debugLogClaims("extractAuthorities(idToken)", claims);
		extractKeycloakClientRoles(claims, grantedAuthorities);
		extractKeycloakRealmRoles(claims, grantedAuthorities);
		return grantedAuthorities;		
	}
	
	@SuppressWarnings("unchecked")
	private void extractKeycloakClientRoles(Map<String, Object> claims, Collection<GrantedAuthority> grantedAuthorities) {
        Map<String, Object> clientRoleClaims = (Map<String, Object>) claims.get(RESOURCE_ACCESS);
        LOGGER.debug("FROM extractKeycloakClientRoles: function invoked with oauth2ClientId={}",oauth2ClientId);
        debugLogClaims("extractKeycloakClientRoles", claims);
        Collection<String> clientRoles = null;
        if (Objects.nonNull(oauth2ClientId) && Objects.nonNull(clientRoleClaims)) {
        	LOGGER.debug("FROM extractKeycloakClientRoles: will attempt extracting client roles");
        	clientRoles = (Collection<String>) ((Map<String, Object>) clientRoleClaims.get(oauth2ClientId)).get(ROLES);
        	if(Objects.nonNull(clientRoles)) {
        		LOGGER.debug("FROM extractKeycloakClientRoles: client roles found in claims, starting extraction");
        		Set<SimpleGrantedAuthority> authorities = clientRoles.stream()
                .map(role -> new SimpleGrantedAuthority(role))
                .collect(Collectors.toSet());
        		grantedAuthorities.addAll(authorities);
        	}else{
        		LOGGER.debug("FROM extractKeycloakClientRoles: no client roles were found in the token");
        	}
        }
	}
	
	@SuppressWarnings("unchecked")
	private void extractKeycloakRealmRoles(Map<String, Object> claims, Collection<GrantedAuthority> grantedAuthorities) {
        Map<String, Object> realmAccess = (Map<String, Object>) claims.get(REALM_ACCESS);
        Collection<String> realmRoles;
        if (Objects.nonNull(realmAccess)) {
        	realmRoles = (Collection<String>) ((Map<String, Object>) realmAccess).get(ROLES);
        	if(Objects.nonNull(realmRoles)) {        	
        		Set<SimpleGrantedAuthority> authorities =realmRoles.stream()
                .map(role -> new SimpleGrantedAuthority(role))
                .collect(Collectors.toSet());
        		grantedAuthorities.addAll(authorities);
        	}
        }
	}	
		
	private void debugLogClaims(String label, Map<String, Object> claims) {
		if (LOGGER.isDebugEnabled()) {
			for(String claim : claims.keySet()) {
				LOGGER.debug("FROM: {}: {} = {}",label, claim, claims.get(claim));
			}
		}
	}
			
}
