package com.dangtruong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dangtruong.dao.CustomerDAO;
import com.dangtruong.dao.StaffDAO;
import com.dangtruong.model.Customer;
import com.dangtruong.model.Staff;
import com.dangtruong.utils.MaillerService;
import com.dangtruong.utils.ParamService;
import com.dangtruong.utils.SessionService;



@Controller
public class AccountController {
	
	@Autowired
	 SessionService sessionService;
	
	@Autowired
	 ParamService paramService;
	
	@Autowired
	CustomerDAO cusDao;
	
	@Autowired
	StaffDAO staffDAO;
	
	@Autowired
	MaillerService maillService;
	
	static int otp = 0;
	
	@RequestMapping("account")
	public String account(Model model, @ModelAttribute("userAcount") Staff staff) {
		String username = sessionService.getAttribute("username");
		staff = staffDAO.findByUsername(username);
		model.addAttribute("userAcount", staff);
		return "account";
	}
	
	@RequestMapping("accountCustomer")
	public String accountAdmin(Model model, @ModelAttribute("customerAccount") Customer customer) {
		String username = sessionService.getAttribute("username");
		customer = cusDao.findByUsernameCustomer(username);
		model.addAttribute("customerAccount", customer);
		return "accountCustomer";
	}
	
	@RequestMapping("change-pass")
	public String changePassword(Model model) {
		List<Staff> list = staffDAO.listUsername(sessionService.getAttribute("username"));
		String pass = paramService.getString("password", "");
		String newpass = paramService.getString("newpass", "");
		String newpass2 = paramService.getString("confirm", "");
		if(list.get(0).getPassword().equals(pass)) {
			if(newpass.equals(newpass2)) {
				list.get(0).setPassword(newpass2);
				staffDAO.saveAll(list);
			}
		}else {
			model.addAttribute("error", "Vui lòng kiểm tra lại mật khẩu");
		}
		return "home";
	}
	
	@PostMapping("change-account")
	public String changeAccount(@ModelAttribute("userAcount") Staff staff) {
		staffDAO.save(staff);
		return "account";
	}
	
	@PostMapping("change-account-customer")
	public String changAccountAdmin(@ModelAttribute("customerAccount") Customer customer) {
		cusDao.save(customer);
		return "accountCustomer";
	}
	
	@RequestMapping("/signup")
	public String signup(@ModelAttribute("newUser")Customer customer) {
		return "register";
	}
	
	@PostMapping("register")
	public String register(@ModelAttribute("newUser") Customer customer) {
		Boolean gender = paramService.getBoolean("gender", false);
		customer.setGender(gender);
		String phone = customer.getPhone();
		phone = phone.substring(1, phone.length());
		sessionService.setAttribute("newAccount", customer);
		
		double randomDouble = Math.random();
        randomDouble = 1000+(randomDouble * 10000 + 1);
        int randomInt = (int) randomDouble;
		otp = randomInt;
		
		send s = new send();
		s.sendotp(phone,otp);
		
		return "confirm";
	}
	
	@PostMapping("confirm")
	public String register(@RequestParam("otp") int otp2, Model model) {
		if(otp == otp2) {
			Customer customer = sessionService.getAttribute("newAccount");
			model.addAttribute("errorotp", "	");
			cusDao.save(customer);
		}else {
			model.addAttribute("errorotp", "Sai mã xác thực");
			return "confirm";
		}
		return "login";
	}
	
	@RequestMapping("/forgot")
	public String forgot() {
		return "forgot";
	}
	
	@PostMapping("/forgot")
	public String forgot(@RequestParam("email") String email, Model model) {
		try {
			Customer list = cusDao.findByEmail(email);
			maillService.queue(email,"Khôi phục mật khẩu","Mật khẩu của bạn là : "+list.getPassword());
		}catch(Exception e) {
			model.addAttribute("error", "Email không tồn tại");
			return "forgot";
		}
		return "login";
	}
	
	
}
