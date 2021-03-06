package com.org.coop.retail.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.org.coop.retail.entities.MaterialTranDtl;
import com.org.coop.retail.entities.MaterialTranHrd;

public interface RetailMaterialTranDtlRepository extends JpaRepository<MaterialTranDtl, Integer> {
	@Query("select mtd from MaterialTranDtl mtd where mtd.materialTranHrd.tranId = :tranId")
	public List<MaterialTranDtl> findByTranId(@Param("tranId") int tranId);
}
