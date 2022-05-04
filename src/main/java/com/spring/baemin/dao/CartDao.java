package com.spring.baemin.dao;

import java.util.List;

import com.spring.baemin.domain.Cart;

public interface CartDao {
	public abstract int isProductCheck(Cart cart);
	public abstract void cartAdd(Cart cart, int result);
	public abstract List<Cart> getCartList(String user_id);
	public abstract void cartDelete(int cartNo, String user_id);
	public abstract int cartCnt(String user_id);
	public abstract void cartUpdate(String user_id);
}
