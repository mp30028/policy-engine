package com.zonesoft.policyengine.ui.tryouts.enums;

public enum OpenIdClaim{
	ACCESS_TOKEN_HASH( "at_hash"),
	SUBJECT( "sub"),
	IS_EMAIL_VERIFIED( "email_verified"),
	ISSUER( "iss"),
	TOKEN_TYPE( "typ"),
	LOGIN_USERNAME( "preferred_username"),
	FIRSTNAME( "given_name"),
	CLIENT_SESSION_MAPPING( "nonce"),
	SESSION_ID( "sid"),
	AUDIENCE( "aud"),
	AUTHENTICATION_CONTEXT( "acr"),
	KEYCLOAK_REALM_ROLES( "realm_access"),
	AUTHORISED_PARTY( "azp"),
	AUTHENTICATION_TIME( "auth_time"),
	FULLNAME( "name"),
	EXPIRY( "exp"),
	KEYCLOAK_SESSION_ID( "session_state"),
	ISSUED_AT_TIME( "iat"),
	LASTNAME( "family_name"),
	JWT_ID( "jti");
	
	
	public final String claim;
	
	private OpenIdClaim(String claim) {
		this.claim = claim;
	}
}



//===============================================================================================================//
//
//	class OpenIdToken{
////		private static final String ACCESS_TOKEN_HASH = "at_hash";
////		private static final String SUBJECT = "sub";
////		private static final String IS_EMAIL_VERIFIED = "email_verified";
////		private static final String ISSUER = "iss";
////		private static final String TOKEN_TYPE = "typ";
////		private static final String LOGIN_USERNAME = "preferred_username";
////		private static final String FIRSTNAME = "given_name";
////		private static final String CLIENT_SESSION_MAPPING = "nonce";
////		private static final String SESSION_ID = "sid";
////		private static final String AUDIENCE = "aud";
//		
//		
////		private static final String AUTHENTICATION_CONTEXT = "acr";
////		private static final String KEYCLOAK_REALM_ROLES = "realm_access";
////		private static final String AUTHORISED_PARTY = "azp";
////		private static final String AUTHENTICATION_TIME = "auth_time";
////		private static final String FULLNAME = "name";
////		private static final String EXPIRY = "exp";
////		private static final String KEYCLOAK_SESSION_ID = "session_state";
////		private static final String ISSUED_AT_TIME = "iat";
////		private static final String LASTNAME = "family_name";
////		private static final String JWT_ID = "jti";
//		
//		
//		public enum Claim{
//			ACCESS_TOKEN_HASH( "at_hash"),
//			SUBJECT( "sub"),
//			IS_EMAIL_VERIFIED( "email_verified"),
//			ISSUER( "iss"),
//			TOKEN_TYPE( "typ"),
//			LOGIN_USERNAME( "preferred_username"),
//			FIRSTNAME( "given_name"),
//			CLIENT_SESSION_MAPPING( "nonce"),
//			SESSION_ID( "sid"),
//			AUDIENCE( "aud"),
//			AUTHENTICATION_CONTEXT( "acr"),
//			REALM_ROLES("realm_access"),
//			CLIENT_ROLES("resource_access"),
//			AUTHORISED_PARTY( "azp"),
//			AUTHENTICATION_TIME( "auth_time"),
//			FULLNAME( "name"),
//			EXPIRY( "exp"),
//			KEYCLOAK_SESSION_ID( "session_state"),
//			ISSUED_AT_TIME( "iat"),
//			LASTNAME( "family_name"),
//			JWT_ID( "jti");
//			
//			
//			public final String key;
//			
//			private Claim(String key) {
//				this.key = key;
//			}
//
//
//		}
//		
//		private final Collection<GrantedAuthority> grantedAuthorities = new ArrayList<>();
//		
//		
//		public OpenIdToken(OidcIdToken idToken) {
//			Map<String, Object> claims = idToken.getClaims();
//			debugLogClaims(claims);		
//			convertClaimsToGrantedAuthorities(claims);		
//		}
//
//
//		
//		private void convertClaimsToGrantedAuthorities(Map<String, Object> claims) {			
//			for(String claimsKey : claims.keySet()) {							
//				String claimValue = (String) claims.get(claimsKey);
//				String claimPrefix = Claim.valueOf(claimsKey).name();
////				
//////				Claim c = Claim.valueOf(claim);
////				switch (Claim.valueOf(claim)) {
////					case ACCESS_TOKEN_HASH : claimPrefix = Claim.ACCESS_TOKEN_HASH.name();
////				}
//				SimpleGrantedAuthority authority = new SimpleGrantedAuthority(claimPrefix + ": " + claimValue);
//		        grantedAuthorities.add(authority);
//			}
//		}
//		
//		private void debugLogClaims(Map<String, Object> claims) {
//			if (LOGGER.isDebugEnabled()) {
//				for(String claim : claims.keySet()) {
//					LOGGER.debug("FROM:OpenIdToken : {} = {}", claim, claims.get(claim));
//				}
//			}
//		}
//	}
//}
