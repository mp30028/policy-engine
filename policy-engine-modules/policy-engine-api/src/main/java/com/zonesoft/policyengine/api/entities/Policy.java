package com.zonesoft.policyengine.api.entities;

import static com.zonesoft.policyengine.api.utilities.ToStringBuilder.lastLine;
import static com.zonesoft.policyengine.api.utilities.ToStringBuilder.line;

import com.zonesoft.policyengine.api.utilities.ToStringBuilder;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "t_policy")
public class Policy {
	private Long id;
	private String policy;
	private String description;
	
	@Id
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getPolicy() {
		return policy;
	}
	
	public void setPolicy(String policy) {
		this.policy = policy;
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
				line("policy", policy),
				lastLine("description", description)
				
		);
	}	
	
}
