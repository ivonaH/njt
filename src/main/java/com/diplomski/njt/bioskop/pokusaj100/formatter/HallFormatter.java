/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.formatter;

import com.diplomski.njt.bioskop.pokusaj100.domain.Hall;
import com.diplomski.njt.bioskop.pokusaj100.service.HallService;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;

/**
 *
 * @author root
 */
public class HallFormatter implements Formatter<Hall> {

  private final  HallService hallService;

  @Autowired
    public HallFormatter(HallService hallService) {
        this.hallService = hallService;
    }

    @Override
    public String print(Hall t, Locale locale) {
        return t.toString();
    }

    @Override
    public Hall parse(String id, Locale locale) throws ParseException {
        System.out.println("Hall formatter");
        return hallService.findById(Integer.parseInt(id));
    }

}
