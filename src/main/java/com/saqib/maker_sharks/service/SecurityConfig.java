package com.saqib.maker_sharks.service;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.authorizeHttpRequests(configurer
                        ->configurer
                        .requestMatchers(HttpMethod.POST,"/api/supplier/query"
                        ).permitAll()
                        .anyRequest().permitAll());

        http.csrf(csrf->csrf.disable());
        http.httpBasic(Customizer.withDefaults());
        return http.build();
    }
}
