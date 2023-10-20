package com.zonesoft.policyengine.api.entities.wrappers;

public class SimpleFacadeWrapper <T extends SimpleFacade> {
	private final T entity;
	
	public SimpleFacadeWrapper(T entity) {
		super();
		this.entity = entity;
	}
	
	public Long getId() {
		return entity.getId();
	}	
	

	public String getName() {
		return entity.getName();
	}
}
