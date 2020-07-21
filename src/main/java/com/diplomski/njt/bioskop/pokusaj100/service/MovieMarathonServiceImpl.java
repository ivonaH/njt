/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.service;

import com.diplomski.njt.bioskop.pokusaj100.domain.MovieMarathon;
import com.diplomski.njt.bioskop.pokusaj100.repository.MovieMarathonRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author root
 */
@Service
@Transactional
public class MovieMarathonServiceImpl implements MovieMarathonService {

    @Autowired
    MovieMarathonRepository movieMarathonRepository;

    public MovieMarathonServiceImpl() {
    }

    @Override
    public List<MovieMarathon> findAll() {
        return movieMarathonRepository.findAll();
    }

    @Override
    public MovieMarathon findById(int id) {
        return movieMarathonRepository.findById(id).get();
    }

    @Override
    public void save(MovieMarathon movieMarathon) {
        movieMarathonRepository.save(movieMarathon);
    }

    @Override
    public List<MovieMarathon> findAll(Specification<MovieMarathon> specification) {
        return movieMarathonRepository.findAll(specification);
    }

}
