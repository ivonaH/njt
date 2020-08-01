/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.validator;

import com.diplomski.njt.bioskop.pokusaj100.domain.Movie;
import java.util.Calendar;
import java.util.Date;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author root
 */
@Component
public class MovieValidator implements Validator {

    @Override
    public boolean supports(Class<?> type) {
        return Movie.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Movie movie = (Movie) o;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "movie.name.empty", "");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "genre", "movie.genre.empty", "");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "director", "movie.director.empty", "");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "duration", "movie.duration.empty", "");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "year", "movie.year.empty", "");

        if (movie.getYear() < 1878 || movie.getYear() > Calendar.getInstance().get(Calendar.YEAR) + 2) {
            errors.rejectValue("year", "movie.year.invalid", "");
        }

        if (movie.getDuration() > 300 || movie.getDuration() < 15) {
            errors.rejectValue("duration", "movie.duration.invalid", "");
        }
        if (errors.hasErrors()) {
            return;
        }

        if (movie.getDirector().split(" ").length < 2) {
            errors.rejectValue("director", "movie.director.invalid", "");
        }
        if (errors.hasErrors()) {
            return;
        }

        if (movie.getDirector().split(" ")[0].length() < 2) {
            errors.rejectValue("director", "movie.director.short", "");
        }
        if (movie.getDirector().split(" ")[1].length() < 2) {
            errors.rejectValue("director", "movie.director.short", "");
        }

    }

}
