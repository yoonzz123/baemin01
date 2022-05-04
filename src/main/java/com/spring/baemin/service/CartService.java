package com.spring.baemin.service;

import java.util.Map;

import com.spring.baemin.domain.Cart;

public interface CartService {
	public abstract void cartAdd(Cart cart);
	public abstract Map<String, Object> getCartList(String user_id);
	public abstract void cartDelete(int cartNo, String user_id);
}
