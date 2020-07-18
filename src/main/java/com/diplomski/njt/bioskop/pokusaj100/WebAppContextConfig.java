/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100;

import com.diplomski.njt.bioskop.pokusaj100.formatter.HallFormatter;
import com.diplomski.njt.bioskop.pokusaj100.formatter.MovieFormatter;
import com.diplomski.njt.bioskop.pokusaj100.formatter.ReservationFormatter;
import com.diplomski.njt.bioskop.pokusaj100.formatter.ShowtimeFormatter;
import com.diplomski.njt.bioskop.pokusaj100.service.HallService;
import com.diplomski.njt.bioskop.pokusaj100.service.MovieService;
import com.diplomski.njt.bioskop.pokusaj100.service.ReservationService;
import com.diplomski.njt.bioskop.pokusaj100.service.ShowtimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.MessageSource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

/**
 *
 * @author root
 */
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {
    "com.diplomski.njt.bioskop.pokusaj100"})
public class WebAppContextConfig implements WebMvcConfigurer {
//    //definisanje handler mapera, view resolvera
//

    private final HallService hallService;
    private final MovieService movieService;
    private final ShowtimeService showtimeService;
    private final ReservationService reservationService;

    @Autowired
    WebAppContextConfig(HallService hallService, MovieService movieService, ShowtimeService showtimeService, ReservationService reservationService) {
        this.hallService = hallService;
        this.movieService = movieService;
        this.reservationService = reservationService;
        this.showtimeService = showtimeService;
    }

    @Bean
    public ViewResolver createViewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/pages/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/webjars/**").addResourceLocations("/webjars/");
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
    }

//    @Bean
//    public MessageSource messageSource() {
//        ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
//        messageSource.setBasenames("validation");
//        return messageSource;
//    }
//
//    @Override
//    public void addFormatters(FormatterRegistry registry) {
//        registry.addFormatter(new CountryDtoFormater(countryService));
//    }
    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addFormatter(new HallFormatter(hallService));
        registry.addFormatter(new MovieFormatter(movieService));
        registry.addFormatter(new ShowtimeFormatter(showtimeService));
        registry.addFormatter(new ReservationFormatter(reservationService));
        registry.addFormatter(new DateFormatter("yyyy-MM-dd HH:mm:ss"));

    }

}
