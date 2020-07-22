/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.service;

import com.diplomski.njt.bioskop.pokusaj100.domain.Hall;
import com.diplomski.njt.bioskop.pokusaj100.repository.HallRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author root
 */
@Service
@Transactional
public class HallServiceImpl implements HallService {

    @Autowired
    HallRepository hallRepository;

    public HallServiceImpl() {
    }

    @Override
    public List<Hall> findAll() {
        return hallRepository.findAll(Sort.by(Sort.Direction.ASC,"Name"));
    }

    @Override
    public Hall findById(int id) {
        return hallRepository.findById(id).get();
    }

}
