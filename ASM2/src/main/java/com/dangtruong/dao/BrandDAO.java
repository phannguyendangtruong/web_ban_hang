package com.dangtruong.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.dangtruong.model.Brand;

public interface BrandDAO extends JpaRepository<Brand, Integer>{

	@Query("SELECT o FROM Brand o where o.brandId like ?1")
	List<Brand> findBrandName(int id);
}
