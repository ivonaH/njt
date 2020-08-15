/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.controller;

import com.diplomski.njt.bioskop.pokusaj100.domain.Reservation;
import com.diplomski.njt.bioskop.pokusaj100.domain.Showtime;
import com.diplomski.njt.bioskop.pokusaj100.domain.User;
import com.diplomski.njt.bioskop.pokusaj100.service.ReservationService;
import com.diplomski.njt.bioskop.pokusaj100.service.ShowtimeService;
import com.diplomski.njt.bioskop.pokusaj100.validator.ReservationValidator;
import java.util.List;
import net.kaczmarzyk.spring.data.jpa.domain.GreaterThanOrEqual;
import net.kaczmarzyk.spring.data.jpa.domain.Like;
import net.kaczmarzyk.spring.data.jpa.web.annotation.And;
import net.kaczmarzyk.spring.data.jpa.web.annotation.Spec;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author root
 */
@Controller
@RequestMapping(value = "/reservation")
public class ReservationController {

    ReservationService reservationService;
    ShowtimeService showtimeService;

    ReservationValidator reservationValidator;

    @Autowired
    public ReservationController(ReservationService reservationService, ShowtimeService showtimeService, ReservationValidator reservationValidator) {
        this.reservationService = reservationService;
        this.showtimeService = showtimeService;
        this.reservationValidator = reservationValidator;
    }

    @RequestMapping(value = "/save")
    public String save(@SessionAttribute(name = "user") User user, RedirectAttributes redirectAttributes, @Validated Reservation reservation, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "/reservation/new";
        }
        reservation.setUser(user);
        reservationService.save(reservation);
        redirectAttributes.addFlashAttribute("message", "Rezervacija je sacuvana " + user + " res:us " + reservation.getUser());
        return "redirect:/reservation/all";
    }

    @PostMapping(value = "/edit")
    public String save(RedirectAttributes redirectAttributes, @Validated Reservation reservation, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
           model.addAttribute("errorMessage", "Unesite email.");
            model.addAttribute("reservation", reservationService.findById(reservation.getId()));
            return "/reservation/view";
        }
        reservationService.save(reservation);
        redirectAttributes.addFlashAttribute("message", "Rezervacija je izmenjena.");
        return "redirect:/reservation/all/1";
    }

    @RequestMapping(value = "/all/{pageNum}")
    public String all(@PathVariable(name = "pageNum") int pageNum, Model model) {
        Page<Reservation> page = reservationService.findAll(pageNum-1);
        List<Reservation> reservations = page.getContent();
        model.addAttribute("reservations", reservations);
        model.addAttribute("currentPage", pageNum);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        return "/reservation/all";
    }

    @RequestMapping(value = "/new")
    public String newReservation(@RequestParam(value = "showtimeId") int showtimeId, Model model) {
        Showtime s = getShowtimeWithId(showtimeId);
        model.addAttribute("selectedShowtimeId", showtimeId);
        model.addAttribute("reservation", new Reservation());
        return "reservation/new";
    }

    @RequestMapping(value = "/newR")
    public String newReservation(Model model) {
        model.addAttribute("reservation", new Reservation());
        return "reservation/new";
    }

    @GetMapping(value = "/find/{pageNum}")
    public String findReservations(
            @PathVariable(name = "pageNum") int pageNum,
            @And({
        @Spec(path = "nameLastname", params = "nameLastname", spec = Like.class),
        @Spec(path = "email", params = "email", spec = Like.class),
        @Spec(path = "showtime.hall.name", params = "hallName", spec = Like.class),
        @Spec(path = "showtime.dateTime", params = "dateTime", spec = GreaterThanOrEqual.class),
        @Spec(path = "showtime.movie.name", params = "movieName", spec = Like.class)
    }) Specification<Reservation> specification, Model model) {
        Page<Reservation> page = reservationService.findAll(specification,pageNum-1);
        List<Reservation> reservations = page.getContent();
        model.addAttribute("reservations", reservations);
        model.addAttribute("currentPage", pageNum);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        return "reservation/all";
    }

    @GetMapping(value = "/{id}/delete")
    public ModelAndView delete(@PathVariable(name = "id") int id, RedirectAttributes redirectAttributes) {
        reservationService.delete(id);
        ModelAndView modelAndView = new ModelAndView("redirect:/reservation/all/1");
        redirectAttributes.addFlashAttribute("message", "Rezervacija sa idijem: " + id + " je obrisana.");
        return modelAndView;
    }

    @GetMapping(value = "/{id}/view")
    public String delete(@PathVariable(name = "id") int id, Model model) {
        model.addAttribute("reservation", reservationService.findById(id));
        return "/reservation/view";
    }

    @ModelAttribute(name = "showtimes")
    private List<Showtime> getShowtimes() {
        return showtimeService.findAll();
    }


    private Showtime getShowtimeWithId(int showtimeId) {
        return showtimeService.findById(showtimeId);
    }

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.setValidator(reservationValidator);
    }

}
