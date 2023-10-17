package com.zonesoft.policyengine.api.entities;

import static com.zonesoft.policyengine.api.utilities.ToStringBuilder.lastLine;
import static com.zonesoft.policyengine.api.utilities.ToStringBuilder.line;

import com.zonesoft.policyengine.api.utilities.ToStringBuilder;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "t_asset_type")
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
	
	@Override
	public String toString(){
		ToStringBuilder b = new ToStringBuilder();
		return b.build(
				line("id", id),
				line("assetType", assetType),
				lastLine("description", description)
				
		);
	}
	
}
