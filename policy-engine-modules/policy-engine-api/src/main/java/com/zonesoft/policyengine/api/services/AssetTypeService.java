package com.zonesoft.policyengine.api.services;

import java.text.MessageFormat;
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
		AssetType savedAssetType = assetTypeRepository.save(assetType);
		return savedAssetType;
	}
	
	public AssetType update(Long id, String json) {
    	AssetType assetType = this.findById(id);
    	if (Objects.nonNull(assetType)) {
    		updateAssetTypeFromJson(assetType, json);
    		return assetType;
    	}else {
    		return null;
    	}		
	}	

	public AssetType findById(Long id) {
		Optional<AssetType> result = assetTypeRepository.findById(id);
		return (result.isPresent() ? result.get() : null);		
	}
	
	public AssetType addNew(String json) {		
		String TEMP_NAME = "";
		String TEMP_DESCRIPTION = "";
		AssetType newAssetType = new AssetType();
		newAssetType.setName(TEMP_NAME);
		newAssetType.setDescription(TEMP_DESCRIPTION);
		newAssetType.setPolicies(new ArrayList<Policy>());
		newAssetType = assetTypeRepository.saveAndFlush(newAssetType);
		updateAssetTypeFromJson(newAssetType, json);
		return newAssetType;
	}
	
	public void deleteById(Long id) {
		AssetType assetType = this.findById(id);
		if (Objects.nonNull(assetType)) {
			assetTypeRepository.deleteById(id);
		}else {
			throw new RuntimeException(MessageFormat.format( "Unable to delete Asset-Type with id={0} as there is no Asset-Type with this id", id));
		}
	}
	
	private void updateAssetTypeFromJson(AssetType assetType, String json) {
		Map<String, Object> map = DeserialiseJsonToMap.deserialise(json);
				
		Optional<String> name = getFromMap(map,"name");
		LOGGER.debug("FROM AssetTypeService.updateAssetTypeFromJson: name={}", name);
		if (name.isPresent()) assetType.setName(name.get());

		
		Optional<String> description = getFromMap(map,"description");
		LOGGER.debug("FROM AssetTypeService.updateAssetTypeFromJson: description={}", description);
		if (description.isPresent()) assetType.setDescription(description.get());
		
		updateAssignedPolicies(assetType, map);		
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
	
	private void updateAssignedPolicies(AssetType assetType, Map<String, Object> map) {
		Optional<List<Policy>> policiesOptional = getFromMap(map,"policies");
		if (policiesOptional.isPresent()) {
			// Because AssetType is not the owning side updates using AssetType.setPolicies(policies) will
			// not persist. Policy is the owning side. So need to update from that side as done via     				
			// policyService.updateAssociatedPolicies(assetType)
			LOGGER.debug("FROM AssetTypeService.updateAssignedPolicies: policiesOptional={}", policiesOptional);
			policyService.updateAssignedPolicies(assetType, policiesOptional.get());
		}else{
			Optional<List<Map<String, Object>>> associatedPoliciesOptional = getFromMap(map,"associatedPolicies");    			
			if(associatedPoliciesOptional.isPresent()) {
				LOGGER.debug("FROM AssetTypeService.updateAssignedPolicies: associatedPoliciesOptional={}", associatedPoliciesOptional);
				List<Policy>  associatedPolicies = getPolicesFromAssociatedPolicies(associatedPoliciesOptional.get());
				// See earlier comment about updating from the owning side
				policyService.updateAssignedPolicies(assetType, associatedPolicies);
			}
		}		
	}
}
