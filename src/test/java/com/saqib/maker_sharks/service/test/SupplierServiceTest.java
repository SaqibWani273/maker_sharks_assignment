package com.saqib.maker_sharks.service.test;


import com.saqib.maker_sharks.model.QueryDTO;
import com.saqib.maker_sharks.repository.SupplierRepository;
import com.saqib.maker_sharks.service.SupplierService;
import com.saqib.maker_sharks.service.SupplierServiceImpl;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.Arrays;
import java.util.List;

@SpringBootTest
@ExtendWith(MockitoExtension.class)
public class SupplierServiceTest {
@InjectMocks
SupplierServiceImpl supplierService;
@Mock
    SupplierRepository supplierRepository;
@Test
    public void testQuery(){
    String location = "Mumbai";
    String nature = "SmallScale";
    String process = "3d_printing";
    Pageable pageable = PageRequest.of(0, 5);
    QueryDTO queryDTO=new QueryDTO("Mumbai","SmallScale",
            "3d_printing",0,5);

    Page<SupplierRepository.SupplierDetails> mockPages = getSupplierDetails();
    Mockito.when(supplierRepository.findAllBySupplierQuery(location,nature,process,pageable)).thenReturn(mockPages);
Page<SupplierRepository.SupplierDetails> result=
        supplierService.getSuppliersList(queryDTO);
assertNotNull(result);
    assertEquals("Mumbai",result.getContent().getFirst().getSupplier_location());

}

    private static Page<SupplierRepository.SupplierDetails> getSupplierDetails() {
        List<SupplierRepository.SupplierDetails> supplierDetailsList= List.of(new SupplierRepository.SupplierDetails() {
            @Override
            public String getCompany_name() {
                return "ABC Company";
            }

            @Override
            public String getWebsite() {
                return "www.123.com";
            }

            @Override
            public String getSupplier_location() {
                return "Mumbai";
            }

            @Override
            public String getNature_of_business() {
                return "SmallScale";
            }

            @Override
            public String getProcess() {
                return "3d_printing";
            }
        });
        Page<SupplierRepository.SupplierDetails> mockPages =new PageImpl<>(supplierDetailsList);
        return mockPages;
    }
}
