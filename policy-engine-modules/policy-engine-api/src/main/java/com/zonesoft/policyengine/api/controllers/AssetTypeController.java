package com.zonesoft.policyengine.api.controllers;

import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zonesoft.policyengine.api.entities.AssetType;
import com.zonesoft.policyengine.api.services.AssetTypeService;

@RestController
@RequestMapping("/policy-engine/api")
public class AssetTypeController {

	private final AssetTypeService service;
	
	public AssetTypeController(AssetTypeService service) {
		super();
		this.service = service;
	}
	
    @GetMapping
    public List<AssetType> findAll(){
    	return service.findAll();
    }	
}
