/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.controller;

import com.diplomski.njt.bioskop.pokusaj100.domain.MovieMarathon;
import com.diplomski.njt.bioskop.pokusaj100.domain.Showtime;
import com.diplomski.njt.bioskop.pokusaj100.domain.User;
import com.diplomski.njt.bioskop.pokusaj100.service.MovieMarathonService;
import com.diplomski.njt.bioskop.pokusaj100.service.ShowtimeService;
import com.diplomski.njt.bioskop.pokusaj100.validator.MovieMarathonValidator;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import net.kaczmarzyk.spring.data.jpa.domain.GreaterThanOrEqual;
import net.kaczmarzyk.spring.data.jpa.domain.Like;
import net.kaczmarzyk.spring.data.jpa.web.annotation.And;
import net.kaczmarzyk.spring.data.jpa.web.annotation.Join;
import net.kaczmarzyk.spring.data.jpa.web.annotation.Spec;
import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author root
 */
@Controller
@RequestMapping(value = "/mm")
public class MovieMarathonController {

    MovieMarathonService movieMarathonService;
    ShowtimeService showtimeService;

    MovieMarathonValidator marathonValidator;

    @Autowired
    public MovieMarathonController(MovieMarathonService movieMarathonService, ShowtimeService showtimeService, MovieMarathonValidator mv) {
        this.movieMarathonService = movieMarathonService;
        this.showtimeService = showtimeService;
        this.marathonValidator = mv;
    }

    @RequestMapping(value = "/new")
    public String newMM(Model model, HttpSession session) {
        if (session.getAttribute("mm") == null) {
            MovieMarathon mm = new MovieMarathon();
            mm.setName("");
            session.setAttribute("mm", mm);
        }
        model.addAttribute("movieMarathon", session.getAttribute("mm"));
        return "marathon/new";
    }

    @GetMapping(value = "/addShowtime/{showtimeId}")
    public String addShowtime(@PathVariable(name = "showtimeId") int showtimeId, HttpSession session, Model model) {
        if (session.getAttribute("mm") == null) {
            MovieMarathon mm = new MovieMarathon();
            session.setAttribute("mm", mm);
        }
        MovieMarathon mm = (MovieMarathon) session.getAttribute("mm");
        ArrayList<Showtime> showtimes = (ArrayList<Showtime>) mm.getShowtimes();
        Showtime toAdd = showtimeService.findById(showtimeId);
        if (validate(toAdd, model, showtimes)) {
            showtimes.add(toAdd);
            model.addAttribute("mmMessage", "Projekcija je dodata.");
        }
//        model.addAttribute("marathon", mm);
        return "showtime/all";
    }

    @GetMapping(value = "/removeShowtime/{showtimeId}")
    public String removeShowtime(@PathVariable(name = "showtimeId") int showtimeId, HttpSession session, Model model) {
        MovieMarathon mm = (MovieMarathon) session.getAttribute("mm");
        ArrayList<Showtime> showtimes = (ArrayList<Showtime>) mm.getShowtimes();
        Showtime showtimeToRemove = null;
        for (Showtime s : showtimes) {
            if (s.getId() == showtimeId) {
                showtimeToRemove = s;
                break;
            }
        }
        if (showtimeToRemove != null) {
            showtimes.remove(showtimeToRemove);
//            session.setAttribute("mm", mm);

        }

        model.addAttribute("marathon", mm);
        model.addAttribute("mmMessage", "Projekcija je uklonjena sa filmskog maratona.");

        return "marathon/new";
    }

    @PostMapping(value = "/save")
    public String saveMovie(@SessionAttribute(name = "user") User user, @SessionAttribute(name = "mm") MovieMarathon marathonSession, RedirectAttributes redirectAttributes, @Validated MovieMarathon movieMarathon, BindingResult bindingResult, HttpSession session) {
        if (bindingResult.hasErrors()) {

            return "marathon/new";
        }
        ArrayList<Showtime> showtimes = (ArrayList<Showtime>) marathonSession.getShowtimes();

        movieMarathon.setId(1313);
        movieMarathon.setUser(user);
        movieMarathon.setShowtimes(showtimes);
        movieMarathonService.save(movieMarathon);
        redirectAttributes.addFlashAttribute("mmStatus", "Maraton je sacuvan sa projekcijama..." + movieMarathon.getShowtimes());
        session.setAttribute("mm", null);
        return "redirect:/mm/all";
    }

    @GetMapping(value = "/find")
    public String findMM(
            @Join(path = "showtimes", alias = "s")
            @And({
        @Spec(path = "name", params = "name", spec = Like.class),
        @Spec(path = "s.movie.name", params = "movieName", spec = Like.class),
        @Spec(path = "s.dateTime", params = "dateTime", spec = GreaterThanOrEqual.class)
    }) Specification<MovieMarathon> specification, Model model) {
        List<MovieMarathon> mms = movieMarathonService.findAll(specification);
        model.addAttribute("marathons", mms);
        return "marathon/all";
    }

    @RequestMapping(value = "/all")
    public String allMovies(Model model) {
        return "marathon/all";
    }

    @GetMapping(value = "/{id}/view")
    public String delete(@PathVariable(name = "id") int id, Model model) {
        model.addAttribute("mm", movieMarathonService.findById(id));
        return "/marathon/view";
    }

    @ModelAttribute(name = "marathons")
    private List<MovieMarathon> getMM() {
        return movieMarathonService.findAll();
    }

    @ModelAttribute(name = "showtimes")
    private List<Showtime> getShowtimes() {
        return showtimeService.findAll();
    }

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.setValidator(marathonValidator);
    }

    private boolean validate(Showtime toAdd, Model model, List<Showtime> showtimes) {
        if (toAdd.getMovieMarathonId() != 0) {
            model.addAttribute("mmMessage", "Projekcija se vec prikazuje na drugom filmskom maratonu.");
            return false;
        }
        if (showtimes.isEmpty()) {
            return true;
        }
        if (showtimes.contains(toAdd)) {
            model.addAttribute("mmMessage", "Projekcija se vec nalazi na filmskom maratonu.");
            return false;
        }
        if (!validateDateOdShowtime(toAdd, showtimes.get(0))) {
            model.addAttribute("mmMessage", "Sve projekcije na filmskom maratonu moraju biti istog datuma.");
            return false;
        }
        if (!validateMoviesAtShowtimes(toAdd, showtimes)) {
            model.addAttribute("mmMessage", "Projekcija za odabrani film se vec nalazi na filmskom maratonu.");
            return false;
        }
        if (!validateTimeOfShowtime(toAdd, showtimes)) {
            model.addAttribute("mmMessage", "Preklapanje vremena projekcija.");
            return false;
        }
        return true;
    }

    private boolean validateMoviesAtShowtimes(Showtime toAdd, List<Showtime> showtimes) {
        for (int i = 0; i < showtimes.size(); i++) {
            if (showtimes.get(i).getMovie().getId() == toAdd.getMovie().getId()) {
                return false;
            }
        }
        return true;
    }

    private boolean validateDateOdShowtime(Showtime toAdd, Showtime showtime1) {
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if (!sdf.format(toAdd.getDateTime()).equals(sdf.format(showtime1.getDateTime()))) {
            return false;
        }
        return true;
    }

    private boolean validateTimeOfShowtime(Showtime toAdd, List<Showtime> showtimes) {
        Date endOfMovie1 = getEndOfMovie(toAdd);
        Date startOfMovie1 = toAdd.getDateTime();
        for (Showtime showtime : showtimes) {
            Date endOfMovie2 = getEndOfMovie(showtime);
            Date startOfMovie2 = showtime.getDateTime();
            if (endOfMovie1.after(startOfMovie2) && startOfMovie1.before(startOfMovie2)) {
                return false;
            } else if (endOfMovie2.after(startOfMovie1) && startOfMovie2.before(startOfMovie1)) {
                return false;
            } else if (startOfMovie1.equals(startOfMovie2)) {
                return false;
            }
        }
        return true;
    }

    private Date getEndOfMovie(Showtime showtime) {
        Date startOfMovie = showtime.getDateTime();
        int durationInMinutes = showtime.getMovie().getDuration();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(startOfMovie);
        calendar.add(Calendar.MINUTE, durationInMinutes);
        return (Date) calendar.getTime();
    }

    @ModelAttribute(name = "movieMarathon")
    private MovieMarathon getMarathon() {
        return new MovieMarathon();
    }

}
