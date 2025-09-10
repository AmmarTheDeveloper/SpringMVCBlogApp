package com.blogapp.config;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.FrameworkServlet;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import jakarta.servlet.MultipartConfigElement;
import jakarta.servlet.ServletRegistration.Dynamic;

/*
MyWebInitializer is auto-detected because Spring’s SpringServletContainerInitializer scans the classpath
for WebApplicationInitializer implementations and registers it with the servlet container 
*/

public class MyWebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
	
	
	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub	
		return null;
	}

	@Override
	protected String[] getServletMappings() {
		// TODO Auto-generated method stub
		return new String[]{"/"};
	}
	
	
	@Override
	protected Class<?>[] getServletConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] {JavaConfig.class,WebConfig.class};
	}
	
	
	@Override
	protected void customizeRegistration(Dynamic registration) {
		
		// if want custom file size & all then use below
		MultipartConfigElement multipartConfig = new MultipartConfigElement((String) null);
        registration.setMultipartConfig(multipartConfig);
	}
	
	
}
