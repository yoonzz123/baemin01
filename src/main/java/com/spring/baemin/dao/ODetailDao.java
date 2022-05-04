package com.spring.baemin.dao;

import java.util.List;

import com.spring.baemin.domain.Cart;

public interface ODetailDao {
	public abstract void oDetailInsert(int odrNo, List<Cart> cartList);
}
