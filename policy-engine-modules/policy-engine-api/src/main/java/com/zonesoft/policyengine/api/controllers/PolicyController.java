package com.zonesoft.policyengine.api.controllers;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zonesoft.policyengine.api.entities.Policy;
import com.zonesoft.policyengine.api.services.PolicyService;

@RestController
@RequestMapping("/policy-engine/api/policy")
public class PolicyController {
	private static final Logger LOGGER = LoggerFactory.getLogger(PolicyController.class);

	private final PolicyService service;
	
	public PolicyController(PolicyService service) {
		super();
		this.service = service;
	}
	
    @GetMapping
    public List<Policy> findAll(){
    	return service.findAll();
    }
    
    @GetMapping("/{ids}")
    public List<Policy> findByIds(@PathVariable ("ids") String ids){
    	LOGGER.debug("FROM PolicyController.findByIds: ids={}",ids);
    	List<Policy> findResult = service.findByIds(ids);
    	LOGGER.debug("FROM PolicyController.findByIds: findResult={}",findResult);
    	return findResult;
    }
}
