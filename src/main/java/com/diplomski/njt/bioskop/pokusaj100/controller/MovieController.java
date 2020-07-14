/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.controller;

import com.diplomski.njt.bioskop.pokusaj100.domain.Movie;
import com.diplomski.njt.bioskop.pokusaj100.domain.User;
import com.diplomski.njt.bioskop.pokusaj100.service.MovieService;
import com.diplomski.njt.bioskop.pokusaj100.service.UserService;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author root
 */
@Controller
@RequestMapping(value = "/movie")
public class MovieController {

    MovieService movieService;

    @Autowired
    public MovieController(MovieService movieService) {
        this.movieService = movieService;
    }

    @RequestMapping(value = "/new")
    public String userPage(Model model) {

        return "movie/new";
    }

    @PostMapping(value = "/save")
    public String saveMovie(RedirectAttributes redirectAttributes, Movie movie, HttpSession session) {
        movie.setUser((User) session.getAttribute("user"));
        movieService.add(movie);
        redirectAttributes.addFlashAttribute("movieStatus", "Film je sacuvan.");
        return "redirect:/movie/new";
    }

    @RequestMapping(value = "/all")
    public String allMovies(Model model) {
        model.addAttribute("movies", movieService.getAll());
        return "movie/all";
    }

    @GetMapping(value = "/{id}/delete")
    public String delete(@PathVariable(name = "id") int id, Model model) {
        movieService.delete(id);
        System.out.println("Brisem film...");
        model.addAttribute("message", "Film sa idijem: " + id + " je obrisan");
        return "movie/all";
    }

//    Movie attributes
    @ModelAttribute(name = "movie")
    private Movie getMovie() {
        return new Movie();
    }

}
