/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.validator;

import com.diplomski.njt.bioskop.pokusaj100.domain.User;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author root
 */
@Component
public class UserValidator implements Validator{

    @Override
    public boolean supports(Class<?> type) {
        return User.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user=(User)o;
        System.out.println("Validate object"+user);
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "user.password.empty","");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "user.username.empty","Username is required.");
    
        if(errors.hasErrors()) return;
        
        if(user.getUsername().length()<2){
            errors.rejectValue("username","user.username.short", "");
        }
    
    }
    
}
