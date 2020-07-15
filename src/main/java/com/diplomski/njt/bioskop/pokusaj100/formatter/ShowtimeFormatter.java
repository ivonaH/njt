/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.formatter;

import com.diplomski.njt.bioskop.pokusaj100.domain.Showtime;
import com.diplomski.njt.bioskop.pokusaj100.service.ShowtimeService;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;

/**
 *
 * @author root
 */
public class ShowtimeFormatter implements Formatter<Showtime> {

    private final ShowtimeService showtimeService;

    @Autowired
    public ShowtimeFormatter(ShowtimeService showtimeService) {
        this.showtimeService = showtimeService;
    }

    @Override
    public String print(Showtime t, Locale locale) {
        return t.toString();
    }

    @Override
    public Showtime parse(String id, Locale locale) throws ParseException {
        System.out.println("reservation formatter");
        return showtimeService.findById(Integer.parseInt(id));
    }

}
