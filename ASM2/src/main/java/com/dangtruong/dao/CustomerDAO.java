package com.dangtruong.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.dangtruong.model.Customer;

@Repository
public interface CustomerDAO extends JpaRepository<Customer, Long>{
	@Query("SELECT o FROM Customer o WHERE o.username like ?1")
	Optional<Customer> findByUsername(String username);
	
	@Query("SELECT o FROM Customer o WHERE o.email like ?1")
	Customer findByEmail(String email);
	
	@Query("SELECT o FROM Customer o WHERE o.username like ?1")
	Customer findByUsernameCustomer(String username);
}
