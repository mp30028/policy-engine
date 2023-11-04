package com.zonesoft.policyengine.api.services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.zonesoft.policyengine.api.entities.AssetType;
import com.zonesoft.policyengine.api.entities.Policy;
import com.zonesoft.policyengine.api.repositories.PolicyRepository;

@Service
public class PolicyService {
	private static final Logger LOGGER = LoggerFactory.getLogger(PolicyService.class);
	private final PolicyRepository policyRepository;
	
	public PolicyService(PolicyRepository policyRepository) {
		super();
		this.policyRepository = policyRepository;
	}
	
	public List<Policy> findAll(){
		return policyRepository.findAll();
	}

	public List<Policy> findByIds(List<Long> ids) {
		return policyRepository.findAllById(ids);
	}
	
	public List<Policy> findByIds(String ids) {
		if (Objects.nonNull(ids)) {
			LOGGER.debug("FROM PolicyService.findByIds: ids={}",ids);
	    	List<Long> listOfIds = Arrays.asList(ids.split(","))
	    		.stream()
	    		.map(s -> Long.parseLong(s))
	    		.toList();		
			return policyRepository.findAllById(listOfIds);
		}else {
			LOGGER.debug("FROM PolicyService.findByIds: ids=<empty>");
			List<Policy> emptyList = new ArrayList<>();
			return emptyList;
		}
	}
	
	private List<Policy> getCurrentlyAssignedPolicies(AssetType assetType){
		List<Long> assignedPoliciesIds = assetType.getPolicies().stream().map(p -> p.getId()).toList();
		return this.findByIds(assignedPoliciesIds);
	}
	
	private void unassignAssetTypeFromPolicies(AssetType assetType) {		
		List<Policy> assignedPolicies = getCurrentlyAssignedPolicies(assetType);
		assignedPolicies.stream().map(p -> p.getAssetTypes().removeIf(at -> at.getId() == assetType.getId()));		
	}

	public void updateAssignedPolicies(AssetType assetType) {
		unassignAssetTypeFromPolicies(assetType);
		for(Policy policy : assetType.getPolicies()) {
			Policy currentPolicy = policyRepository.findById(policy.getId()).get();			
			currentPolicy.getAssetTypes().add(assetType);
		}
	}	
	
}
