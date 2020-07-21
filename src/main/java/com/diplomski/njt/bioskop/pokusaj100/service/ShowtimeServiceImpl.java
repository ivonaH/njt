/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.service;

import com.diplomski.njt.bioskop.pokusaj100.domain.Showtime;
import com.diplomski.njt.bioskop.pokusaj100.repository.ReservationRepository;
import com.diplomski.njt.bioskop.pokusaj100.repository.ShowtimeRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
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
        List<Showtime> showtimes = showtimeRepository.findAll();
        calculateFreeSeats(showtimes);
        return showtimes;
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
    public List<Showtime> findAll(Specification<Showtime> specification) {
        List<Showtime> showtimes = showtimeRepository.findAll(specification);
        calculateFreeSeats(showtimes);
        return showtimes;
    }

    public void calculateFreeSeats(List<Showtime> showtimes) {
        for (Showtime showtime : showtimes) {
            int numberOfReservations = reservationRepository.countByShowtimeId(showtime.getId());
            showtime.setFreeSeats(showtime.getHall().getCapacity() - numberOfReservations);
            System.out.println("FREE SEATS: " + showtime.getFreeSeats());
        }
    }

}
