package com.zonesoft.policyengine.api.entities;

import java.util.ArrayList;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.zonesoft.policyengine.api.entities.wrappers.IdentifierWrapper;
import com.zonesoft.policyengine.api.entities.wrappers.Identifier;
import com.zonesoft.policyengine.api.utilities.ToStringHelper;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;

@Entity
@Table(name = "t_asset_type")
public class AssetType implements Identifier {

	private Long id;
	private String name;
	private String description;
	private List<Policy> policies;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Override
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name="asset_type")
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
	@ManyToMany(fetch = FetchType.EAGER, mappedBy = "assetTypes", cascade = CascadeType.ALL) //This is property in Policy
//	@ManyToMany(fetch = FetchType.EAGER, mappedBy = "assetTypes") //This is property in Policy	
	public List<Policy> getPolicies() {
		return policies;
	}

	public void setPolicies(List<Policy> policies) {
		this.policies = policies;
	}

	@Transient
	public List<Identifier> getAssociatedPolicies() {
		return IdentifierWrapper.wrap(policies);
	}		
	
	@Override
	public String toString(){
		ToStringHelper h= new ToStringHelper();
		return h.blockStart()
			.wrLn("id", id)
			.wrLn("name", name)
			.wrLn("description", description)
			.<Policy>wr("policies-applied", policies, p -> p.getName())
		.blockEnd();
	}
	
}
