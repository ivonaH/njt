/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.controller;

import com.diplomski.njt.bioskop.pokusaj100.domain.Showtime;
import com.diplomski.njt.bioskop.pokusaj100.domain.User;
import com.diplomski.njt.bioskop.pokusaj100.service.UserService;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

/**
 *
 * @author root
 */
@Controller
public class UserController {

    UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/login/user")
    public String userPage(HttpServletRequest req, String username, String password, Model model) {
        User u1 = userService.findByUsernameAndPassword(username, password);
        if (u1 == null) {
            model.addAttribute("errorMessage", "Neispravni username i password");
            return "login";

        }
        req.getSession(true).setAttribute("user", u1);
        

        return "redirect:/";
    }

    @RequestMapping(value = "/login")
    public String userPage() {

        return "login";
    }

    @RequestMapping(value = "/home")
    public String homePage() {

        return "redirect:/";
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session, Model model) {
        session.invalidate();
        model.addAttribute("logoutMessage", "Uspesno ste se odjavili.");
        return "login";
    }



//
//    @GetMapping(value = "/removeShowtime/{movieId}")
//    public String removeShowtime(@PathVariable(name = "movieId") Long movieId, HttpSession session, Model model) {
//        ArrayList<User> users = (ArrayList<User>) session.getAttribute("addedUsers");
//        User userToRemove=null;
//        for (User u : users) {
//            if (Objects.equals(u.getId(), movieId)) {
//                userToRemove = u;
//                break;
//            }
//        }
//        if (userToRemove != null) {
//            users.remove(userToRemove);
//        }
//
//        model.addAttribute("users", userService.getAll());
//        model.addAttribute("mmMessage", "Projekcija je uklonjena.");
//
//        return "marathon/marathon";
//    }

}
