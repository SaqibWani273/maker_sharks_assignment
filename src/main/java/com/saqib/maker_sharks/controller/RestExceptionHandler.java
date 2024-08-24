package com.saqib.maker_sharks.controller;

import org.springframework.boot.context.config.ConfigDataResourceNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class RestExceptionHandler {

    @ExceptionHandler(value = {ConfigDataResourceNotFoundException.class})
    public  ResponseEntity<Object> handleResourceNotFoundException(Exception exception){
        return ResponseEntity.notFound().build();
    }
    //for now this method would catch and handle all kinds of exceptions
    @ExceptionHandler
    public ResponseEntity<String> handleException(Exception e) {
return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
    //to do: handle other error(custom + others)
}
