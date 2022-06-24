package com.dangtruong.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dangtruong.dao.BillDAO;
import com.dangtruong.dao.StaffDAO;
import com.dangtruong.model.Bills;
import com.dangtruong.model.Staff;
import com.dangtruong.utils.SessionService;

@Controller
public class OrderController {
	
	@Autowired
	BillDAO billDao;
	
	@Autowired
	SessionService sessionService;
	
	@Autowired
	StaffDAO staffDao;
	
	@RequestMapping("order")
	public String order(Model model) {
		List<Bills> listBill = billDao.findBill();
		List<Bills> listBillDontConfrim = billDao.findBillDontConfirm();
		model.addAttribute("list",listBillDontConfrim);
		model.addAttribute("listBill", listBill);
		
		return "bill";
	}
	
	@RequestMapping("update-bill")
	public String updateBill(@RequestParam("id") int id) {
		String username = sessionService.getAttribute("username");
		Bills bill = billDao.findByIdBill(id);
		Staff staff = staffDao.findByUsername(username);
		bill.setStaff(staff);
		billDao.save(bill);
		System.out.println(username);
		return "redirect:/order";
	}
	
	@RequestMapping("update-bill-confirm")
	public String updateBillConfirm(@RequestParam("id") int id) {
		Bills bill = billDao.findByIdBill(id);
		bill.setConfirm(true);
		billDao.save(bill);
		return "redirect:/order";
	}
	
	
}
