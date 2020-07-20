/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.service;

import com.diplomski.njt.bioskop.pokusaj100.domain.MovieMarathon;
import java.util.List;
import org.springframework.data.jpa.domain.Specification;

/**
 *
 * @author root
 */
public interface MovieMarathonService {

    public List<MovieMarathon> findAll();

    public MovieMarathon findById(int id);

    public void save(MovieMarathon movieMarathon);

    public List<MovieMarathon> findAll(Specification<MovieMarathon> specification);

}
