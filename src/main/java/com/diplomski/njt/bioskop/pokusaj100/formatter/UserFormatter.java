/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.formatter;

import com.diplomski.njt.bioskop.pokusaj100.domain.User;
import com.diplomski.njt.bioskop.pokusaj100.service.UserService;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;

/**
 *
 * @author root
 */
public class UserFormatter implements Formatter<User> {

    private final UserService userService;

    @Autowired
    public UserFormatter(UserService userService) {
        this.userService = userService;
    }

    @Override
    public String print(User t, Locale locale) {
        return t.toString();
    }

    @Override
    public User parse(String username, Locale locale) throws ParseException {
        return userService.findByUsername(username);
    }

}
