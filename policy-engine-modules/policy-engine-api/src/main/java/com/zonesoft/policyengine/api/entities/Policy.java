package com.zonesoft.policyengine.api.entities;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.zonesoft.policyengine.api.entities.wrappers.SimpleFacadeWrapper;
import com.zonesoft.policyengine.api.entities.wrappers.SimpleFacade;
import com.zonesoft.policyengine.api.utilities.ToStringHelper;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinTable;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;

@Entity
@Table(name = "t_policy")
public class Policy implements SimpleFacade{
	private Long id;
	private String name;
	private String description;
	private List<AssetType> assetTypes;
	private List<Attribute> attributes;
	
	@Id
	@Override
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name="policy")
	@Override
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}	

	@JsonIgnore
	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(			
	  name = "t_asset_type_policy",                                //this is the intermediate table
	  joinColumns = @JoinColumn(name = "policy_id"),               //this the how this entity relates to the intermediate table
	  inverseJoinColumns = @JoinColumn(name = "asset_type_id"))	   //this the how the related entity relates to the intermediate table
	public List<AssetType> getAssetTypes() {		
		return assetTypes;
	}

	public void setAssetTypes(List<AssetType> assetTypes) {
		this.assetTypes = assetTypes;
	}

	@Transient
	public List<SimpleFacadeWrapper<AssetType>> getAssociatedAssetTypes() {
		return assetTypes
					.stream()
					.map(a -> new SimpleFacadeWrapper<AssetType>(a))
					.toList();
	}	

	@JsonIgnore
	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(
	  name = "t_policy_attribute",                                //this is the intermediate table
	  joinColumns = @JoinColumn(name = "policy_id"),               //this the how this entity relates to the intermediate table
	  inverseJoinColumns = @JoinColumn(name = "attribute_id"))	   //this the how the related entity relates to the intermediate table
	public List<Attribute> getAttributes() {
		return attributes;
	}

	public void setAttributes(List<Attribute> attributes) {
		this.attributes = attributes;
	}
	
	@Transient
	public List<SimpleFacadeWrapper<Attribute>> getAssociatedAttributes() {
		return attributes
					.stream()
					.map(a -> new SimpleFacadeWrapper<Attribute>(a))
					.toList();
	}	
	
	@Override
	public String toString(){
		ToStringHelper h= new ToStringHelper();
		return h.blockStart()
			.wrLn("id", id)
			.wrLn("name", name)
			.wrLn("description", description)
			.<Attribute>wrLn("policy-attributes", attributes, a -> a.getName())
			.<AssetType>wr("policy-applied-to", assetTypes, a -> a.getName())
		.blockEnd();		
	}

}
