/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.service;

import com.diplomski.njt.bioskop.pokusaj100.domain.Hall;
import com.diplomski.njt.bioskop.pokusaj100.domain.Showtime;
import com.diplomski.njt.bioskop.pokusaj100.domain.User;
import java.util.List;

/**
 *
 * @author root
 */
public interface ShowtimeService {

    public List<Showtime> findAll();

    public Showtime findById(int id);

    public void delete(int id);

    public void save(Showtime showtime);


}
