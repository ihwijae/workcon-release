package com.WorkConGW;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;


@EnableScheduling
@ServletComponentScan
@SpringBootApplication
//@ComponentScan(basePackages = "com.WorkConGW")
public class WorkConGwApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(WorkConGwApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(WorkConGwApplication.class, args);
	}

}
