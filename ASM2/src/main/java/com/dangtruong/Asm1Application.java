package com.dangtruong;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class Asm1Application {

	public static void main(String[] args) {
		SpringApplication.run(Asm1Application.class, args);
	}

}
