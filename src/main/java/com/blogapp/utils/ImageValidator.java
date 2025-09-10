package com.blogapp.utils;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ImageValidator implements FileValidator {
	
	// static so only gets memory once, because it will be constant & private so not accessed from outside the class
	 private static final List<String> ALLOWED_TYPES = List.of(
		        "image/png", "image/jpeg", "image/jpg", "image/jfif", "image/gif"
		    );

	@Override
	public boolean isValid(MultipartFile file) {
		boolean isValidFile = true;

		
		if (!ALLOWED_TYPES.contains(file.getContentType())) {
			isValidFile = false;
		}
		
		return isValidFile;
	}

}
