/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.validator;

import com.diplomski.njt.bioskop.pokusaj100.domain.MovieMarathon;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author root
 */
@Component
public class MovieMarathonValidator implements Validator {

    @Override
    public boolean supports(Class<?> type) {
        return MovieMarathon.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        MovieMarathon mm=(MovieMarathon)o;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "mm.name.empty", "");
        if (errors.hasErrors()) {
            return;
        }
         if(mm.getName().length()<2){
            errors.rejectValue("name","mm.name.short", "");
        }
    
    }

}
