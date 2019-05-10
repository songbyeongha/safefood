package com.ssafy.config;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
public class ApplicationConfig
{

	/*
	 * @Bean public SqlSessionTemplate template(SqlSessionFactoryBean factory)
	 * throws Exception { return new SqlSessionTemplate(factory.getObject()); }
	 */
	
	// 트랜젝션 매니저: 이 메서드의 이름은 고유함
	@Bean
	public PlatformTransactionManager transactionManager(DataSource ds)
	{
		return new DataSourceTransactionManager(ds);
	}
}