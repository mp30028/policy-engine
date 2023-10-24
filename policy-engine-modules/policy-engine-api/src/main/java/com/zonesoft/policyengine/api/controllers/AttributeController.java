package com.zonesoft.policyengine.api.controllers;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zonesoft.policyengine.api.entities.Attribute;
import com.zonesoft.policyengine.api.services.AttributeService;

@RestController
@RequestMapping("/policy-engine/api/attribute")
public class AttributeController {
	private static final Logger LOGGER = LoggerFactory.getLogger(AttributeController.class);
	private final AttributeService service;
	
	public AttributeController(AttributeService service) {
		super();
		this.service = service;
	}
	
    @GetMapping
    public List<Attribute> findAll(){
    	return service.findAll();
    }
    
    @GetMapping("/{ids}")
    public List<Attribute> findByIds(@PathVariable ("ids") String ids){
    	LOGGER.debug("FROM AttributeController.findByIds: ids={}",ids);
    	List<Attribute> findResult = service.findByIds(ids);
    	LOGGER.debug("FROM AttributeController.findByIds: findResult={}",findResult);
    	return findResult;
    }    
}
