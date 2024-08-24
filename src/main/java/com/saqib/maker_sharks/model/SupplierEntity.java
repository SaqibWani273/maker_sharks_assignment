package com.saqib.maker_sharks.model;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Set;

@Entity
@Data
public class SupplierEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    long id;
    String companyName;
    String website;
    String supplierLocation;
    String natureOfBusiness;
    @ManyToMany(fetch = FetchType.LAZY,cascade = {CascadeType.DETACH,
            CascadeType.PERSIST,CascadeType.MERGE,CascadeType.REFRESH})
    @JoinTable(name = "SUPPLIER_PROCESS_MAPPING",joinColumns =
    @JoinColumn(name = "supplier_id"),inverseJoinColumns = @JoinColumn(name = "process_id"))
    Set<ManufacturingProcessEntity> processEntities;

}
