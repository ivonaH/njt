/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.service;

import com.diplomski.njt.bioskop.pokusaj100.domain.Hall;
import java.util.List;

/**
 *
 * @author root
 */
public interface HallService {
    public List<Hall> findAll();
    public Hall findById(int id);
}
