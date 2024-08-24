package com.saqib.maker_sharks;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.saqib.maker_sharks.model.QueryDTO;
import com.saqib.maker_sharks.repository.SupplierRepository;
import com.saqib.maker_sharks.service.SupplierService;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import java.util.List;

import static org.springframework.web.servlet.function.RequestPredicates.param;

@SpringBootTest
@AutoConfigureMockMvc
public class SupplierControllerTest {
    @Autowired
    MockMvc mockMvc;
    @MockBean
    SupplierService supplierService;
    @Test
    public void testQuery() throws Exception{
        QueryDTO queryDTO=new QueryDTO("Mumbai","SmallScale","3d_printing",0,5);

        Page<SupplierRepository.SupplierDetails> mockPages = getSupplierDetails();
        Mockito.when(supplierService.getSuppliersList(queryDTO)).thenReturn(mockPages);
        mockMvc.perform(MockMvcRequestBuilders.post("/api/supplier/query").contentType(MediaType.APPLICATION_JSON).
                        content(new ObjectMapper().writeValueAsString(queryDTO))
        ).andExpect(MockMvcResultMatchers.status().isOk());
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
                return "Kerala";
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
