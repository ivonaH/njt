/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.domain;

import java.security.Timestamp;
import java.util.Date;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import org.hibernate.annotations.GeneratorType;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author root
 */
@Entity
public class Showtime {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date dateTime;
    @ManyToOne
    @JoinColumn(name = "hallId")
    private Hall hall;
    @ManyToOne
    @JoinColumn(name = "userId")
    private User user;
    @ManyToOne
    @JoinColumn(name = "movieId")
    private Movie movie;
    @Column(name = "marathonId")
    int movieMarathonId;

    public Showtime(int id, Date dateTime, Hall hall, User user, Movie movie) {
        this.id = id;
        this.dateTime = dateTime;
        this.hall = hall;
        this.user = user;
        this.movie = movie;
    }

    public Showtime() {
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    public Hall getHall() {
        return hall;
    }

    public void setHall(Hall hall) {
        this.hall = hall;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public int getMovieMarathonId() {
        return movieMarathonId;
    }

    public void setMovieMarathonId(int movieMarathonId) {
        this.movieMarathonId = movieMarathonId;
    }

    public int getMovieMarathon() {
        return movieMarathonId;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Showtime other = (Showtime) obj;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

}
