package com.saqib.maker_sharks.repository;

import com.saqib.maker_sharks.model.ManufacturingProcessEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ManufacturingProcessRepository extends JpaRepository<ManufacturingProcessEntity,Long> {
}
