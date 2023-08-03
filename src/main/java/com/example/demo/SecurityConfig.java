package com.example.demo;

import org.springframework.context.annotation.*;
import org.springframework.security.config.annotation.web.builders.*;
import org.springframework.security.config.annotation.web.configuration.*;
import org.springframework.security.web.*;

@EnableWebSecurity
@Configuration
public class SecurityConfig {	
	@Bean
	public SecurityFilterChain filterChaing(HttpSecurity http) throws Exception {
		http.authorizeHttpRequests().antMatchers("/**").permitAll();
		return http.build();
	}
}
