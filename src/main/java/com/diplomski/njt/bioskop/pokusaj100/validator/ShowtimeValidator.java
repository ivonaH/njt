/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.validator;

import com.diplomski.njt.bioskop.pokusaj100.domain.Showtime;
import com.diplomski.njt.bioskop.pokusaj100.service.ShowtimeService;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class ShowtimeValidator implements Validator {

    private final ShowtimeService showtimeService;

    @Autowired
    public ShowtimeValidator(ShowtimeService showtimeService) {
        this.showtimeService = showtimeService;
    }

    @Override
    public boolean supports(Class<?> type) {
        return Showtime.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Showtime showtime = (Showtime) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "movie", "showtime.movie.empty", "");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "hall", "showtime.hall.empty", "");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dateTime", "showtime.dateTime.empty", "");

        if (errors.hasErrors()) {
            return;
        }

        Calendar cal = Calendar.getInstance();

        if (showtime.getDateTime().before(cal.getTime())) {
            errors.rejectValue("dateTime", "showtime.dateTime.inPast", "");
        }

        if (errors.hasErrors()) {
            return;
        }

//        List<Showtime> showtimes = showtimeService.findByDateTimeAndHallId(showtime.getDateTime(), showtime.getHall().getId());
        //findAllByStartDateLessThanEqualAndEndDateGreaterThanEqual
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(showtime.getDateTime());
        calendar.add(Calendar.MINUTE, showtime.getMovie().getDuration());
        List<Showtime> showtimes = showtimeService.findByHallIdAndDateTimeBetween(showtime.getHall().getId(), showtime.getDateTime(), (Date) calendar.getTime());
        if (!showtimes.isEmpty()) {
            errors.rejectValue("dateTime", "showtime.hall.occupied", "");
        }
         if (errors.hasErrors()) {
            return;
        }
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        showtimes = showtimeService.findByHallIdAndDateTimeBetween(showtime.getHall().getId(), (Date) calendar.getTime(), showtime.getDateTime());
        if (!showtimes.isEmpty()) {
            for (Showtime s : showtimes) {
                calendar.setTime(s.getDateTime());
                calendar.add(Calendar.MINUTE, s.getMovie().getDuration());
                if (((Date) calendar.getTime()).after(showtime.getDateTime())) {
                    errors.rejectValue("hall", "showtime.hall.occupied", "");
                    return;
                }
            }
        }
    }

}