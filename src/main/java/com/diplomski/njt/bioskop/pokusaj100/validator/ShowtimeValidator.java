/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.validator;

import com.diplomski.njt.bioskop.pokusaj100.domain.Showtime;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author root
 */
@Component
public class ShowtimeValidator implements Validator {

    @Override
    public boolean supports(Class<?> type) {
        return Showtime.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "movie", "showtime.movie.empty", "");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "hall", "showtime.hall.empty", "");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dateTime", "showtime.dateTime.empty", "");

         if (errors.hasErrors()) {
            return;
        }
        
    }
    
}
