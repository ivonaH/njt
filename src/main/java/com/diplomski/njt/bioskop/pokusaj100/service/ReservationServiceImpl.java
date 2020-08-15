/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.service;

import com.diplomski.njt.bioskop.pokusaj100.domain.Reservation;
import com.diplomski.njt.bioskop.pokusaj100.repository.ReservationRepository;
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
public class ReservationServiceImpl implements ReservationService {

    @Autowired
    ReservationRepository reservationRepository;

    public ReservationServiceImpl() {
    }

    @Override
    public List<Reservation> findAll() {
        return reservationRepository.findAllByOrderByShowtimeDateTimeAscShowtimeIdAscNameLastnameAsc();
    }

    @Override
    public Page<Reservation> findAll(int pageNum) {
        Pageable pageable = PageRequest.of(pageNum, 5, new Sort(Sort.Direction.ASC, "Showtime.DateTime").and(new Sort(Sort.Direction.ASC, "Showtime.Id").and(new Sort(Sort.Direction.ASC, "nameLastname"))));
        return reservationRepository.findAll(pageable);
    }

    @Override
    public Reservation findById(int id) {
        return reservationRepository.findById(id).get();
    }

    @Override
    public void save(Reservation reservation) {
        reservationRepository.save(reservation);
    }

    @Override
    public int countByShowtimeId(int id) {
        return reservationRepository.countByShowtimeId(id);
    }

    @Override
    public Page<Reservation> findAll(Specification<Reservation> specification, int pageNum) {
        Pageable pageable = PageRequest.of(pageNum, 5, new Sort(Sort.Direction.ASC, "Showtime.DateTime").and(new Sort(Sort.Direction.ASC, "Showtime.Id").and(new Sort(Sort.Direction.ASC, "nameLastname"))));
        return reservationRepository.findAll(specification, pageable);
    }

    @Override
    public void delete(int id) {
        reservationRepository.deleteById(id);
    }

}
