package com.saqib.maker_sharks.controller;

import lombok.Data;
import org.springframework.http.HttpStatus;

@Data
public class RestApiCustomError {
   private String message;
    private HttpStatus httpStatus;
    private String error;

}
