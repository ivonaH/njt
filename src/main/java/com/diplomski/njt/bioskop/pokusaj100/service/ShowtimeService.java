/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.service;

import com.diplomski.njt.bioskop.pokusaj100.domain.Showtime;
import java.util.Date;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;

/**
 *
 * @author root
 */
public interface ShowtimeService {

    public List<Showtime> findAll();

    public Page<Showtime> findAll(int pageNum);

    public Showtime findById(int id);

    public void delete(int id);

    public void save(Showtime showtime);

    public Page<Showtime> findAll(Specification<Showtime> specification, int pageNum);

    public List<Showtime> findByDateTimeAndHallId(Date dateTime, int hallId);

    List<Showtime> findByMarathonIdAndDateTimeGreaterThanEqual(int marathonId, Date dateTime);

    public List<Showtime> findByHallIdAndDateTimeBetween(int id, Date dateTime, Date endDateTime);

}
