package com.zonesoft.policyengine.api.entities;

import static com.zonesoft.policyengine.api.utilities.ToStringBuilder.lastLine;
import static com.zonesoft.policyengine.api.utilities.ToStringBuilder.line;

import com.zonesoft.policyengine.api.utilities.ToStringBuilder;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "t_attribute")
public class Attribute {
	private Long id;
	private String attribute;
	private String description;
	
	@Id
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getAttribute() {
		return attribute;
	}
	
	public void setAttribute(String attribute) {
		this.attribute = attribute;
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
				line("attribute", attribute),
				lastLine("description", description)
				
		);
	}	
	
}
