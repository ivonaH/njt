/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.repository;

import com.diplomski.njt.bioskop.pokusaj100.domain.Showtime;
import java.util.Date;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Korisnik
 */
@Repository
public interface ShowtimeRepository extends JpaRepository<Showtime, Integer>, JpaSpecificationExecutor<Showtime> {

    public List<Showtime> findByDateTimeAndHallId(Date dateTime, int hallId);

    public List<Showtime> findByHallIdAndDateTimeBetween(int id, Date start, Date end);

    public List<Showtime> findByDateTime(Date date);

    public List<Showtime> findByMovieMarathonIdAndDateTimeGreaterThan(int id, Date dateTime);

    public List<Showtime> findByHallIdAndDateTimeBetweenOrderByDateTimeAsc(int id, Date dateTime, Date endDateTime);

    public List<Showtime> findByMovieMarathonIdAndDateTimeBetweenOrderByDateTimeAsc(int id, Date dateTime, Date endDateTime);

    public List<Showtime> findByMovieMarathonIdAndDateTimeGreaterThan(int id, Date dateTime, Sort sort);

}
