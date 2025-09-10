package com.blogapp.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileHandling {

	public static boolean saveFile(MultipartFile file,FileValidator validator,String path) throws Exception {
		boolean isSaved = false;
		
		if(!validator.isValid(file)) {
			throw new Exception("Invalid File Type");
		}
		
		// Ensure directory exists using File for older versions
//		File dir = new File(path).getParentFile();
//		
//		if(!dir.exists()) {
//			dir.mkdirs(); // creates all missing parent directories mkdir will create only the last parent directory
//		}
		
		//in newer versions & best
		Path dir = Paths.get(path).getParent();
		if(!Files.exists(dir)) {
			Files.createDirectories(dir); // creates all needed parent dirs
		}
		
		try {
		
//		older way to save file
//		FileOutputStream fos = new FileOutputStream(path);
//		fos.write(file.getBytes());
//		fos.close();
		
		// New way to Save file
        Files.write(Paths.get(path), file.getBytes());
        
		}catch (Exception e) {
			// by passing the custom message as well as the exception object, the caller will get the custom message as well as stack trace
			throw new Exception("Error saving file: " + e.getMessage(), e);
		}
		
		isSaved = true;
		return isSaved;
	}
	
}
