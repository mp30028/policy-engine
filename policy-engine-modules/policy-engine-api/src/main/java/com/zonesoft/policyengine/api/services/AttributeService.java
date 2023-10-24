package com.zonesoft.policyengine.api.services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.zonesoft.policyengine.api.entities.Attribute;
import com.zonesoft.policyengine.api.repositories.AttributeRepository;

@Service
public class AttributeService {
	private static final Logger LOGGER = LoggerFactory.getLogger(AttributeService.class);
	private final AttributeRepository attributeRepository;
	
	public AttributeService(AttributeRepository attributeRepository) {
		super();
		this.attributeRepository = attributeRepository;
	}
	
	public List<Attribute> findAll(){
		return attributeRepository.findAll();
	}


	public List<Attribute> findByIds(List<Long> ids) {
		return attributeRepository.findAllById(ids);
	}
	
	public List<Attribute> findByIds(String ids) {
		if (Objects.nonNull(ids)) {
			LOGGER.debug("FROM PolicyService.findByIds: ids={}",ids);
	    	List<Long> listOfIds = Arrays.asList(ids.split(","))
	    		.stream()
	    		.map(s -> Long.parseLong(s))
	    		.toList();		
			return attributeRepository.findAllById(listOfIds);
		}else {
			LOGGER.debug("FROM PolicyService.findByIds: ids=<empty>");
			List<Attribute> emptyList = new ArrayList<>();
			return emptyList;
		}
	}	
	
}
