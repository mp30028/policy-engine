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
	
	public void unassignAssetTypeFromAllPolicies(AssetType assetType) {
		List<Policy> allPolicies = this.policyRepository.findAll();
		for (Policy policy : allPolicies) {			
			boolean isRemoved = policy.getAssetTypes().removeIf(at -> at.getId() == assetType.getId());		
			if (isRemoved) {
				this.policyRepository.save(policy);
			}
			LOGGER.debug(
					"FROM PolicyService.unassignAssetTypeFromAllPolicies: asset-type named {} {} from policy named {}",
					assetType.getName(), 
					isRemoved ? "successfully removed" : "NOT removed", 
					policy.getName()
			);
		}		
	}
	
	public void updateAssignedPolicies(AssetType assetType, List<Policy> policies) {
		unassignAssetTypeFromAllPolicies(assetType);
		for(Policy policy : policies) {
			List<AssetType> assetTypes = policy.getAssetTypes();
			if (Objects.isNull(assetTypes)) {
				policy.setAssetTypes(new ArrayList<AssetType>());
			}
			policy.getAssetTypes().add(assetType);
			Policy updatedPolicy = this.policyRepository.saveAndFlush(policy);
			assetType.getPolicies().add(updatedPolicy);
			LOGGER.debug(
					"FROM PolicyService.updateAssignedPolicies: asset-type named {} {} to policy named {}",
					assetType.getName(), 
					"successfully added", 
					updatedPolicy.getName()
			);
		}
		
	}
}
