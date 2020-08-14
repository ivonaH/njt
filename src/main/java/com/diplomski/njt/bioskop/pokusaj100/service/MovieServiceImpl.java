/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.service;

import com.diplomski.njt.bioskop.pokusaj100.domain.Movie;
import com.diplomski.njt.bioskop.pokusaj100.repository.MovieRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author root
 */
@Service
@Transactional
public class MovieServiceImpl implements MovieService {

    @Autowired
    private MovieRepository movieRepository;

    public MovieServiceImpl() {
    }

    @Override
    public List<Movie> getAll() {
        return movieRepository.findAll();
    }

    @Override
    public Movie getById(int id) {
        return movieRepository.findById(id).get();
    }

    @Override
    public void add(Movie movie) {
        movieRepository.save(movie);
    }

    @Override
    public void delete(int id) {
        movieRepository.deleteById(id);
    }

    
  

    @Override
    public List<Movie> findAll(Specification<Movie> specification) {
        return movieRepository.findAll(specification,new Sort(Sort.Direction.DESC, "id")
                .and(new Sort(Sort.Direction.ASC, "name")));
    }

    @Override
    public List<Movie> findAll() {
        return movieRepository.findAll(Sort.by(Sort.Direction.DESC,"id"));
    }

}
