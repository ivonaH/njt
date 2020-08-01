/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.validator;

import com.diplomski.njt.bioskop.pokusaj100.domain.Reservation;
import java.util.Calendar;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author root
 */
@Component
public class ReservationValidator implements Validator {

    @Override
    public boolean supports(Class<?> type) {
        return Reservation.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nameLastname", "reservation.nameLastname.empty", "");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "reservation.email.empty", "");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "showtime", "reservation.showtime.empty", "");
        if (errors.hasErrors()) {
            return;
        }

    }
}
