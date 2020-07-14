/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.domain;

import java.security.Timestamp;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import org.hibernate.annotations.GeneratorType;

/**
 *
 * @author root
 */
@Entity
public class Showtime {

    @Id
    private int id;
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

    @Override
    public String toString() {
        return "Showtime{" + "id=" + id + ", dateTime=" + dateTime + ", hall=" + hall + ", user=" + user + ", movie=" + movie + '}';
    }
    
    

}
