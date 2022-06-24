package com.dangtruong.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.dangtruong.model.PromotionalCode;

public interface PromotionalCodeDAO extends JpaRepository<PromotionalCode, Integer>{
	@Query("SELECT o FROM PromotionalCode o WHERE o.code like ?1")
	List<PromotionalCode> findCode(String code);
}
