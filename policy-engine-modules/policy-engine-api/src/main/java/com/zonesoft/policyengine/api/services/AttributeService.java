package com.zonesoft.policyengine.api.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.zonesoft.policyengine.api.entities.Attribute;
import com.zonesoft.policyengine.api.repositories.AttributeRepository;

@Service
public class AttributeService {

	private final AttributeRepository attributeRepository;
	
	public AttributeService(AttributeRepository attributeRepository) {
		super();
		this.attributeRepository = attributeRepository;
	}
	
	public List<Attribute> findAll(){
		return attributeRepository.findAll();
	}
}
