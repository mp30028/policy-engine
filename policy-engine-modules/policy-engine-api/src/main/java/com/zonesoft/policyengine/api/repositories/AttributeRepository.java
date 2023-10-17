package com.zonesoft.policyengine.api.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zonesoft.policyengine.api.entities.Attribute;

public interface AttributeRepository extends JpaRepository<Attribute, Long> {

}
