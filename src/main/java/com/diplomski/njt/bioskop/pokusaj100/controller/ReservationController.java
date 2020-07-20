/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.controller;

import com.diplomski.njt.bioskop.pokusaj100.domain.Movie;
import com.diplomski.njt.bioskop.pokusaj100.domain.Reservation;
import com.diplomski.njt.bioskop.pokusaj100.domain.Showtime;
import com.diplomski.njt.bioskop.pokusaj100.domain.User;
import com.diplomski.njt.bioskop.pokusaj100.service.HallService;
import com.diplomski.njt.bioskop.pokusaj100.service.ReservationService;
import com.diplomski.njt.bioskop.pokusaj100.service.ShowtimeService;
import java.util.List;
import net.kaczmarzyk.spring.data.jpa.domain.GreaterThanOrEqual;
import net.kaczmarzyk.spring.data.jpa.domain.Like;
import net.kaczmarzyk.spring.data.jpa.web.annotation.And;
import net.kaczmarzyk.spring.data.jpa.web.annotation.Spec;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author root
 */
@Controller
//@RequestMapping(value = "/reservation")
public class ReservationController {

    ReservationService reservationService;
    ShowtimeService showtimeService;

    @Autowired
    public ReservationController(ReservationService reservationService, ShowtimeService showtimeService) {
        this.reservationService = reservationService;
        this.showtimeService = showtimeService;
    }

    @RequestMapping(value = "/reservation/save")
    public String save(@SessionAttribute(name = "user") User user, RedirectAttributes redirectAttributes, Reservation reservation) {
        reservation.setUser(user);
        reservationService.save(reservation);
        redirectAttributes.addFlashAttribute("message", "Rezervacija je sacuvana " + user + " res:us " + reservation.getUser());
        return "redirect:/reservation/all";
    }

    @RequestMapping(value = "/reservation/all")
    public String all() {

        return "/reservation/all";
    }

    @RequestMapping(value = "/reservation/new")
    public String newReservation(@RequestParam(value = "showtimeId") int showtimeId, Model model) {
        Showtime s = getShowtimeWithId(showtimeId);
        model.addAttribute("selectedShowtimeId", showtimeId);
        model.addAttribute("reservation", new Reservation());
        return "reservation/new";
    }

    @RequestMapping(value = "/reservation/newR")
    public String newReservation(Model model) {
        model.addAttribute("reservation", new Reservation());
        return "reservation/new";
    }

    @GetMapping(value = "/reservation/find")
    public String findReservations(
            @And({
        @Spec(path = "nameLastname", params = "nameLastname", spec = Like.class),
        @Spec(path = "email", params = "email", spec = Like.class),
        @Spec(path = "showtime.hall.name", params = "hallName", spec = Like.class),
        @Spec(path = "showtime.dateTime", params = "dateTime", spec = GreaterThanOrEqual.class),
        @Spec(path = "showtime.movie.name", params = "movieName", spec = Like.class)
    }) Specification<Reservation> specification, Model model) {
        model.addAttribute("reservations", reservationService.findAll(specification));
        return "reservation/all";
    }

    @ModelAttribute(name = "showtimes")
    private List<Showtime> getShowtimes() {
        return showtimeService.findAll();
    }

    @ModelAttribute(name = "reservations")
    private List<Reservation> getReservations() {
        return reservationService.findAll();
    }

    private Showtime getShowtimeWithId(int showtimeId) {
        return showtimeService.findById(showtimeId);
    }

}
