/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.controller;

import com.diplomski.njt.bioskop.pokusaj100.domain.Hall;
import com.diplomski.njt.bioskop.pokusaj100.domain.Movie;
import com.diplomski.njt.bioskop.pokusaj100.domain.Showtime;
import com.diplomski.njt.bioskop.pokusaj100.domain.User;
import com.diplomski.njt.bioskop.pokusaj100.service.HallService;
import com.diplomski.njt.bioskop.pokusaj100.service.MovieService;
import com.diplomski.njt.bioskop.pokusaj100.service.ShowtimeService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
@RequestMapping(value = "/showtime")
public class ShowtimeController {

    ShowtimeService showtimeService;
    MovieService movieService;
    HallService hallService;

    @Autowired
    public ShowtimeController(ShowtimeService showtimeService, MovieService movieService, HallService hallService) {
        this.showtimeService = showtimeService;
        this.movieService = movieService;
        this.hallService = hallService;
    }

    @RequestMapping(value = "/all")
    public String allHalls(Model model) {
        return "showtime/all";
    }

    @GetMapping(value = "/{id}/delete")
    public ModelAndView delete(@PathVariable(name = "id") int id, RedirectAttributes redirectAttributes) {
        showtimeService.delete(id);
        ModelAndView modelAndView = new ModelAndView("redirect:/showtime/all");
        redirectAttributes.addFlashAttribute("message", "Projekcija sa idijem: " + id + " je obrisana.");
        return modelAndView;
    }

    @GetMapping(value = "/new")
    public String newShowtime(@RequestParam(value = "movieId") int movieId, Model model) {
        Movie m = getMovieWithId(movieId);
        System.out.println("Movie je:" + m);
        model.addAttribute("showtime", new Showtime());
        model.addAttribute("selectedMovieId", movieId);
        return "showtime/new";
    }

    @PostMapping(value = "/save")
    public String saveShowtime(@SessionAttribute(name = "user") User user, Showtime showtime, Model model) {
        System.out.println("Projekcija je:" + showtime);
        showtime.setId(1919);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:MM:ss");
        try {
            showtime.setDateTime(sdf.parse("2020-07-24 21:05:13"));
            showtime.setUser(user);
            showtimeService.save(showtime);
            model.addAttribute("message", "Projekcija je sacuvana" + showtime);
            return "redirect:/showtime/all";
        } catch (ParseException ex) {
            Logger.getLogger(ShowtimeController.class.getName()).log(Level.SEVERE, null, ex);
            model.addAttribute("message", "Neispravan format datuma.");
            return "showtime/new";
        }

    }

    @ModelAttribute(name = "showtimes")
    private List<Showtime> getShowtimes() {
        return showtimeService.findAll();
    }

    @ModelAttribute(name = "movies")
    private List<Movie> getMovies() {
        return movieService.getAll();
    }

    @ModelAttribute(name = "halls")
    private List<Hall> getHalls() {
        return hallService.findAll();
    }

    private Movie getMovieWithId(int id) {
        return movieService.getById(id);
    }
}
