package com.dangtruong.dao;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.dangtruong.model.Product;

public interface ProductDAO extends JpaRepository<Product, Integer> {
	@Query("SELECT o FROM Product o where brandId like 2 and o.isDeleted = 0")
	Page<Product> findDegrey(Pageable page);

	@Query("SELECT o FROM Product o where brandId like 1 and o.isDeleted = 0")
	Page<Product> findSwe(Pageable page);

	@Query("SELECT o FROM Product o where brandId like 3 and o.isDeleted = 0")
	Page<Product> findHades(Pageable page);

	@Query("SELECT o FROM Product o where brandid = ?1 and o.isDeleted = 0")
	List<Product> count(int id);

	@Query(nativeQuery = true, value = "SELECT TOP 8 * FROM Product where brandId like ?1 ")
	List<Product> selectTop10(int id);

	@Query("SELECT brand FROM Product o where o.productId like ?1")
	List<Product> findIdBrand(int id);

	@Query("SELECT o FROM Product o where o.productId like ?1")
	List<Product> findPrById(int id);

	@Query("SELECT o FROM Product o  where o.productId like ?1 and o.isDeleted = 0")
	List<Product> findByName(int id);

	@Query("SELECT o FROM Product o  where o.productId like ?1 and o.isDeleted = 0")
	Product findByIdProduct(int id);

	@Modifying
	@Transactional
	@Query("Update FROM Product o  set o.isDeleted = 1 where o.productId like ?1")
	void deleteProduct(int id);
	
	@Modifying
	@Transactional
	@Query("Update FROM Product o  set o.isDeleted = 0 where o.productId like ?1")
	void restoreProduct(int id);
	

	@Query("SELECT o FROM Product o  where o.isDeleted = 0")
	<T> List<T> findAllBy0();

	@Query("SELECT o FROM Product o  where o.isDeleted = 0")
	<T> Page<T> findAllBy0(Pageable pageable);
	
	@Query("SELECT o FROM Product o  where o.isDeleted = 1")
	<T> List<T> findAllBy1();

	@Query("SELECT o FROM Product o  where o.isDeleted = 1")
	<T> Page<T> findAllBy1(Pageable pageable);

}
