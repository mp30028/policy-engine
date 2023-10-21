package com.zonesoft.policyengine.api.entities.wrappers;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.zonesoft.policyengine.api.utilities.ToStringHelper;

public class IdentifierWrapper <T extends Identifier> implements Identifier {
	private static final Logger LOGGER = LoggerFactory.getLogger(IdentifierWrapper.class);
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
	
	@Override
	public String toString(){
		ToStringHelper h= new ToStringHelper();
		return h.blockStart()
			.wrLn("id", getId())
			.wr("name", getName())
		.blockEnd();
	}	
	
	public static <E> Identifier wrap(E entity) {
		LOGGER.debug("FROM IdentifierWrapper.wrap(?): Original-Entity = {}", entity);
		Identifier returnValue = new IdentifierWrapper<Identifier>((Identifier) entity);
		LOGGER.debug("FROM IdentifierWrapper.wrap(?): Wrapped-Entity = {}", returnValue);
		return returnValue;
	}
	
	public static <E> List<Identifier> wrap(List<E> entities) {
		return entities
					.stream()					
					.map(a -> (Identifier)IdentifierWrapper.wrap(a))
					.toList();
	}	
}
