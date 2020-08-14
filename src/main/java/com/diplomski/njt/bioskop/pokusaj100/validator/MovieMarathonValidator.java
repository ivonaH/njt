/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.validator;

import com.diplomski.njt.bioskop.pokusaj100.domain.MovieMarathon;
import com.diplomski.njt.bioskop.pokusaj100.domain.Showtime;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

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
        MovieMarathon mm = (MovieMarathon) o;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "movieMarathon.name.empty", "Ime je prazno");
         if (errors.hasErrors()) {
            return;
        }
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession();
        if (session.getAttribute("mm") != null) {
            MovieMarathon mar = (MovieMarathon) session.getAttribute("mm");
            ArrayList<Showtime> showtimes = (ArrayList<Showtime>) mar.getShowtimes();
            if (showtimes.size() < 2) {
                errors.rejectValue("name", "movieMarathon.showtimes.size", "");

            }
        }

        if (errors.hasErrors()) {
            return;
        }
        if (mm.getName().length() < 2) {
            errors.rejectValue("name", "movieMarathon.name.short", "");
        }

    }

}
