package com.saqib.maker_sharks.model;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Set;
@Entity
@Data
public class ManufacturingProcessEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    long id;
    String process;
    @ManyToMany(fetch = FetchType.LAZY,cascade = {CascadeType.PERSIST,
            CascadeType.DETACH,CascadeType.MERGE,CascadeType.REFRESH})
    @JoinTable(name = "SUPPLIER_PROCESS_MAPPING",joinColumns =
    @JoinColumn(name = "process_id"),inverseJoinColumns = @JoinColumn(name = "supplier_id"))
    Set<SupplierEntity> suppliers;

}
