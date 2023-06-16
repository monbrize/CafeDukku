package com.caduk.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages= {"com.caduk"})
public class CafeDukkuApplication {

	public static void main(String[] args) {
		SpringApplication.run(CafeDukkuApplication.class, args);
	}

}
