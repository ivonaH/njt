/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.validator;

import com.diplomski.njt.bioskop.pokusaj100.domain.Reservation;
import com.diplomski.njt.bioskop.pokusaj100.service.ReservationService;
import java.util.Calendar;
import org.springframework.beans.factory.annotation.Autowired;
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

    private final ReservationService reservationService;

    @Autowired
    public ReservationValidator(ReservationService reservationService) {
        this.reservationService = reservationService;
    }

    @Override
    public boolean supports(Class<?> type) {
        return Reservation.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Reservation reservation = (Reservation) o;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nameLastname", "reservation.nameLastname.empty", "");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "reservation.email.empty", "");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "showtime", "reservation.showtime.empty", "");
        if (errors.hasErrors()) {
            return;
        }
        if (validateEmail(reservation.getEmail())) {
            errors.rejectValue("email", "reservation.email.invalid", "");

        }
        if (errors.hasErrors()) {
            return;
        }

        if (reservation.getNameLastname().split(" ").length < 2) {
            errors.rejectValue("nameLastname", "reservation.nameLastname.empty", "");
        }
        if (errors.hasErrors()) {
            return;
        }

        if (reservation.getNameLastname().split(" ")[0].length() < 2) {
            errors.rejectValue("nameLastname", "reservation.nameLastname.invalid", "");
        }
        if (reservation.getNameLastname().split(" ")[1].length() < 2) {
            errors.rejectValue("nameLastname", "reservation.nameLastname.invalid", "");
        }
        if (errors.hasErrors()) {
            return;
        }
          Calendar cal = Calendar.getInstance();

   
        if(reservation.getShowtime().getDateTime().before(cal.getTime())){
           errors.rejectValue("showtime", "reservation.showtime.inPast", "");

        }
         if (errors.hasErrors()) {
            return;
        }
        if (reservation.getId() == 0) {
            int numberOfReservations = reservationService.countByShowtimeId(reservation.getShowtime().getId());
            System.out.println("NUMBER OF RESERVATIONS IS: " + numberOfReservations);
            if (numberOfReservations >= reservation.getShowtime().getHall().getCapacity()) {
                errors.rejectValue("showtime", "reservation.showtime.isFull", "");
            }

        }
    }

    boolean validateEmail(String email) {
        if (!email.contains("@") || !email.contains(".") || email.charAt(0) == '.'
                || email.charAt(0) == '-' || email.split("@")[0].length() < 2 || email.split("@")[1].length() < 2) {
            return true;
        }
        return false;
    }
}
