package com.dangtruong.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.dangtruong.model.BillDetails;
import com.dangtruong.model.Bills;

public interface BillDAO extends JpaRepository<Bills, Long>{
	@Query("SELECT o FROM Bills o WHERE staffusername is null")
	List<Bills> findBill();
	
	@Query("SELECT o FROM Bills o WHERE staffusername is null and confirm like 0 and usernamecustomer like ?1")
	List<Bills> findBillOfUser(String id);
	
	@Query("SELECT o FROM Bills o WHERE billid like ?1")
	Bills findByIdBill(int id);
	
	@Query("SELECT o FROM Bills o WHERE staffusername is not null and confirm = 0 ")
	List<Bills> findBillDontConfirm();
	
	@Query("SELECT o FROM Bills o WHERE staffusername is not null and confirm = 1 ")
	List<Bills> billConfirm();
	
	@Query("SELECT SUM(o.totalPrice) FROM Bills o WHERE month(o.billDate) like?1")
	int totalMonth(int year);
	
	
}
