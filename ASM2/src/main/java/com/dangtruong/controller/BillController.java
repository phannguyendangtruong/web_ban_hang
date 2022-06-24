package com.dangtruong.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dangtruong.dao.BillDAO;
import com.dangtruong.dao.BillDetailsDAO;
import com.dangtruong.dao.CustomerDAO;
import com.dangtruong.dao.ProductDAO;
import com.dangtruong.model.BillDetails;
import com.dangtruong.model.Bills;
import com.dangtruong.model.CartItem;
import com.dangtruong.model.Customer;
import com.dangtruong.utils.ParamService;
import com.dangtruong.utils.SessionService;
import com.dangtruong.utils.ShoppingCartService;

@Controller
public class BillController {

	@Autowired
	BillDAO billDao;

	@Autowired
	CustomerDAO cusDao;

	@Autowired
	BillDetailsDAO billDetailDao;

	@Autowired
	ProductDAO productDao;

	@Autowired
	SessionService sessionService;

	@Autowired
	ShoppingCartService shoppingCartService;

	@Autowired
	ParamService paramService;

	@Autowired
	BillDetailsDAO billDetailDAO;

	@PostMapping("add-bills")
	public String addBills() {
		String username = sessionService.getAttribute("username");
		String fullname = paramService.getString("fullname", null);
		String address = paramService.getString("address", null);
		System.out.println(fullname);

		if (username == null) {
			return "login";
		}
		if (fullname == null || address == null || fullname.equals("") || address.equals("")) {
			return "redirect:/cart";
		}
		Map<Integer, CartItem> map = sessionService.getAttribute("listCartProduct");
		if (map == null) {
			return "home";
		}
		Bills bill = new Bills();
		Customer customer = cusDao.findByUsername(sessionService.getAttribute("username")).get();
		bill.setCustomer(customer);
		billDao.save(bill);
		int totalPrice = sessionService.getAttribute("totalPrice");
		Set<Integer> set = map.keySet();
		for (Integer key : set) {
			BillDetails billdetails = new BillDetails();
			billdetails.setBills(bill);
			billdetails.setProduct(productDao.findByIdProduct(map.get(key).getProductId()));
			billdetails.setQuantity(map.get(key).getQuantity());
			billdetails.setBrandid(productDao.findByIdProduct(map.get(key).getProductId()).getBrand().getBrandId());
			billDetailDao.save(billdetails);
			// totalPrice += (map.get(key).getPrice() * map.get(key).getQuantity());
		}
		bill.setAddress(address);
		bill.setFullname(fullname);
		bill.setTotalPrice(totalPrice);
		billDao.save(bill);
		shoppingCartService.clear();

		return "home";
	}

	@RequestMapping("/status")
	public String status(Model model) {
		Optional<Customer> customer = cusDao.findByUsername(sessionService.getAttribute("username").toString());
		List<Bills> listBill = billDao.findBillOfUser(customer.get().getUsername());
		List<Bills> listTransport = billDao.findBillDontConfirm();
		List<Bills> listConfirm = billDao.billConfirm();
		model.addAttribute("listBill", listBill);
		model.addAttribute("listTransport", listTransport);
		model.addAttribute("listConfirm", listConfirm);
		return "status";
	}

	@RequestMapping("/order-details")
	public String orderDetails(@RequestParam("id") Integer id, Model model) {
		List<BillDetails> list = billDetailDAO.selectBillDetail(id);
		model.addAttribute("listOrder", list);
		return "order_details";
	}
}
