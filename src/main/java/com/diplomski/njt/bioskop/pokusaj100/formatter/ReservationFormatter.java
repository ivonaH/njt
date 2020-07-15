/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.formatter;

import com.diplomski.njt.bioskop.pokusaj100.domain.Reservation;
import com.diplomski.njt.bioskop.pokusaj100.service.ReservationService;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;

/**
 *
 * @author root
 */
public class ReservationFormatter implements Formatter<Reservation> {

  private final  ReservationService reservationService;

  @Autowired
    public ReservationFormatter(ReservationService reservationService) {
        this.reservationService=reservationService;
    }

    @Override
    public String print(Reservation t, Locale locale) {
        return t.toString();
    }

    @Override
    public Reservation parse(String id, Locale locale) throws ParseException {
        System.out.println("reservation formatter");
        return reservationService.findById(Integer.parseInt(id));
    }

}
