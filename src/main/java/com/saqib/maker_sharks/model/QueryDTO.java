package com.saqib.maker_sharks.model;

import lombok.Data;
import org.springframework.lang.NonNull;

@Data
public class QueryDTO{
    @NonNull
    String locationName;
    @NonNull
    String natureOfBusiness;
    @NonNull
    String process;
    @NonNull
    int pageNumber;
    @NonNull
    int pageSize;

}
