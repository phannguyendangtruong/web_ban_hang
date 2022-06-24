package com.dangtruong.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dangtruong.dao.CustomerDAO;
import com.dangtruong.dao.StaffDAO;
import com.dangtruong.model.Customer;
import com.dangtruong.model.Staff;
import com.dangtruong.utils.CookiesService;
import com.dangtruong.utils.ParamService;
import com.dangtruong.utils.SessionService;

@Controller
public class LoginController {

	@Autowired
	StaffDAO staffDAO;

	@Autowired
	CustomerDAO cusDAO;

	@Autowired
	CookiesService cookieService;

	@Autowired
	ParamService paramService;

	@Autowired
	SessionService sessionService;

	@RequestMapping("login")
	public String login(Model model) {
		model.addAttribute("username", cookieService.getValue("username"));
		model.addAttribute("password", cookieService.getValue("password"));
		return "login";
	}

	@PostMapping("login")
	public String loginStaff(Model model) {
		String un = paramService.getString("username", "");
		String pw = paramService.getString("password", "");
		boolean rm = paramService.getBoolean("remember", false);
		try {
			Optional<Staff> u = staffDAO.findById(un);
			if (u != null) {
				if (pw.equals(u.get().getPassword())) {
					Staff staff = new Staff();
					BeanUtils.copyProperties(staffDAO.findById(un).get(), staff);
					sessionService.setAttribute("username", staff.getUsername());
					sessionService.setAttribute("name", staff.getFullName());
					if (rm == true) {
						cookieService.add("username", un, 10);
						cookieService.add("password", pw, 10);
					} else {
						cookieService.remove("username");
						cookieService.remove("password");
					}
					sessionService.setAttribute("admin", "1");
					return "redirect:/home";
				} else {
					System.out.println("sai");
					return "login";
				}
			}

		} catch (Exception e) {
			Optional<Customer> u2 = cusDAO.findByUsername(un);
			System.out.println("ok");
			if (u2 != null) {
				if (pw.equals(u2.get().getPassword())) {
					System.out.println("1");
					Customer customer = new Customer();
					try {
						BeanUtils.copyProperties(cusDAO.findByUsername(un).get(), customer);
					} catch (Exception e1) {
						return "login";
					}
					sessionService.setAttribute("username", customer.getUsername());
					sessionService.setAttribute("name", customer.getCustomerName());
					if (rm == true) {
						cookieService.add("username", un, 10);
						cookieService.add("password", pw, 10);
					} else {
						cookieService.remove("username");
						cookieService.remove("password");
					}
					sessionService.setAttribute("admin", "0");
					return "redirect:/home";
				} else {
					return "login";
				}
			}

			return "login";
		}
		return "";
	}

//	public String loginCustomer() {
//		try {
//			String un = paramService.getString("username", "");
//			String pw = paramService.getString("password", "");
//
//			boolean rm = paramService.getBoolean("remember", false);
//			List<Customer> u = cusDAO.findByUsername(un);
//			if (u != null) {
//				if (pw.equals(u.get(0).getPassword())) {
//					Customer customer = new Customer();	
//					BeanUtils.copyProperties(staffDAO.findById(un).get(), customer);
//					sessionService.setAttribute("username", customer.getUsername());
//					if (rm == true) {
//						cookieService.add("username", un, 10);
//						cookieService.add("password", pw, 10);
////						model.addAttribute("check", "checked");
//					} else {
//						cookieService.remove("username");
//						cookieService.remove("password");
//					}
//					return "home";
//				} else {
//					return "login";
//				}
//			}
//			return "login";
//		} catch (Exception e) {
//			return "login";
//		}
//	}
}
