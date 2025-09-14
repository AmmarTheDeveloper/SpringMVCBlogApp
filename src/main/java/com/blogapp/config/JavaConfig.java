package com.blogapp.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableTransactionManagement // same as <tx:annotation-driven/>
@EnableWebMvc // same as <mvc:annotation-driven />
@ComponentScan(basePackages = { "com.blogapp" }) // same as <context:component-scan>
public class JavaConfig {

	@Bean("MyViewResolver")
	public InternalResourceViewResolver getViewResolver() {
		InternalResourceViewResolver myResolver = new InternalResourceViewResolver();
		myResolver.setPrefix("/WEB-INF/views/");
		myResolver.setSuffix(".jsp");
		return myResolver;
	}

	@Bean("dataSource")
	public DataSource getDataSource() {

		String host = EnvConfig.getDbHost();
		String port = EnvConfig.getDbPort();
		String db = EnvConfig.getDb();
		String user = EnvConfig.getDbUser();
		String pass = EnvConfig.getDbPass();
		
		System.out.println(host);
		System.out.println(port);
		System.out.println(db);
		System.out.println(user);
		System.out.println(pass);
		
		DriverManagerDataSource ds = new DriverManagerDataSource();

		ds.setUrl("jdbc:mysql://" + host + ":" + port + "/" + db);
		ds.setUsername(user);
		ds.setPassword(pass);
		/*
		 * ds.setUrl("jdbc:mysql://localhost:3306/springmvc_project");
		 * ds.setUsername("root"); ds.setPassword("root");
		 */
		ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
		return ds;
	}

	@Bean("factory")
	public LocalSessionFactoryBean getSessionFactory() {
		LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
		factory.setDataSource(getDataSource());
		// instead of mentioning each class , i can use packageScan so it automatically
		// creates bean from package through annotation

//		factory.setAnnotatedClasses(new Class[]{User.class,Blog.class});

		factory.setPackagesToScan("com.blogapp.entities");

		Properties hibernateProperties = new Properties();
		hibernateProperties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
		hibernateProperties.setProperty("hibernate.show_sql", "true");
		hibernateProperties.setProperty("hibernate.hbm2ddl.auto", "update");

		factory.setHibernateProperties(hibernateProperties);

		return factory;
	}

	/*
	 * same as <bean
	 * class="org.springframework.orm.hibernate5.HibernateTransactionManager"
	 * name="transactionManager"> <property name="sessionFactory"
	 * ref="sessionFactory" /> </bean>
	 */
	@Bean
	public HibernateTransactionManager transactionManager() {
		HibernateTransactionManager tx = new HibernateTransactionManager();
		tx.setSessionFactory(getSessionFactory().getObject());
		return tx;
	}

	// for handling multipart request
	// automatically detected
	// same as <bean id="multipartResolver"
	// class="org.springframework.web.multipart.support.StandardServletMultipartResolver"/>
	@Bean("multipartResolver")
	public StandardServletMultipartResolver getMultipartResolver() {
		StandardServletMultipartResolver multipartResolver = new StandardServletMultipartResolver();
		return multipartResolver;
	}

//	dispatcher servlet (front controller) is created by default by spring container but when we need to customize like setting the throw exception if no handler found to true
// but it is deprecated so using by web initializer or web.xml
//	@Bean("dispatcherServlet")
//	DispatcherServlet dispatcherServlet() {
//		DispatcherServlet servlet = new DispatcherServlet();
//		servlet.setThrowExceptionIfNoHandlerFound(true);
//		return servlet;
//		
//	}

}
