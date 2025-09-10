package com.blogapp.utils;

import org.springframework.web.multipart.MultipartFile;

public interface FileValidator {

	public boolean isValid(MultipartFile file);
	
}
