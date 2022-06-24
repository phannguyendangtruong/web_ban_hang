package com.dangtruong.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dangtruong.dao.BillDAO;
import com.dangtruong.dao.BillDetailsDAO;
import com.dangtruong.dao.CustomerDAO;
import com.dangtruong.dao.ProductDAO;
import com.dangtruong.dao.PromotionalCodeDAO;
import com.dangtruong.dao.StaffDAO;
import com.dangtruong.model.Bills;
import com.dangtruong.model.Product;
import com.dangtruong.utils.ParamService;
import com.dangtruong.utils.SessionService;

@Controller
public class AdminController {
	
	@Autowired
	ProductDAO productDao;
	
	@Autowired
	StaffDAO staffDao;
	
	@Autowired
	CustomerDAO cusDao;
	
	@Autowired
	PromotionalCodeDAO codeDao;
	
	@Autowired
	BillDAO billDao;
	
	@Autowired
	ParamService paramService;
	
	@Autowired
	SessionService sessionService;
	
	@Autowired
	BillDetailsDAO billDetailDao;
	
	@RequestMapping("/admin")
	public String admin(Model model) {
		String admin ;
		try {
			admin = sessionService.getAttribute("admin");
		}catch(Exception e) {
			admin = "0";
		}
		if(!admin.equals("1")) {
			return "home";
		}
		model.addAttribute("listProduct", productDao.findAllBy0());
		model.addAttribute("listCustomer", cusDao.findAll());
		model.addAttribute("listBill", billDao.findBill());
		model.addAttribute("listProductToRemove", productDao.findAllBy1());
		List<Bills> bill = billDao.findBill();
		model.addAttribute("listCode", codeDao.findAll());
		return "admin";
	}
	
	
	

	@RequestMapping("remove-product/{id}")
	public String removeProduct(Model model, @PathVariable("id")Integer id) {
		productDao.deleteProduct(id);
		return "redirect:/admin";
	}
	
	@RequestMapping("restore-product/{id}")
	public String restoreProduct(Model model, @PathVariable("id")Integer id) {
		productDao.restoreProduct(id);
		return "redirect:/admin";
	}
	
	@RequestMapping("/addproduct")
	public String addproduct(Model model) {
		Product pr = new Product();
		model.addAttribute("product", pr);
		return "addproduct";
	}
	
	@PostMapping("add-product")
	public String addProduct(Model model, @ModelAttribute("product") Product product, @RequestParam("anhtruoc") MultipartFile previousImg, @RequestParam("anhsau") MultipartFile backSidePhoto ) throws IllegalStateException, IOException, Exception {
		product.setPreviousImg(previousImg.getOriginalFilename());
		previousImg.transferTo(paramService.save(previousImg, "C:\\Users\\leduo\\Documents\\workspace-spring-tool-suite-4-4.14.1.RELEASE\\ASM2\\src\\main\\webapp\\images"));
		product.setBackSidePhoto(backSidePhoto.getOriginalFilename());
		backSidePhoto.transferTo(paramService.save(backSidePhoto, "C:\\Users\\leduo\\Documents\\workspace-spring-tool-suite-4-4.14.1.RELEASE\\ASM2\\src\\main\\webapp\\images"));
		productDao.save(product);
		return "redirect:/admin";
	}
	
	@RequestMapping("update-product/{id}")
	public String updateProduct(Model model, @ModelAttribute("product") Product product, @PathVariable("id")Integer id) {
		product = productDao.findByIdProduct(id);
		sessionService.setAttribute("idupdate", id);
		model.addAttribute("product",product);
		return "updateProduct";
	}

	@PostMapping("update-product")
	public String update(Model model, @ModelAttribute("product") Product product,  @RequestParam("anhtruoc") MultipartFile previousImg, @RequestParam("anhsau") MultipartFile backSidePhoto) throws IllegalStateException, IOException, Exception {
		Product pr = productDao.findByIdProduct(sessionService.getAttribute("idupdate"));
		pr.setPreviousImg(previousImg.getOriginalFilename());
		pr.setBackSidePhoto(backSidePhoto.getOriginalFilename());
		backSidePhoto.transferTo(paramService.save(backSidePhoto, "C:\\Users\\leduo\\Documents\\workspace-spring-tool-suite-4-4.14.1.RELEASE\\ASM2\\src\\main\\webapp\\images"));
		previousImg.transferTo(paramService.save(previousImg, "C:\\Users\\leduo\\Documents\\workspace-spring-tool-suite-4-4.14.1.RELEASE\\ASM2\\src\\main\\webapp\\images"));
		
		productDao.save(pr);
		model.addAttribute("product",pr);
		return "updateProduct";
	}
	
	@RequestMapping("/thongke")
	public String thongke(Model model) {
		Date date = new Date();
		model.addAttribute("swe", billDetailDao.totalbrandMonth(1,date.getMonth()+1));
		model.addAttribute("degrey", billDetailDao.totalbrandMonth(2,date.getMonth()+1));
		model.addAttribute("hades", billDetailDao.totalbrandMonth(3,date.getMonth()+1));
		model.addAttribute("month", date.getMonth()+1);
		
		model.addAttribute("sweQuantity", billDetailDao.quantityProductByBrand(1,date.getMonth()+1));
		model.addAttribute("degreyQuantity", billDetailDao.quantityProductByBrand(2,date.getMonth()+1));
		model.addAttribute("hadesQuantity", billDetailDao.quantityProductByBrand(3,date.getMonth()+1));

		model.addAttribute("totalPriceMonth", billDetailDao.totalbrandMonth(1,date.getMonth()+1)+billDetailDao.totalbrandMonth(2,date.getMonth()+1)+billDetailDao.totalbrandMonth(3,date.getMonth()+1));
		model.addAttribute("totalQuantity",billDetailDao.quantityProductByBrand(3,date.getMonth()+1)+billDetailDao.quantityProductByBrand(2,date.getMonth()+1)+billDetailDao.quantityProductByBrand(1,date.getMonth()+1));
		
		return "statistical";
	}
}
