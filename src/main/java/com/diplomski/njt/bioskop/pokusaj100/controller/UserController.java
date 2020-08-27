/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.controller;

import com.diplomski.njt.bioskop.pokusaj100.domain.User;
import com.diplomski.njt.bioskop.pokusaj100.service.UserService;
import com.diplomski.njt.bioskop.pokusaj100.validator.UserValidator;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author root
 */
@Controller
public class UserController {

    private final UserService userService;
    private final UserValidator userValidator;

    MessageSource messageSource;

    @Autowired
    public UserController(UserService userService, UserValidator userValidator, MessageSource messageSource) {
        this.userService = userService;
        this.userValidator = userValidator;
        this.messageSource = messageSource;
    }

    @RequestMapping(value = "/login/user")
    public String userPage(HttpServletRequest req, @Validated User user, BindingResult bindingResult, Model model) {
        req.getSession(true).setAttribute("user", null);

        if (bindingResult.hasErrors()) {
            String errorMessage = messageSource.getMessage("message.user.enterUsernameAndPasssword", null, LocaleContextHolder.getLocale());
            model.addAttribute("errorMessage", errorMessage);
            return "login";
        } else {
            User u1 = userService.findByUsernameAndPassword(user.getUsername(), user.getPassword());
            if (u1 == null) {
                String errorMessage = messageSource.getMessage("message.user.notFound", null, LocaleContextHolder.getLocale());
                model.addAttribute("errorMessage", errorMessage);
                return "login";

            }
            req.getSession(true).setAttribute("user", u1);

            return "redirect:/";
        }
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
        String logoutMessage = messageSource.getMessage("message.user.logout", null, LocaleContextHolder.getLocale());
        model.addAttribute("logoutMessage", logoutMessage);
        return "login";
    }

    @ModelAttribute(name = "user")
    public User getUser() {
        return new User();
    }

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.setValidator(userValidator);
    }

}
