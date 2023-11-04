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
	
	private List<Policy> getPoliciesAssignedToAssetType(AssetType assetType){
		return policyRepository.findAll()
		.stream().filter(
			p -> p
					.getAssetTypes()
					.stream()
					.anyMatch(
							at -> at.getId() == assetType.getId()
					)
			)
			.toList();				
	}
	
	private void removeAssetTypeFromPolicies(AssetType assetType) {
		List<Policy> policiesAssignedWithAssetType = getPoliciesAssignedToAssetType(assetType);
		for (Policy policy : policiesAssignedWithAssetType) {			
			policy.getAssetTypes().removeIf(at -> at.getId() == assetType.getId());
		}		
	}
	
	public void updateAssignedPolicies(AssetType assetType) {		
		removeAssetTypeFromPolicies(assetType);						
		for(Policy policy : assetType.getPolicies()) {
			Policy currentPolicy = policyRepository.findById(policy.getId()).get();			
			currentPolicy.getAssetTypes().add(assetType);
		}
	}	
}
