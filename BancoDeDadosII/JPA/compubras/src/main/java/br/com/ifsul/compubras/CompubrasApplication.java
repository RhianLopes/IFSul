package br.com.ifsul.compubras;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import javax.annotation.PostConstruct;
import java.util.TimeZone;

@SpringBootApplication
public class CompubrasApplication {

	// Resoluções do exercício JPQL em ExercicioServiceImpl
	public static void main(String[] args) {
		SpringApplication.run(CompubrasApplication.class, args);
	}

	@PostConstruct
	public void init() {
		TimeZone.setDefault(TimeZone.getTimeZone("America/Belem"));
	}
}
