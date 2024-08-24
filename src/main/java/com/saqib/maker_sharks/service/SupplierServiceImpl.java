package com.saqib.maker_sharks.service;

import com.saqib.maker_sharks.model.ManufacturingProcessEntity;
import com.saqib.maker_sharks.model.QueryDTO;
import com.saqib.maker_sharks.model.SupplierEntity;
import com.saqib.maker_sharks.repository.SupplierRepository;
//import org.hibernate.query.Page;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

//import java.awt.print.Pageable;

@Service
public class SupplierServiceImpl implements SupplierService{
    @Autowired
    SupplierRepository supplierRepository;
    @Override
    public Page<SupplierRepository.SupplierDetails> getSuppliersList(QueryDTO query) {

        Pageable pageable = PageRequest.of(query.getPageNumber(), query.getPageSize());
       return supplierRepository.findAllBySupplierQuery(query.getLocationName(),
                query.getNatureOfBusiness(), query.getProcess(),pageable);

    }
}
