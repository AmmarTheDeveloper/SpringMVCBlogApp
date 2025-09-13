package com.blogapp.utils;

import org.springframework.web.multipart.MultipartFile;

import com.blogapp.config.enums.FileType;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Stream;


// improvement by azhar
public class Validator {
	
    private static final Set<String> IMAGE_EXTENSIONS =new HashSet<>(Arrays.asList("jpg", "jpeg", "png", "gif"));
    private static final Set<String> DOCUMENT_EXTENSIONS =new HashSet<>(Arrays.asList("pdf", "doc", "docx", "txt"));
    private static final Set<String> VIDEO_EXTENSIONS =new HashSet<>(Arrays.asList("mp4", "avi", "mov"));

    public boolean isValid(MultipartFile file, FileType type) {
        
    	if (file == null || file.isEmpty()) return false;

        String fileName = file.getOriginalFilename();
        if (fileName == null || !fileName.contains(".")) return false;

        String extension = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();

        return getAllowedExtensions(type).anyMatch(ext -> ext.equals(extension));
    }

    private Stream<String> getAllowedExtensions(FileType type) {
        switch (type) {
            case IMAGE:
                return IMAGE_EXTENSIONS.stream();
            case DOCUMENT:
                return DOCUMENT_EXTENSIONS.stream();
            case VIDEO:
                return VIDEO_EXTENSIONS.stream();
            case ALL:
                return Stream.of(IMAGE_EXTENSIONS, DOCUMENT_EXTENSIONS, VIDEO_EXTENSIONS).flatMap(Set::stream);
            default:
                return Stream.empty();
        }
    }

 
}

