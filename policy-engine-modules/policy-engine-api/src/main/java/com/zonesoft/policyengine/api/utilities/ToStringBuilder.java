package com.zonesoft.policyengine.api.utilities;

import java.util.Objects;

public class ToStringBuilder {	
	
	public static final String comma = ",";
	public static final String lBrace = "{";
	public static final String rBrace = "}";
	public static final String indent = "\t";
	public static final String newline = "\n";
	public static final String quote = "\"";
	public static final String equals = "=";
	public static final String space = " ";

	
	public String build(String ... args) {
		return build(true, args);
	}
	
	
	public String build(boolean isClosed, String ... args) {
		StringBuilder sb = new StringBuilder();
		if (isClosed) sb.append(newline); sb.append(lBrace); sb.append(newline);
		for(String arg: args) {
			sb.append(arg);
		}
		if (isClosed) sb.append(newline); sb.append(rBrace);
		return sb.toString();
	}
	
	public String build(boolean isClosed, String[] ... args) {
		StringBuilder sb = new StringBuilder();
		if (isClosed) sb.append(newline); sb.append(lBrace); sb.append(newline);
		for(String[] arg: args) {
			for(String item: arg) {
				sb.append(item);
			}
		}
		if (isClosed) sb.append(newline); sb.append(rBrace);
		return sb.toString();
	}
		
	public String build(String[] ... args) {
		return build(true, args);
	}
	
	
	public static String[] line(String key, Object value) {
		return new String[] {indent, key(key), value(value), comma, newline};		
	}
	
	public static String[] lastLine(String key, Object value) {
		return new String[] {indent, key(key), value(value)};		
	}	
	
	public static String key(String k) {
		if(k.isBlank()) { 
			//if string is null, empty, or only whitespace
			return "\"key_invalid\": ";
		}else{ 
			return "\"" + k + "\": ";
		}
	}
	
	public static String objectValue(Object in) {
		if(Objects.isNull(in)) {
			return "null";
		}else{ 
			return in.toString();
		}
	};
	
	public static String value(Object in) {
		if(Objects.isNull(in)) {
			return "null";
		}else{ 
			return "\"" + in.toString() + ("\"") ;
		}
	}
}