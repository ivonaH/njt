/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.service;

import com.diplomski.njt.bioskop.pokusaj100.domain.User;
import java.util.List;

/**
 *
 * @author Korisnik
 */
public interface UserService {

    List<User> getAll();

    User getById(Long id);

    void add(User user);

    User findByUsernameAndPassword(String username, String password);

}
