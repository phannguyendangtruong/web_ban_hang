package com.dangtruong.utils;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.dangtruong.dao.ProductDAO;
import com.dangtruong.model.CartItem;

@Service
@SessionScope
public class ShoppingCartServiceImplement implements ShoppingCartService {
	
	@Autowired
	ProductDAO dao;

	@Autowired
	SessionService sessionService;
	
	@Autowired
	ParamService paramService;

	private Map<Integer, CartItem> map = new HashMap<>();

	@Override
	public void add(CartItem item) {
		CartItem c = map.get(item.getProductId());
		int price = dao.findById(item.getProductId()).get().getPrice();
		if (c != null) {
			c.setQuantity(item.getQuantity() + c.getQuantity());
			c.setPrice(price * c.getQuantity());
		} else {
			map.put(item.getProductId(), item);
		}

		Set<Integer> set = map.keySet();
		int quantity = 0;
		for (Integer key : set) {
			quantity += map.get(key).getQuantity();
		}
		
		String a = paramService.getString("quantity", "");
		System.out.println(a);
		
		sessionService.setAttribute("quantity", quantity);
		sessionService.setAttribute("listCartProduct", map);
		// System.out.println(map.get(11).getProductName());

	}

	@Override
	public void remove(int id) {
		map.remove(id);
		Set<Integer> set = map.keySet();
		int quantity = 0;
		for (Integer key : set) {
			quantity += map.get(key).getQuantity();
		}
		sessionService.setAttribute("quantity", quantity);
	}

	@Override
	public Collection<CartItem> getCartItem() {
		return map.values();
	}

	@Override
	public void clear() {
		map.clear();
	    sessionService.setAttribute("quantity", 0);
	}

	@Override
	public void update(int id, int quantity) {
		CartItem item = map.get(id);
		item.setQuantity(quantity);
		item.setPrice((quantity * dao.findById(id).get().getPrice()));
		if (item.getQuantity() <= 0) {
			map.remove(id);
		}
		Set<Integer> set = map.keySet();
		int quantity1 = 0;
	        for (Integer key : set) {
	            quantity1+=map.get(key).getQuantity();
	        }
	    sessionService.setAttribute("quantity", quantity1);
	}

	@Override
	public double getAmount() {
		return map.values().stream().mapToDouble(item -> item.getQuantity() * Integer.valueOf(item.getPrice())).sum();
	}

	@Override
	public int getCount() {
		if (map.isEmpty()) {
			return 0;
		}
		return map.values().size();
	}

//	public double getQuantity() {
//		map.get(0).get
//		return 1;
//	}

}
