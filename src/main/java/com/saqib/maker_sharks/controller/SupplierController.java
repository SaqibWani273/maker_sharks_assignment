package com.saqib.maker_sharks.controller;

import com.saqib.maker_sharks.model.QueryDTO;
import com.saqib.maker_sharks.service.SupplierService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/supplier")
@Tag(name = "Supplier API", description = "API for searching suppliers")
public class SupplierController {
    @Autowired
SupplierService supplierService;
    @PostMapping("/query")
    @Operation(summary = "Search suppliers by criteria", description =
            "Fetch suppliers by location, nature of business, and manufacturing process")
    ResponseEntity<?> query(@RequestBody QueryDTO queryDto){
        return ResponseEntity.ok(supplierService.getSuppliersList(queryDto));
    }
}
