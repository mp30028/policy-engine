package com.zonesoft.policyengine.api.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zonesoft.policyengine.api.entities.Policy;

public interface PolicyRepository extends JpaRepository<Policy, Long> {

}
