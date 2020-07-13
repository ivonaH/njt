/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplomski.njt.bioskop.pokusaj100.repository;

import com.diplomski.njt.bioskop.pokusaj100.domain.User;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Korisnik
 */
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
//public interface UserRepository extends CrudRepository<User, Long> {
//    @Query("select u from User u")
//    List<User> getAll();
//
//    @Query("select u from User u where u.id =?1")
//    User getById(Long id);
}
