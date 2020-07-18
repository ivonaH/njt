/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.repository;

import com.diplomski.njt.bioskop.pokusaj100.domain.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Korisnik
 */
@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Integer> {

//    @Query("SELECT COUNT(r.id) FROM reservation AS r where r.showtimeId=?1")
    int countByShowtimeId(int id);
}