package com.dangtruong.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dangtruong.dao.ProductDAO;
import com.dangtruong.model.CartItem;
import com.dangtruong.model.Product;
import com.dangtruong.utils.ParamService;
import com.dangtruong.utils.SessionService;
import com.dangtruong.utils.ShoppingCartService;

import ch.qos.logback.core.joran.util.beans.BeanUtil;

@Controller
public class ShoppingCartController {
	@Autowired
	ProductDAO dao;
	
	@Autowired
	ShoppingCartService shoppingCartService;
	
	@Autowired
	ParamService paramService;
	
	@Autowired
	SessionService sessionService;
	
	
	@PostMapping("add")
	public String add(@RequestParam("id") Integer id,  Model model) {
		Optional<Product> pro =  dao.findById(id);
		CartItem item = new CartItem();
		int quantity =  (int) paramService.getInt("quantity", 0);
		if(pro!=null) {
			BeanUtils.copyProperties(pro.get(), item);
			item.setQuantity(quantity);
			shoppingCartService.add(item);
		}
		int idProduct = sessionService.getAttribute("productId");
		return "redirect:/productdetails?id="+idProduct;
	}
	
	@GetMapping("remove/{id}")
	public String remove(@PathVariable("id") Integer id, Model model) {
		shoppingCartService.remove(id);
		model.addAttribute("hienthi", "1");
		return "redirect:/cart";
	}
	
	@PostMapping("update/{id}")
	public String update(@PathVariable("id")Integer id) {
		String quan = paramService.getString("quantity", "");
		int quantity = Integer.valueOf(quan.trim());
		shoppingCartService.update(id, quantity);
		return "redirect:/cart";
	}
	
	@GetMapping("clear")
	public String clear() {
		shoppingCartService.clear();
		return "redirect:/home";
	}
	
}
