package ru.rentalofpremises;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication
public class RentalOfPremisesApplication {

	public static void main(String[] args) {
		SpringApplication.run(RentalOfPremisesApplication.class, args);
	}



}
