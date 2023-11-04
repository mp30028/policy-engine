package com.zonesoft.policyengine.api.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.zonesoft.policyengine.api.entities.AssetType;
import com.zonesoft.policyengine.api.entities.Policy;
import com.zonesoft.policyengine.api.repositories.AssetTypeRepository;
import com.zonesoft.policyengine.api.utilities.DeserialiseJsonToMap;

@Service
public class AssetTypeService {
	private static final Logger LOGGER= LoggerFactory.getLogger(AssetTypeService.class);
	private final AssetTypeRepository assetTypeRepository;
	private final PolicyService policyService;
	
	public AssetTypeService(AssetTypeRepository assetTypeRepository, PolicyService policyService) {
		super();
		this.assetTypeRepository = assetTypeRepository;
		this.policyService = policyService;
	}
	
	public List<AssetType> findAll(){
		return assetTypeRepository.findAll();
	}
	
	public AssetType update(AssetType assetType) {
		//Because AssetType is not the owning side updates using AssetType.setPolicies(policies) will
		// not persist. Policy is the owning side. So need to update from that side as done via the next statement    				
		//policyService.updateAssociatedPolicies(assetType);
		policyService.updateAssignedPolicies(assetType);
		return assetTypeRepository.save(assetType);
	}
	
	public AssetType update(Long id, String json) {
    	AssetType assetType = this.findById(id);
    	if (Objects.nonNull(assetType)) {
    		Map<String, Object> map = DeserialiseJsonToMap.deserialise(json);
    		
    		Optional<String> name = getFromMap(map,"name");
    		LOGGER.debug("FROM AssetTypeService.update: name={}", name);
    		if (name.isPresent()) assetType.setName(name.get());
    		
    		Optional<String> description = getFromMap(map,"description");
    		LOGGER.debug("FROM AssetTypeService.update: description={}", description);
    		if (description.isPresent()) assetType.setDescription(description.get());
    		
    		Optional<List<Policy>> policiesOptional = getFromMap(map,"policies");
    		if (policiesOptional.isPresent()) {
    			LOGGER.debug("FROM AssetTypeService.update: policiesOptional={}", policiesOptional);
    			assetType.setPolicies(policiesOptional.get());
    		}else{
    			Optional<List<Map<String, Object>>> associatedPoliciesOptional = getFromMap(map,"associatedPolicies");    			
    			if(associatedPoliciesOptional.isPresent()) {
    				LOGGER.debug("FROM AssetTypeService.update: associatedPoliciesOptional={}", associatedPoliciesOptional);
    				List<Policy>  associatedPolicies = getPolicesFromAssociatedPolicies(associatedPoliciesOptional.get());
    				assetType.setPolicies(associatedPolicies);
    			}
    		}
    		return this.update(assetType);
    	}else {
    		return null;
    	}		
	}	

	public AssetType findById(Long id) {
		Optional<AssetType> result = assetTypeRepository.findById(id);
		return (result.isPresent() ? result.get() : null);		
	}		

	@SuppressWarnings("unchecked")
	private <T> Optional<T> getFromMap(Map<String, Object> map, String key){
		if (map.containsKey(key)) {			
			return Optional.of((T) map.get(key));
		}else {
			return Optional.empty();
		}
	}
	
	private List<Policy> getPolicesFromAssociatedPolicies(List<Map<String, Object>> associatedPolicies) {
		if (Objects.nonNull(associatedPolicies)) {
			List<Long> ids = new ArrayList<>();
			for(Map<String,Object> item: associatedPolicies) {
				LOGGER.debug("FROM AssetTypeService.getPolicesFromAssociatedPolicies: associatedPolicy.id={}, associatedPolicy.name={}", item.get("id"), item.get("name"));
				ids.add(((Integer) item.get("id")).longValue());
			}
			return this.policyService.findByIds(ids);
		} else {
			return null;		
		}
	}

}
