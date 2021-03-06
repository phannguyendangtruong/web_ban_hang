package com.dangtruong.model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartItem {
	private int productId;
	private String productName;
	private int quantity;
	private int price;
	private String previousImg;

}
