package com.zonesoft.policyengine.api.controllers;

import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zonesoft.policyengine.api.entities.Policy;
import com.zonesoft.policyengine.api.services.PolicyService;

@RestController
@RequestMapping("/policy-engine/api/policy")
public class PolicyController {

	private final PolicyService service;
	
	public PolicyController(PolicyService service) {
		super();
		this.service = service;
	}
	
    @GetMapping
    public List<Policy> findAll(){
    	return service.findAll();
    }
}
