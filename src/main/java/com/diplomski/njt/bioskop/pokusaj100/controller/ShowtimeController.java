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
import com.diplomski.njt.bioskop.pokusaj100.service.ReservationService;
import com.diplomski.njt.bioskop.pokusaj100.service.ShowtimeService;
import com.diplomski.njt.bioskop.pokusaj100.validator.ShowtimeValidator;
import java.util.Date;
import java.util.List;
import net.kaczmarzyk.spring.data.jpa.domain.GreaterThanOrEqual;
import net.kaczmarzyk.spring.data.jpa.domain.Like;
import net.kaczmarzyk.spring.data.jpa.web.annotation.And;
import net.kaczmarzyk.spring.data.jpa.web.annotation.Spec;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.format.annotation.DateTimeFormat;
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
@RequestMapping(value = "/showtime")
public class ShowtimeController {

    ShowtimeService showtimeService;
    MovieService movieService;
    ReservationService reservationService;
    HallService hallService;

    ShowtimeValidator showtimeValidator;

    MessageSource messageSource;

    @Autowired
    public ShowtimeController(ShowtimeService showtimeService, MovieService movieService, HallService hallService, ReservationService reservationService, ShowtimeValidator showtimeValidator, MessageSource messageSource) {
        this.showtimeService = showtimeService;
        this.movieService = movieService;
        this.hallService = hallService;
        this.reservationService = reservationService;
        this.showtimeValidator = showtimeValidator;
        this.messageSource = messageSource;

    }

    @RequestMapping(value = "/all/{pageNum}")
    public String allShowtimes(@PathVariable(name = "pageNum") int pageNum, Model model) {
        Page<Showtime> page = showtimeService.findAll(pageNum - 1);
        List<Showtime> showtimes = page.getContent();
        model.addAttribute("showtimes", showtimes);
        model.addAttribute("currentPage", pageNum);

        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        return "showtime/all";
    }

    @GetMapping(value = "/find/{pageNum}")
    public String findShowtimes(
            @PathVariable(name = "pageNum") int pageNum,
            @And({
        @Spec(path = "movie.name", params = "movieName", spec = Like.class),
        @Spec(path = "dateTime", params = "dateTime", spec = GreaterThanOrEqual.class),
        @Spec(path = "hall.name", params = "hallName", spec = Like.class)
    }) Specification<Showtime> specification, Model model) {

        Page<Showtime> page = showtimeService.findAll(specification, pageNum - 1);
        List<Showtime> showtimes = page.getContent();
        model.addAttribute("showtimes", showtimes);
        model.addAttribute("currentPage", pageNum);

        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        return "showtime/all";
    }

    @GetMapping(value = "/{id}/delete")
    public ModelAndView delete(@PathVariable(name = "id") int id, RedirectAttributes redirectAttributes) {
        showtimeService.delete(id);
        ModelAndView modelAndView = new ModelAndView("redirect:/showtime/all/1");
        String showtimeStatus = messageSource.getMessage("message.showtimeStatus.deleted", null, LocaleContextHolder.getLocale());
        redirectAttributes.addFlashAttribute("showtimeStatus", showtimeStatus);
        return modelAndView;
    }

    @GetMapping(value = "/{id}/view")
    public String view(@PathVariable(name = "id") int id, Model model) {
        model.addAttribute("showtime", showtimeService.findById(id));
        return "/showtime/view";
    }

    @GetMapping(value = "/new")
    public String newShowtime(@RequestParam(value = "movieId") int movieId, Model model) {
        Movie m = getMovieWithId(movieId);
        model.addAttribute("selectedMovieId", movieId);
        Showtime showtime = new Showtime();
        showtime.setMovie(m);
        model.addAttribute("showtime", showtime);
        return "showtime/new";
    }

    @GetMapping(value = "/newS")
    public String newShowtime(Model model) {
        model.addAttribute("showtime", new Showtime());
        return "showtime/new";
    }

    @PostMapping(value = "/save")
    public String saveShowtime(@SessionAttribute(name = "user") User user, @Validated Showtime showtime, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "showtime/new";
        }
        showtime.setUser(user);
        showtimeService.save(showtime);

        String showtimeStatus = messageSource.getMessage("message.showtimeStatus.created", null, LocaleContextHolder.getLocale());
        redirectAttributes.addFlashAttribute("showtimeStatus", showtimeStatus);
        return "redirect:/showtime/all/1";

    }

    @PostMapping(value = "/update")
    public String updateShowtime(@Validated Showtime showtime, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model) {
        if (bindingResult.hasErrors()) {
            return "/showtime/view";
        }
        showtimeService.save(showtime);
        String showtimeStatus = messageSource.getMessage("message.showtimeStatus.created", null, LocaleContextHolder.getLocale());
        redirectAttributes.addFlashAttribute("showtimeStatus", showtimeStatus);
        return "redirect:/showtime/all/1";

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

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.setValidator(showtimeValidator);
    }

}
