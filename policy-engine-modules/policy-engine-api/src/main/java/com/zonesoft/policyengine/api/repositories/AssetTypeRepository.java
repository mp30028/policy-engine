package com.zonesoft.policyengine.api.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.zonesoft.policyengine.api.entities.AssetType;

public interface AssetTypeRepository extends JpaRepository<AssetType, Long> {

	@Override
	@Modifying
    @Query(nativeQuery=true, value="delete from t_asset_type at where at.id = :id")    
    void deleteById(@Param("id") Long id);
}
