package com.dangtruong.utils;

import java.util.Collection;

import com.dangtruong.model.CartItem;

public interface ShoppingCartService{

	int getCount();

	double getAmount();

	void update(int id, int quantity);

	void clear();

	Collection<CartItem> getCartItem();

	void remove(int id);

	void add(CartItem item);

}
