package com.zonesoft.policyengine.api.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zonesoft.policyengine.api.entities.AssetType;

public interface AssetTypeRepository extends JpaRepository<AssetType, Long> {

}
