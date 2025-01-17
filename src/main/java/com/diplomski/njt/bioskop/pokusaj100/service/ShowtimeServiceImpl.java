/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.service;

import com.diplomski.njt.bioskop.pokusaj100.domain.Showtime;
import com.diplomski.njt.bioskop.pokusaj100.repository.ReservationRepository;
import com.diplomski.njt.bioskop.pokusaj100.repository.ShowtimeRepository;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author root
 */
@Service
@Transactional
public class ShowtimeServiceImpl implements ShowtimeService {

    @Autowired
    ShowtimeRepository showtimeRepository;
    @Autowired
    ReservationRepository reservationRepository;

    public ShowtimeServiceImpl() {
    }

    @Override
    public List<Showtime> findAll() {
        List<Showtime> showtimes = showtimeRepository.findAll(Sort.by(Sort.Direction.ASC, "DateTime"));
        return showtimes;
    }

    @Override
    public Page<Showtime> findAll(int pageNum) {
        Pageable pageable = PageRequest.of(pageNum, 5, new Sort(Sort.Direction.ASC, "DateTime"));
        return showtimeRepository.findAll(pageable);
    }

    @Override
    public Showtime findById(int id) {
        return showtimeRepository.findById(id).get();
    }

    @Override
    public void delete(int i) {
        showtimeRepository.deleteById(i);
    }

    @Override
    public void save(Showtime showtime) {
        showtimeRepository.save(showtime);
    }

    @Override
    public Page<Showtime> findAll(Specification<Showtime> specification, int pageNum) {
        Pageable pageable = PageRequest.of(pageNum, 5, new Sort(Sort.Direction.ASC, "DateTime"));
        return showtimeRepository.findAll(specification, pageable);
    }

    @Override
    public List<Showtime> findByDateTimeAndHallId(Date dateTime, int hallId) {
        return showtimeRepository.findByDateTimeAndHallId(dateTime, hallId);
    }

    @Override
    public List<Showtime> findByHallIdAndDateTimeBetween(int id, Date dateTime, Date endDateTime) {
        return showtimeRepository.findByHallIdAndDateTimeBetween(id, dateTime, endDateTime);
    }


    @Override
    public List<Showtime> findByMarathonIdAndDateTimeGreaterThanEqual(int id, Date dateTime) {
        return showtimeRepository.findByMovieMarathonIdAndDateTimeGreaterThan(id, dateTime, new Sort(Sort.Direction.ASC, "DateTime"));
    }

}
