package com.zonesoft.policyengine.api.controllers;

import java.util.List;
import java.util.Objects;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zonesoft.policyengine.api.entities.AssetType;
import com.zonesoft.policyengine.api.services.AssetTypeService;

@RestController
@RequestMapping("/policy-engine/api/asset-type")
public class AssetTypeController {
	private static final Logger LOGGER= LoggerFactory.getLogger(AssetTypeController.class);
	private final AssetTypeService service;
	
	public AssetTypeController(AssetTypeService service) {
		super();
		this.service = service;
	}
	
    
	//200 (OK)
	//list of asset-types
    @GetMapping
    public ResponseEntity<List<AssetType>> findAll(){
    	List<AssetType> results = service.findAll();
    	return ResponseEntity.ok().body(results);
    }    
    
    @GetMapping("/{id}")
    public ResponseEntity<AssetType> findById() {
		return ResponseEntity.status(HttpStatus.NOT_IMPLEMENTED).build();    	
    }
 
	// 200 (OK) 
	// 404 (Not Found), if ID not found or invalid
    @PutMapping("/{id}")
    public ResponseEntity<AssetType> update(@PathVariable(value = "id") Long id, @RequestBody String changedAssetTypeJson) {  
    	LOGGER.debug("FROM AssetTypeController.update: id={}, changedAssetType={}", id, changedAssetTypeJson);
    	AssetType result = service.update(id, changedAssetTypeJson);
    	if (Objects.nonNull(result)) {
    		return ResponseEntity.ok().body(result) ;
    	}else {
    		return ResponseEntity.notFound().build();
    	}
    }    
    
    @PostMapping
    public ResponseEntity<AssetType> addNew(@RequestBody AssetType newAssetType) {
    	//201 (Created)
    	//404 (Not Found), 409 (Conflict) if resource already exists..
    	return ResponseEntity.status(HttpStatus.NOT_IMPLEMENTED).build();    	
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@RequestBody AssetType assetType) {
    	//204 (OK - No Content). 
    	// 404 (Not Found), if ID not found or invalid.
    	//return ResponseEntity.noContent().build();
    	return ResponseEntity.status(HttpStatus.NOT_IMPLEMENTED).build();
    }
}
