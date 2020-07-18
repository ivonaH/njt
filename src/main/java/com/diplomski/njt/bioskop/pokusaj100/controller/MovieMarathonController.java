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
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

    @Autowired
    public MovieMarathonController(MovieMarathonService movieMarathonService, ShowtimeService showtimeService) {
        this.movieMarathonService = movieMarathonService;
        this.showtimeService = showtimeService;
    }

    @RequestMapping(value = "/new")
    public String newMM(Model model, HttpSession session) {
        ArrayList<Showtime> showtimes = new ArrayList<>();
        session.setAttribute("addedShowtimes", new ArrayList<Showtime>());

        return "marathon/new";
    }

    @GetMapping(value = "/addShowtime/{showtimeId}")
    public String addShowtime(@PathVariable(name = "showtimeId") int showtimeId, HttpSession session, Model model) {
        ArrayList<Showtime> showtimes = (ArrayList<Showtime>) session.getAttribute("addedShowtimes");
        showtimes.add(showtimeService.findById(showtimeId));

        model.addAttribute("showtimes", showtimeService.findAll());
        model.addAttribute("mmMessage", "Projekcija je dodata.");

        return "marathon/new";
    }

    @PostMapping(value = "/save")
    public String saveMM(@SessionAttribute(name = "user") User user,MovieMarathon mm, HttpSession session, RedirectAttributes redirectAttributes) {
        mm.setId(1313);
        mm.setUser(user);
        mm.setShowtimes((List<Showtime>) session.getAttribute("addedShowtimes"));
        movieMarathonService.save(mm);
        redirectAttributes.addFlashAttribute("mmStatus", "Maraton je sacuvan.");
        session.setAttribute("addedShowtimes", new ArrayList<Showtime>());
        return "redirect:/mm/all";
    }

    @RequestMapping(value = "/all")
    public String allMovies(Model model) {
//        model.addAttribute("movies", movieService.getAll());
        return "marathon/all";
    }

    @ModelAttribute(name = "marathons")
    private List<MovieMarathon> getMM() {
        return movieMarathonService.findAll();
    }

    @ModelAttribute(name = "showtimes")
    private List<Showtime> getShowtimes() {
        return showtimeService.findAll();
    }

}