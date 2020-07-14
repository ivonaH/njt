/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.formatter;

import com.diplomski.njt.bioskop.pokusaj100.domain.Hall;
import com.diplomski.njt.bioskop.pokusaj100.domain.Movie;
import com.diplomski.njt.bioskop.pokusaj100.service.HallService;
import com.diplomski.njt.bioskop.pokusaj100.service.MovieService;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;

/**
 *
 * @author root
 */
public class MovieFormatter implements Formatter<Movie> {

  private final  MovieService movieService;

  @Autowired
    public MovieFormatter(MovieService movieService) {
        this.movieService=movieService;
    }

    @Override
    public String print(Movie t, Locale locale) {
        return t.toString();
    }

    @Override
    public Movie parse(String id, Locale locale) throws ParseException {
        System.out.println("Movie formatter "+id);
        return movieService.getById(Integer.parseInt(id));
    }

}
