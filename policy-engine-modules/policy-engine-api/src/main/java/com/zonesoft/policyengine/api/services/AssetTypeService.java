package com.zonesoft.policyengine.api.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.zonesoft.policyengine.api.entities.AssetType;
import com.zonesoft.policyengine.api.repositories.AssetTypeRepository;

@Service
public class AssetTypeService {

	private final AssetTypeRepository assetTypeRepository;
	
	public AssetTypeService(AssetTypeRepository assetTypeRepository) {
		super();
		this.assetTypeRepository = assetTypeRepository;
	}
	
	public List<AssetType> findAll(){
		return assetTypeRepository.findAll();
	}
}
