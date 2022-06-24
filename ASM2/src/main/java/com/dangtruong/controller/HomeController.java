package com.dangtruong.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
//import org.springframework.data.domain.Example;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.Pageable;
//import org.springframework.data.domain.Sort;
//import org.springframework.data.repository.query.FluentQuery.FetchableFluentQuery;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dangtruong.dao.BillDAO;
import com.dangtruong.dao.BillDetailsDAO;
import com.dangtruong.dao.BrandDAO;
import com.dangtruong.dao.CustomerDAO;
import com.dangtruong.dao.ProductDAO;
import com.dangtruong.dao.PromotionalCodeDAO;
import com.dangtruong.dao.StaffDAO;
import com.dangtruong.model.BillDetails;
import com.dangtruong.model.Brand;
import com.dangtruong.model.CartItem;
import com.dangtruong.model.Product;
import com.dangtruong.model.PromotionalCode;
import com.dangtruong.utils.CookiesService;
import com.dangtruong.utils.ParamService;
import com.dangtruong.utils.SessionService;
import com.dangtruong.utils.ShoppingCartService;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Controller
public class HomeController {
	@Autowired
	ProductDAO productDao;

	@Autowired
	StaffDAO staffDao;
	
	@Autowired
	BillDetailsDAO billDetailDao;

	@Autowired
	CustomerDAO cusDAO;

	@Autowired
	SessionService sessionService;

	@Autowired
	ParamService paramService;

	@Autowired
	BrandDAO brandDao;

	@Autowired
	ShoppingCartService shoppingCartService;

	@Autowired
	PromotionalCodeDAO codeDao;
	
	@Autowired
	BillDAO billDao;

	@RequestMapping("/home")
	public String home(Model model, @RequestParam("page") Optional<Integer> page) {
		int soTrang = productDao.findAllBy0().size();
		try {
			if (!(soTrang % 8 == 0)) {
				soTrang = (soTrang / 8) + 1;
			}
			if (page.get() == soTrang) {
				return "redirect:/home?page=" + (soTrang - 1);
			}
			if (page.get() < 0) {
				return "redirect:/home?page=0";
			}
		} catch (Exception e) {
			return "redirect:/home?page=0";
		}
		Pageable pageable = PageRequest.of(page.orElse(0), 8);
		Page<Product> list = productDao.findAllBy0(pageable);

		model.addAttribute("count", shoppingCartService.getCount());
		model.addAttribute("page", list);
		try {
			model.addAttribute("soLuong", sessionService.getAttribute("quantity").toString());
		} catch (Exception e) {

		}
		sessionService.setAttribute("error", "");
		return "home";
	}

	@RequestMapping("/cart")
	public String cart(Model model) {
		Collection<CartItem> cartItems = shoppingCartService.getCartItem();
		model.addAttribute("cartItems", cartItems);
		model.addAttribute("total", shoppingCartService.getAmount());
		model.addAttribute("noOfItems", shoppingCartService.getCount());
		int totalPrice = 0;
		try {
			Map<Integer, CartItem> map = sessionService.getAttribute("listCartProduct");
			Set<Integer> set = map.keySet();
			for (Integer key : set) {
				totalPrice += (map.get(key).getPrice() * map.get(key).getQuantity());
			}
		} catch (Exception e) {

		}
		sessionService.setAttribute("totalPrice", totalPrice);
		return "Cart";
	}

	@RequestMapping("addcode")
	public String code() {
		return "code";
	}
	
	@PostMapping("/code")
	public String code(Model model) {
		try {
			String code = paramService.getString("code", "cmsn");
			
			Collection<CartItem> cartItems = shoppingCartService.getCartItem();
			model.addAttribute("cartItems", cartItems);
			model.addAttribute("total", shoppingCartService.getAmount());
			model.addAttribute("noOfItems", shoppingCartService.getCount());

			List<PromotionalCode> list = codeDao.findCode(code.toUpperCase());
			Date date = new Date();
			
			String dateCode = list.get(0).getPromotionalCodeDate().toString();
			dateCode = dateCode.substring(0,10);
			Date date1 = null;
			try {
				date1 = new SimpleDateFormat("yyyy-MM-dd").parse(dateCode);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			if (date.compareTo(date1) < 0) {
				float giamGia = list.get(0).getPercentageRedution();
				String giaTienString = paramService.getString("total", "1");
				int price = Integer.valueOf(giaTienString.trim());
				float price2 = price - (price * (giamGia / 100));
				String tien = price2 + "";
				int index = tien.indexOf(".");
				tien = tien.substring(0, index);
				price = Integer.valueOf(tien);
				sessionService.setAttribute("totalPrice", price);

				model.addAttribute("none", "d-none");
				sessionService.setAttribute("error", "");
				return "Cart";
			};
			sessionService.setAttribute("error", "Mã không tồn tại hoặc hết hạn");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "Cart";

	}

	@RequestMapping("/brand")
	public String brand(Model model, @RequestParam("name") String brandName,
			@RequestParam("page") Optional<Integer> page) {
		Pageable pageable = PageRequest.of(page.orElse(0), 8);
		try {
			model.addAttribute("soLuong", sessionService.getAttribute("quantity").toString());
		} catch (Exception e) {

		}
		if (brandName.equalsIgnoreCase("swe")) {
			Page<Product> list = productDao.findSwe(pageable);
			sessionService.setAttribute("brand", "swe");
			model.addAttribute("page", list);
			model.addAttribute("brand", "SWE TOP PRODUCT");
			return "listproduct";
		}
		if (brandName.equalsIgnoreCase("hades")) {
			Page<Product> list = productDao.findHades(pageable);
			sessionService.setAttribute("brand", "hades");
			model.addAttribute("page", list);
			model.addAttribute("brand", "HADES TOP PRODUCT");
			return "listproduct";
		}
		if (brandName.equalsIgnoreCase("degrey")) {
			Page<Product> list = productDao.findDegrey(pageable);
			sessionService.setAttribute("brand", "degrey");
			model.addAttribute("page", list);
			model.addAttribute("brand", "DEGREY TOP PRODUCT");
			return "listproduct";
		}
		return "";
	}

	@RequestMapping("/brand-list")
	public String brandList(Model model, @RequestParam("page") Optional<Integer> page) {
		String get = sessionService.getAttribute("brand");
		try {
			model.addAttribute("soLuong", sessionService.getAttribute("quantity").toString());
		} catch (Exception e) {

		}
		if (page.get() < 0) {
			return "redirect:/brand-list?page=0";
		}
		Pageable pageable = PageRequest.of(page.orElse(0), 8);
		if (get.equals("swe")) {
			int soTrang = productDao.count(1).size();
			try {
				if (!(soTrang % 8 == 0)) {
					soTrang = (soTrang / 8) + 1;
				}
				if (page.get() == soTrang) {
					return "redirect:/brand-list?page=" + (soTrang - 1);
				}

			} catch (Exception e) {
				return "redirect:/brand-list?page=0";
			}

			Page<Product> list = productDao.findSwe(pageable);
			sessionService.setAttribute("brand", "swe");
			model.addAttribute("page", list);
			model.addAttribute("brand", "SWE TOP PRODUCT");
			return "listproduct";
		} else if (get.equals("hades")) {
			int soTrang = productDao.count(3).size();
			try {
				if (!(soTrang % 8 == 0)) {
					soTrang = (soTrang / 8) + 1;
				}
				if (page.get() == soTrang) {
					return "redirect:/brand-list?page=" + (soTrang - 1);
				}

			} catch (Exception e) {
				return "redirect:/brand-list?page=0";
			}

			Page<Product> list = productDao.findHades(pageable);
			sessionService.setAttribute("brand", "hades");
			model.addAttribute("page", list);
			model.addAttribute("brand", "HADES TOP PRODUCT");
			return "listproduct";
		} else {
			int soTrang = productDao.count(2).size();
			try {
				if (!(soTrang % 8 == 0)) {
					soTrang = (soTrang / 8) + 1;
				}
				if (page.get() == soTrang) {
					return "redirect:/brand-list?page=" + (soTrang - 1);
				}

			} catch (Exception e) {
				return "redirect:/brand-list?page=0";
			}

			Page<Product> list = productDao.findDegrey(pageable);
			sessionService.setAttribute("brand", "degrey");
			model.addAttribute("page", list);
			model.addAttribute("brand", "DEGREY TOP PRODUCT");
			return "listproduct";
		}
	}

	@RequestMapping("/productdetails")
	public String productDetails(Model model, @RequestParam("id") Integer id) {
		List<Product> list = productDao.findPrById(id);
		Collection<CartItem> cartItems = shoppingCartService.getCartItem();
		model.addAttribute("cartItems", cartItems);
		model.addAttribute("total", shoppingCartService.getAmount());
		model.addAttribute("noOfItems", shoppingCartService.getCount());
		sessionService.setAttribute("productId", id);
		model.addAttribute("list", list);
		int brandId = productDao.findById(id).get().getBrand().getBrandId();
		List<Product> listProductByBrand = productDao.selectTop10(brandId);
		model.addAttribute("brand", brandDao.findById(brandId).get().getBrandName());
		model.addAttribute("listproduct", listProductByBrand);

		try {
			model.addAttribute("soLuong", sessionService.getAttribute("quantity").toString());
		} catch (Exception e) {

		}
		return "test";
	}

	@RequestMapping("/product/page")
	public String paginate(Model model, @RequestParam("page") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Product> pages = productDao.findAllBy0(pageable);
		model.addAttribute("page", pages);
		return "home";
	}

	@RequestMapping("/signin")
	public String signin() {
		return "login";
	}

	@RequestMapping("/logout")
	public String logout() {
		sessionService.removeAttribute("username");
		sessionService.setAttribute("admin", "2");
		return "redirect:/home";
	}

	

	@RequestMapping(value = "/login-account", method = RequestMethod.POST)
	public String loginAccount(Model model) {
		try {
			model.addAttribute("soLuong", sessionService.getAttribute("quantity").toString());
		} catch (Exception e) {

		}
		return "home";
	}
}
