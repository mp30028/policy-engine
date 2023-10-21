package com.zonesoft.policyengine.api.entities.wrappers;


public class IdentifierWrapper <T extends Identifier> implements Identifier {
	private final T entity;
	
	protected IdentifierWrapper(T entity) {
		super();
		this.entity = entity;
	}
	
	@Override
	public Long getId() {
		return entity.getId();
	}	
	
	@Override
	public String getName() {
		return entity.getName();
	}
	
	public static <E> Identifier wrap(E entity) {
		return new IdentifierWrapper<Identifier>((Identifier) entity);
	}
}
