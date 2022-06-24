package com.dangtruong.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.dangtruong.model.Staff;

public interface StaffDAO extends JpaRepository<Staff, String>{
	@Query("SELECT o FROM Staff o WHERE o.username = ?1")
	Staff findByUsername(String username);
	
	@Query("SELECT o FROM Staff o WHERE o.username = ?1")
	List<Staff> listUsername(String username);
}
