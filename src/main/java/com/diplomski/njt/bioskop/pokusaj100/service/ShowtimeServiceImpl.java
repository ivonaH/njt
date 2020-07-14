/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.service;

import com.diplomski.njt.bioskop.pokusaj100.domain.Hall;
import com.diplomski.njt.bioskop.pokusaj100.domain.Showtime;
import com.diplomski.njt.bioskop.pokusaj100.repository.HallRepository;
import com.diplomski.njt.bioskop.pokusaj100.repository.ShowtimeRepository;
import com.diplomski.njt.bioskop.pokusaj100.service.HallService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author root
 */
@Service
@Transactional
public class ShowtimeServiceImpl implements ShowtimeService {

    @Autowired
    ShowtimeRepository showtimeRepository;

    public ShowtimeServiceImpl() {
    }

    @Override
    public List<Showtime> findAll() {
        return showtimeRepository.findAll();
    }

    @Override
    public Showtime findById(int id) {
        return showtimeRepository.findById(id).get();
    }

    @Override
    public void delete(int i) {
        showtimeRepository.deleteById(i);
    }
    

}
