/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.service;

import com.diplomski.njt.bioskop.pokusaj100.domain.Reservation;
import java.util.List;
import org.springframework.data.jpa.domain.Specification;

/**
 *
 * @author root
 */
public interface ReservationService {

    public List<Reservation> findAll();

    public Reservation findById(int id);

    public void save(Reservation reservation);
    
    public int countByShowtimeId(int id);

    public Object findAll(Specification<Reservation> specification);
}
