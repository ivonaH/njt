package com.diplomski.njt.bioskop.pokusaj100;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.diplomski.njt.bioskop.pokusaj100.config.DatabaseConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

/**
 *
 * @author Korisnik
 */
@Configuration
@Import(DatabaseConfiguration.class)
@ComponentScan(basePackages = {"com.diplomski.njt.bioskop.pokusaj100"})
@EnableJpaRepositories(basePackages = "com.diplomski.njt.bioskop.pokusaj100.repository")
@EnableWebMvc
@EnableTransactionManagement
public class ApplicationConfiguration {

    
}
