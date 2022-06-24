package com.dangtruong.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.dangtruong.model.BillDetails;

public interface BillDetailsDAO extends JpaRepository<BillDetails, Long>{
	@Query("SELECT o FROM BillDetails o WHERE bills.billid like ?1")
	List<BillDetails> selectBillDetail(int id);

	@Query("SELECT SUM(bills.totalPrice) FROM BillDetails o "
			+ "WHERE brandid like ?1 and month(billdate) like ?2")
	int totalbrandMonth(int brandid, int month);
	
	@Query("SELECT SUM(o.quantity) FROM BillDetails o WHERE brandid like ?1 and month(bills.billDate) like ?2")
	int quantityProductByBrand(int id, int month);
}
 