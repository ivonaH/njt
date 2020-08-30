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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import net.kaczmarzyk.spring.data.jpa.domain.GreaterThanOrEqual;
import net.kaczmarzyk.spring.data.jpa.domain.Like;
import net.kaczmarzyk.spring.data.jpa.web.annotation.And;
import net.kaczmarzyk.spring.data.jpa.web.annotation.Join;
import net.kaczmarzyk.spring.data.jpa.web.annotation.Spec;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpRequest;
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
    MessageSource messageSource;

    @Autowired
    public MovieMarathonController(MovieMarathonService movieMarathonService, ShowtimeService showtimeService, MovieMarathonValidator mv, MessageSource messageSource) {
        this.movieMarathonService = movieMarathonService;
        this.showtimeService = showtimeService;
        this.marathonValidator = mv;
        this.messageSource = messageSource;

    }

    @RequestMapping(value = "/new")
    public String newMM(Model model, HttpSession session) {
        if (session.getAttribute("mm") == null) {
            MovieMarathon mm = new MovieMarathon();
            mm.setName("");
            session.setAttribute("mm", mm);
        }
        model.addAttribute("movieMarathon", session.getAttribute("mm"));
        List<Showtime> showtimesAll = showtimeService.findByMarathonIdAndDateTimeGreaterThanEqual(0, Calendar.getInstance().getTime());

        model.addAttribute("showtimesAll", showtimesAll);
        return "marathon/new";
    }

    @GetMapping(value = "/showtimes")
    public String newMMShowtimes(@RequestParam(name = "dateTime") String date, Model model) throws ParseException {
        SimpleDateFormat sdf;
        Calendar c = Calendar.getInstance();
        if (!date.contains(" ")) {
            sdf = new SimpleDateFormat("yyyy-MM-dd");
        } else {
            sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        }
        c.setTime(sdf.parse(date));

        List<Showtime> showtimesAll = showtimeService.findByMarathonIdAndDateTimeGreaterThanEqual(0, c.getTime());

        model.addAttribute("showtimesAll", showtimesAll);
        return "marathon/new";
    }

    @GetMapping(value = "/addShowtime/{showtimeId}")
    public String addShowtime(@PathVariable(name = "showtimeId") int showtimeId, HttpSession session, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        if (session.getAttribute("mm") == null) {
            MovieMarathon mm = new MovieMarathon();
            session.setAttribute("mm", mm);
        }
        MovieMarathon mm = (MovieMarathon) session.getAttribute("mm");
        ArrayList<Showtime> showtimes = (ArrayList<Showtime>) mm.getShowtimes();
        Showtime toAdd = showtimeService.findById(showtimeId);
        String message = "";
        if (validate(toAdd, redirectAttributes, showtimes)) {
            showtimes.add(toAdd);
            String mmStatus = messageSource.getMessage("mmMessage.showtimeAdded", null, LocaleContextHolder.getLocale());
            redirectAttributes.addFlashAttribute("mmMessage", mmStatus);
        }
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }

    @GetMapping(value = "/removeShowtime/{showtimeId}")
    public String removeShowtime(@PathVariable(name = "showtimeId") int showtimeId, HttpSession session, RedirectAttributes redirectAttributes, HttpServletRequest request) {
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

        }

        String mmStatus = messageSource.getMessage("mmMessage.showtimeRemoved", null, LocaleContextHolder.getLocale());
        redirectAttributes.addFlashAttribute("mmMessage", mmStatus);
//        model.addAttribute("mmMessage", mmStatus);
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }

    @PostMapping(value = "/save")
    public String saveMovie(@SessionAttribute(name = "user") User user, @SessionAttribute(name = "mm") MovieMarathon marathonSession, RedirectAttributes redirectAttributes, @Validated MovieMarathon movieMarathon, BindingResult bindingResult, HttpSession session) {
        if (bindingResult.hasErrors()) {

            return "marathon/new";
        }
        ArrayList<Showtime> showtimes = (ArrayList<Showtime>) marathonSession.getShowtimes();
        marathonSession.setUser(user);
        marathonSession.setName(movieMarathon.getName());
        movieMarathonService.save(marathonSession);

        String mmStatus = messageSource.getMessage("message.mmStatus.created", null, LocaleContextHolder.getLocale());
        redirectAttributes.addFlashAttribute("mmStatus", mmStatus);

        session.setAttribute("mm", null);
        return "redirect:/mm/all/1";
    }

    @GetMapping(value = "/find/{pageNum}")
    public String findMM(
            @PathVariable(name = "pageNum") int pageNum,
            @Join(path = "showtimes", alias = "s")
            @And({
        @Spec(path = "name", params = "name", spec = Like.class),
        @Spec(path = "s.movie.name", params = "movieName", spec = Like.class),
        @Spec(path = "s.dateTime", params = "dateTime", spec = GreaterThanOrEqual.class)
    }) Specification<MovieMarathon> specification, Model model) {

        Page<MovieMarathon> page = movieMarathonService.findAll(specification, pageNum - 1);
        List<MovieMarathon> mms = page.getContent();
        model.addAttribute("marathons", mms);
        model.addAttribute("currentPage", pageNum);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        return "marathon/all";
    }

    @RequestMapping(value = "/all/{pageNum}")
    public String allMovies(@PathVariable(name = "pageNum") int pageNum, Model model) {
        Page<MovieMarathon> page = movieMarathonService.findAll(pageNum - 1);
        List<MovieMarathon> mms = page.getContent();
        model.addAttribute("marathons", mms);
        model.addAttribute("currentPage", pageNum);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        return "marathon/all";
    }

    @GetMapping(value = "/{id}/view")
    public String delete(@PathVariable(name = "id") int id, Model model) {
        model.addAttribute("mm", movieMarathonService.findById(id));
        return "/marathon/view";
    }

    @ModelAttribute(name = "showtimes")
    private List<Showtime> getShowtimes() {
        return showtimeService.findAll(1).getContent();
    }

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.setValidator(marathonValidator);
    }

    private boolean validate(Showtime toAdd, RedirectAttributes redirectAttributes, List<Showtime> showtimes) {
        String message = "";
        if (toAdd.getMovieMarathonId() != 0) {
            message = messageSource.getMessage("mmMessage.error.anotherMovieMarathon", null, LocaleContextHolder.getLocale());
            redirectAttributes.addFlashAttribute("mmError", message);
            return false;
        }
        if (showtimes.isEmpty()) {
            return true;
        }
        if (showtimes.contains(toAdd)) {
            message = messageSource.getMessage("mmMessage.error.alreadyAdded", null, LocaleContextHolder.getLocale());
            redirectAttributes.addFlashAttribute("mmError", message);
            return false;
        }
        if (!validateDateOdShowtime(toAdd, showtimes.get(0))) {
            message = messageSource.getMessage("mmMessage.error.differentDate", null, LocaleContextHolder.getLocale());
            redirectAttributes.addFlashAttribute("mmError", message);

            return false;
        }
        if (!validateMoviesAtShowtimes(toAdd, showtimes)) {
            message = messageSource.getMessage("mmMessage.error.movie.alreadyAdded", null, LocaleContextHolder.getLocale());
            redirectAttributes.addFlashAttribute("mmError", message);

            return false;
        }
        if (!validateTimeOfShowtime(toAdd, showtimes)) {
            message = messageSource.getMessage("mmMessage.error.showtimeTime", null, LocaleContextHolder.getLocale());
            redirectAttributes.addFlashAttribute("mmError", message);

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
