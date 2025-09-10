package com.blogapp.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalExceptionHandler {
	
	@ResponseStatus(code = HttpStatus.NOT_FOUND)
	@ExceptionHandler(value = NoHandlerFoundException.class)
	public String handleNoHandlerException(NoHandlerFoundException ex,Model m) {
		m.addAttribute("errorType", ex.getClass().getSimpleName());
    	m.addAttribute("errorMessage",  "Requested page: " + ex.getRequestURL() + "Not Found");
		m.addAttribute("path", ex.getRequestURL());

		return "404";
	}
	
    @ExceptionHandler(Exception.class)
	public String handleException(Exception ex, Model m) {
    	m.addAttribute("errorType", ex.getClass().getSimpleName());
    	m.addAttribute("errorMessage",  ex.getMessage());
        return "error";
    }

}
