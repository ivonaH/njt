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
import com.diplomski.njt.bioskop.pokusaj100.formatter.UserFormatter;
import com.diplomski.njt.bioskop.pokusaj100.service.HallService;
import com.diplomski.njt.bioskop.pokusaj100.service.MovieService;
import com.diplomski.njt.bioskop.pokusaj100.service.ReservationService;
import com.diplomski.njt.bioskop.pokusaj100.service.ShowtimeService;
import com.diplomski.njt.bioskop.pokusaj100.service.UserService;
import java.util.List;
import net.kaczmarzyk.spring.data.jpa.web.SpecificationArgumentResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

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
    private final UserService userService;

    @Autowired
    WebAppContextConfig(HallService hallService, MovieService movieService, ShowtimeService showtimeService, ReservationService reservationService, UserService userService) {
        this.hallService = hallService;
        this.movieService = movieService;
        this.reservationService = reservationService;
        this.showtimeService = showtimeService;
        this.userService = userService;
    }

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
        argumentResolvers.add(new SpecificationArgumentResolver());
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
        registry.addFormatter(new UserFormatter(userService));

    }

}
