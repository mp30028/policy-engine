package com.zonesoft.policyengine.api.entities;

import java.util.List;
import java.util.stream.Collectors;

import com.zonesoft.policyengine.api.utilities.ToStringHelper;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "t_attribute")
public class Attribute {
	private Long id;
	private String name;
	private String description;
	private List<Policy> policies;
	
	@Id
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name="attribute")
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
	
	@ManyToMany(fetch = FetchType.EAGER, mappedBy = "attributes", cascade = CascadeType.ALL)//This is property in Policy
	public List<Policy> getPolicies() {
		return policies;
	}

	public void setPolicies(List<Policy> policies) {
		this.policies = policies;
	}
	
	@Override
	public String toString(){
		ToStringHelper h= new ToStringHelper();
		return h.blockStart()
			.wrLn("id", id)
			.wrLn("name", name)
			.wrLn("description", description)
			.wr("used-by", listOfPolicies())			
		.blockEnd();		
	}
	
	private String listOfPolicies() {
		return policies.stream()				
				.map(p -> p.getName())
                .collect(Collectors.joining(", ","[","]"));
	}	
}
