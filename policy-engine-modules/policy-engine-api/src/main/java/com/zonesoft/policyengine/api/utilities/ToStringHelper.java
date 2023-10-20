package com.zonesoft.policyengine.api.utilities;

import java.util.Objects;

public class ToStringHelper {	
	
	private final StringBuilder sb = new StringBuilder();
	
	
	private static final String startString = "{";
	private static final String endString = "}";
	private static final String invalidKey = "\"key_invalid\": ";
	private static final String quote = "\"";
	private static final String colon = ":";
	private static final String space = " ";
	private static final String nullValue = "null";
	private static final String emptyValue = "";
	private static final String newline = "\n";
	private static final String indent = "\t";
	private static final String comma = ",";
	private static final String newlineAndIndent = "\n\t";
	private static final String lSqBrace = "[";
	private static final String rSqBrace = "]";	
	public ToStringHelper begin() {
		sb.append(startString);
		return this;
	}
	
	public ToStringHelper end() {
		sb.append(endString);
		return this;
	}
	
	public String build() {
		return sb.toString();
	}
		
	public ToStringHelper key(String k) {
		if(k.isBlank()) { 
			sb.append(invalidKey);
		}else{ 
			sb.append(quote);
			sb.append(k);
			sb.append(quote);			
			sb.append(colon);
			sb.append(space);
		}
		return this;
	}

	public ToStringHelper value(String in) {
		if(Objects.isNull(in)) {
			sb.append(nullValue);
		}else{ 
			if (in.isBlank()) {
				sb.append(emptyValue);
			}else {
				sb.append(quote);
				sb.append(in.toString());
				sb.append(quote);
			}
		}
		return this;
	}
	
	public ToStringHelper value(Object in) {
		if(Objects.isNull(in)) {
			sb.append(nullValue);
		}else{
			sb.append(in.toString().replace(newline,newlineAndIndent));
		}
		return this;
	};
	
	public ToStringHelper endLn() {
		sb.append(newline);
		return this;
	}
		
	public ToStringHelper pad() {
		sb.append(indent);
		return this;
	}
	
	public ToStringHelper comma() {
		sb.append(comma);
		return this;
	}
	
	public ToStringHelper lSqBrace() {
		sb.append(lSqBrace);
		return this;
	}	
	
	public ToStringHelper rSqBrace() {
		sb.append(rSqBrace);
		return this;
	}		
	
	public ToStringHelper blockStart() {
		return this.endLn().begin().endLn();
	}	
	
	public String blockEnd() {
		return this.end().build();
	}	
	
	public ToStringHelper wrLn(String key, String value) {
		this.pad().key(key).value(value).comma().endLn();
		return this;
	}
	
	public ToStringHelper wrLn(String key, Object value) {
		this.pad().key(key).value(value).comma().endLn();
		return this;
	}
	
	public ToStringHelper wr(String key, String value) {
		this.pad().key(key).value(value).endLn();
		return this;
	}

	public ToStringHelper wr(String key, Object value) {
		this.pad().key(key).value(value).endLn();
		return this;
	}	
}