package com.javabykiran.config;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.h2.server.web.WebServlet;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class ServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] { MyWebConfig.class };
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return null;
	}
	
	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		
		ServletRegistration.Dynamic servlet = servletContext
				.addServlet("h2-console", new WebServlet());
		
		servlet.setLoadOnStartup(2);
		servlet.addMapping("/console/*");
		
		
		super.onStartup(servletContext);
	}

}
