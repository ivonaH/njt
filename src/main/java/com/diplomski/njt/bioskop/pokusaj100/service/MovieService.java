/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.service;

import com.diplomski.njt.bioskop.pokusaj100.domain.Movie;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;

/**
 *
 * @author Korisnik
 */
public interface MovieService {

    List<Movie> getAll();

    Movie getById(int id);

    void add(Movie movie);

    void delete(int id);


    public Page<Movie> findAll(int pageNum);

    public Page<Movie> findAll(Specification<Movie> specification, int pageNum);

}
