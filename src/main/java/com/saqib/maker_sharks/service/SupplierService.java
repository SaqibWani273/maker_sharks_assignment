package com.saqib.maker_sharks.service;

import com.saqib.maker_sharks.model.QueryDTO;
import com.saqib.maker_sharks.model.SupplierEntity;
import com.saqib.maker_sharks.repository.SupplierRepository;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface SupplierService {
    Page<SupplierRepository.SupplierDetails> getSuppliersList(QueryDTO queryDTO);
}
