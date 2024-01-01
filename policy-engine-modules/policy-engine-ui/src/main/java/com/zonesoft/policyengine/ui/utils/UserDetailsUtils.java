package com.zonesoft.policyengine.ui.utils;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import java.util.Collection;

public class UserDetailsUtils {
	
    public static String getKeycloakId() {
        String keycloakId = SecurityContextHolder.getContext().getAuthentication().getName();
    	return keycloakId;
    }
    
    public static String getKeycloakUsername() {
    	OidcUser oidcUser = (OidcUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	String keycloakUsername = oidcUser.getPreferredUsername();
    	return keycloakUsername;
    }

    public static Collection<String> getKeycloakUserRoles() {
		Collection<? extends GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		return authorities.stream().map(authority -> authority.getAuthority()).toList();
    }    

}
