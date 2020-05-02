package com.javabykiran.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@ComponentScan({ "com.javabykiran" })
@PropertySource(value = { "classpath:jdbc.properties" })
public class MyHibernateConfig {

	/*
	 * @Autowired private Environment environment;
	 * 
	 * @Bean public LocalSessionFactoryBean sessionFactory() {
	 * LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
	 * sessionFactory.setDataSource(dataSource());
	 * sessionFactory.setPackagesToScan(new String[] { "com.javabykiran" });
	 * sessionFactory.setHibernateProperties(hibernateProperties()); return
	 * sessionFactory; }
	 * 
	 * @Bean public DataSource dataSource() { DriverManagerDataSource dataSource =
	 * new DriverManagerDataSource();
	 * dataSource.setDriverClassName(environment.getRequiredProperty(
	 * "jdbc.driverClassName"));
	 * dataSource.setUrl(environment.getRequiredProperty("jdbc.url"));
	 * dataSource.setUsername(environment.getRequiredProperty("jdbc.username"));
	 * dataSource.setPassword(environment.getRequiredProperty("jdbc.password"));
	 * return dataSource; }
	 * 
	 * 
	 * @Bean public DataSource dataSource1() { return new
	 * EmbeddedDatabaseBuilder().generateUniqueName(false).setName("test").setType(
	 * EmbeddedDatabaseType.H2)
	 * .addDefaultScripts().setScriptEncoding("UTF-8").ignoreFailedDrops(true).build
	 * ();
	 * 
	 * }
	 * 
	 * private Properties hibernateProperties() { Properties properties = new
	 * Properties(); properties.put("hibernate.dialect",
	 * environment.getRequiredProperty("hibernate.dialect"));
	 * properties.put("hibernate.show_sql",
	 * environment.getRequiredProperty("hibernate.show_sql"));
	 * properties.put("hibernate.format_sql",
	 * environment.getRequiredProperty("hibernate.format_sql")); return properties;
	 * }
	 * 
	 * @Bean
	 * 
	 * @Autowired public HibernateTransactionManager
	 * transactionManager(SessionFactory s) { HibernateTransactionManager txManager
	 * = new HibernateTransactionManager(); txManager.setSessionFactory(s); return
	 * txManager; }
	 */
	
	
	private static final String PROPERTY_NAME_DATABASE_DRIVER = "hibernate.connection.driver_class";
    private static final String PROPERTY_NAME_DATABASE_PASSWORD = "hibernate.connection.password";
    private static final String PROPERTY_NAME_DATABASE_URL = "hibernate.connection.url";
    private static final String PROPERTY_NAME_DATABASE_USERNAME = "hibernate.connection.username";

    private static final String PROPERTY_NAME_HIBERNATE_DIALECT = "hibernate.dialect";
    private static final String PROPERTY_NAME_HIBERNATE_SHOW_SQL = "hibernate.show_sql";
    private static final String PROPERTY_NAME_ENTITYMANAGER_PACKAGES_TO_SCAN = "entitymanager.packages.to.scan";

    @Autowired
    private Environment env;

    @Bean
    public DataSource dataSource() {

        DriverManagerDataSource dataSource = new DriverManagerDataSource();

        dataSource.setDriverClassName(env.getRequiredProperty(PROPERTY_NAME_DATABASE_DRIVER));
        dataSource.setUrl(env.getRequiredProperty(PROPERTY_NAME_DATABASE_URL));
        dataSource.setUsername(env.getRequiredProperty(PROPERTY_NAME_DATABASE_USERNAME));
        dataSource.setPassword(env.getRequiredProperty(PROPERTY_NAME_DATABASE_PASSWORD));

        return dataSource;
    }

    @Bean
    public LocalSessionFactoryBean sessionFactory() {
        LocalSessionFactoryBean sessionFactoryBean = new LocalSessionFactoryBean();
        sessionFactoryBean.setDataSource(dataSource());
        sessionFactoryBean.setPackagesToScan(env.getRequiredProperty(PROPERTY_NAME_ENTITYMANAGER_PACKAGES_TO_SCAN));
        sessionFactoryBean.setHibernateProperties(hibProperties());
        return sessionFactoryBean;
    }

    private Properties hibProperties() {
        Properties properties = new Properties();
        properties.put(PROPERTY_NAME_HIBERNATE_DIALECT, env.getRequiredProperty(PROPERTY_NAME_HIBERNATE_DIALECT));
        properties.put(PROPERTY_NAME_HIBERNATE_SHOW_SQL, env.getRequiredProperty(PROPERTY_NAME_HIBERNATE_SHOW_SQL));
        properties.put("hibernate.format_sql", env.getRequiredProperty("hibernate.format_sql"));
        properties.put("hibernate.hbm2ddl.auto", env.getRequiredProperty("hibernate.hbm2ddl.auto"));
        properties.put("hibernate.hbm2ddl.import_files", "initial.sql");

        return properties;
    }

    @Bean
    @Autowired
    public HibernateTransactionManager transactionManager(SessionFactory s) {
        HibernateTransactionManager txManager = new HibernateTransactionManager();
        txManager.setSessionFactory(s);
        return txManager;
    }

}
