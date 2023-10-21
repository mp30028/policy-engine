package com.zonesoft.policyengine.api.entities;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.zonesoft.policyengine.api.entities.wrappers.IdentifierWrapper;
import com.zonesoft.policyengine.api.entities.wrappers.Identifier;
import com.zonesoft.policyengine.api.utilities.ToStringHelper;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;

@Entity
@Table(name = "t_attribute")
public class Attribute implements Identifier{
	private Long id;
	private String name;
	private String description;
	private List<Policy> policies;
	
	@Id
	@Override
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name="attribute")
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
	@ManyToMany(fetch = FetchType.EAGER, mappedBy = "attributes", cascade = CascadeType.ALL)//This is property in Policy
	public List<Policy> getPolicies() {
		return policies;
	}

	public void setPolicies(List<Policy> policies) {
		this.policies = policies;
	}
	
	@Transient
	public List<Identifier> getAssociatedPolicies() {		
		return policies
					.stream()					
					.map(p -> IdentifierWrapper.wrap(p))
					.toList();
	}	
	
	@Override
	public String toString(){
		ToStringHelper h= new ToStringHelper();
		return h.blockStart()
			.wrLn("id", id)
			.wrLn("name", name)
			.wrLn("description", description)
			.<Policy>wr("used-by", policies, p -> p.getName())			
		.blockEnd();		
	}

}
