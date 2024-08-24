package com.saqib.maker_sharks.repository;

import com.saqib.maker_sharks.model.SupplierEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SupplierRepository extends JpaRepository<SupplierEntity,Long> {

    @Query(value="SELECT DISTINCT s.company_name,s.website,s.supplier_location,s.nature_of_business,mp.process"+
            " FROM supplier_entity s INNER JOIN supplier_process_mapping spm"+
            " ON s.id=spm.supplier_id INNER JOIN manufacturing_process_entity mp "+
            "ON mp.id=spm.process_id WHERE"+
            " s.supplier_location= ?1 AND s.nature_of_business=?2 " +
            "AND mp.process=?3",nativeQuery = true,name = "supplierDetailsMapping")
    Page< SupplierDetails> findAllBySupplierQuery(String location, String nature, String process, Pageable pageable);
public  interface SupplierDetails{
    String getCompany_name();
    String getWebsite();
    String getSupplier_location();
    String getNature_of_business();
    String getProcess();

}
}
