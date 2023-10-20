package com.zonesoft.policyengine.api.controllers;

import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zonesoft.policyengine.api.entities.Attribute;
import com.zonesoft.policyengine.api.services.AttributeService;

@RestController
@RequestMapping("/policy-engine/api/attribute")
public class AttributeController {

	private final AttributeService service;
	
	public AttributeController(AttributeService service) {
		super();
		this.service = service;
	}
	
    @GetMapping
    public List<Attribute> findAll(){
    	return service.findAll();
    }	
}
