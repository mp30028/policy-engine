package com.zonesoft.policyengine.api.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class AssetType {

	private Long id;
	private String assetType;
	private String description;
	
	@Id
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getAssetType() {
		return assetType;
	}
	
	public void setAssetType(String assetType) {
		this.assetType = assetType;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
}
