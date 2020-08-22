/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.controller;

import com.diplomski.njt.bioskop.pokusaj100.domain.Genre;
import com.diplomski.njt.bioskop.pokusaj100.domain.Movie;
import com.diplomski.njt.bioskop.pokusaj100.domain.User;
import com.diplomski.njt.bioskop.pokusaj100.service.MovieService;
import com.diplomski.njt.bioskop.pokusaj100.validator.MovieValidator;
import java.util.List;
import javax.servlet.http.HttpSession;
import net.kaczmarzyk.spring.data.jpa.domain.Equal;
import net.kaczmarzyk.spring.data.jpa.domain.In;
import net.kaczmarzyk.spring.data.jpa.domain.Like;
import net.kaczmarzyk.spring.data.jpa.web.annotation.And;
import net.kaczmarzyk.spring.data.jpa.web.annotation.Spec;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
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
import org.springframework.web.bind.annotation.SessionAttribute;
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
    MovieValidator movieValidator;

    MessageSource messageSource;

    @Autowired
    public MovieController(MovieService movieService, MovieValidator movieValidator, MessageSource messageSource) {
        this.movieService = movieService;
        this.movieValidator = movieValidator;
        this.messageSource = messageSource;
    }

    @RequestMapping(value = "/new")
    public String newMovie(Model model) {

        return "movie/new";
    }

    @PostMapping(value = "/save")
    public String saveMovie(@SessionAttribute(name = "user") User user, RedirectAttributes redirectAttributes, @Validated Movie movie, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "movie/new";
        }
        movie.setUser(user);
        movieService.add(movie);
        
        String movieStatus = messageSource.getMessage("message.movieStatus.created", null, LocaleContextHolder.getLocale());
        redirectAttributes.addFlashAttribute(
                "movieStatus", movieStatus);

        return "redirect:/movie/new";
    }

    @RequestMapping(value = "/all/{pageNum}")
    public String allMovies(@PathVariable(name = "pageNum") int pageNum, Model model) {
        Page<Movie> page = movieService.findAll(pageNum - 1);
        List<Movie> movies = page.getContent();
        
        model.addAttribute("currentPage", pageNum);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        model.addAttribute("movies", movies);
        
        return "movie/all";
    }

    @GetMapping(value = "/{id}/delete")
    public ModelAndView delete(@PathVariable(name = "id") int id, RedirectAttributes redirectAttributes) {
        movieService.delete(id);
        ModelAndView modelAndView = new ModelAndView("redirect:/movie/all/1");
        String movieStatus = messageSource.getMessage("message.movieStatus.deleted", null, LocaleContextHolder.getLocale());
        redirectAttributes.addFlashAttribute(
                "movieStatus", movieStatus);
        return modelAndView;
    }

    @GetMapping(value = "/{id}/view")
    public String delete(@PathVariable(name = "id") int id, Model model) {
        model.addAttribute("movie", movieService.getById(id));
        return "/movie/view";
    }

    @GetMapping(value = "/find/{pageNum}")
    public String findC(
            @PathVariable(name = "pageNum") int pageNum,
            @And({
        @Spec(path = "name", params = "name", spec = Like.class),
        @Spec(path = "director", params = "director", spec = Like.class),
        @Spec(path = "genre", params = "genre", spec = Equal.class),
        @Spec(path = "year", params = "year", spec = In.class)
    }) Specification<Movie> specification, Model model) {

        Page<Movie> page = movieService.findAll(specification, pageNum - 1);
        List<Movie> movies = page.getContent();

        model.addAttribute("currentPage", pageNum);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        model.addAttribute("movies", movies);

        return "movie/all";
    }

//    Movie attributes
    @ModelAttribute(name = "movie")
    private Movie getMovie() {
        return new Movie();
    }

    @ModelAttribute(name = "movies")
    private List<Movie> getMovies() {
        return movieService.getAll();
    }

    @ModelAttribute(name = "genres")
    private List<Genre> getGenres() {
        return java.util.Arrays.asList(Genre.values());
    }

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.setValidator(movieValidator);
    }

}
