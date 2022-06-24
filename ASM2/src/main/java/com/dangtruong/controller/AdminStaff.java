package com.dangtruong.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dangtruong.dao.StaffDAO;
import com.dangtruong.model.Product;
import com.dangtruong.model.Staff;
import com.dangtruong.utils.ParamService;
import com.dangtruong.utils.SessionService;

@Controller
public class AdminStaff {
	@Autowired
	StaffDAO staffDao;
	
	@Autowired
	ParamService paramService;
	
	@Autowired
	SessionService sessionService;
	
	@RequestMapping("/addstaff")
	public String addproduct(Model model) {
		Staff staff = new Staff();
		model.addAttribute("staff", staff);
		return "addstaff";
	}
	
	@PostMapping("add-staff")
	public String addProduct(Model model, @ModelAttribute("staff") Staff staff, @RequestParam("gender") boolean gender) {
		staff.setGender(gender);
		staffDao.save(staff);
		return "redirect:/admin";
	}
//	
//	@RequestMapping("update-product/{id}")
//	public String updateProduct(Model model, @ModelAttribute("product") Product product, @PathVariable("id")Integer id) {
////		product = productDao.findByIdProduct(id);
////		sessionService.setAttribute("idupdate", id);
////		model.addAttribute("product",product);
//		return "updateProduct";
//	}
//
//	@PostMapping("update-product")
//	public String update(Model model, @ModelAttribute("product") Product product,  @RequestParam("anhtruoc") MultipartFile previousImg, @RequestParam("anhsau") MultipartFile backSidePhoto) throws IllegalStateException, IOException, Exception {
////		Product pr = productDao.findByIdProduct(sessionService.getAttribute("idupdate"));
////		pr.setPreviousImg(previousImg.getOriginalFilename());
////		pr.setBackSidePhoto(backSidePhoto.getOriginalFilename());
////		backSidePhoto.transferTo(paramService.save(backSidePhoto, "C:\\Users\\leduo\\Documents\\workspace-spring-tool-suite-4-4.14.1.RELEASE\\ASM2\\src\\main\\webapp\\images"));
////		previousImg.transferTo(paramService.save(previousImg, "C:\\Users\\leduo\\Documents\\workspace-spring-tool-suite-4-4.14.1.RELEASE\\ASM2\\src\\main\\webapp\\images"));
////		
////		productDao.save(pr);
////		model.addAttribute("product",pr);
//		return "updateProduct";
//	}
}
