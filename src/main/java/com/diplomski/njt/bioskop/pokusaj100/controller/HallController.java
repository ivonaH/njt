/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.controller;

import com.diplomski.njt.bioskop.pokusaj100.service.HallService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author root
 */
@Controller
//@RequestMapping(value = "/hall")
public class HallController {

    HallService hallService;

    @Autowired
    public HallController(HallService hallService) {
        this.hallService = hallService;
    }
//    @RequestMapping(value="all")
//    public String allHalls(Model model){
//        model.addAttribute("halls",hallService.findAll());
//        return "showtime/all";
//    }
}
