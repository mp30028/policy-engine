package com.zonesoft.policyengine.api.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.zonesoft.policyengine.api.entities.Policy;
import com.zonesoft.policyengine.api.repositories.PolicyRepository;

@Service
public class PolicyService {

	private final PolicyRepository policyRepository;
	
	public PolicyService(PolicyRepository policyRepository) {
		super();
		this.policyRepository = policyRepository;
	}
	
	public List<Policy> findAll(){
		return policyRepository.findAll();
	}
}
