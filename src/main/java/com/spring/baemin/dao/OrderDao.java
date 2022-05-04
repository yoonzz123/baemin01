package com.spring.baemin.dao;

import java.util.List;

import com.spring.baemin.domain.Cart;
import com.spring.baemin.domain.Order;
import com.spring.baemin.domain.Product;

public interface OrderDao {
	
	public abstract int odrInsert(Order order);
	
	public abstract List<Order> getOrderList(String user_id);
	
	public abstract List<Product> getProductList(int odrNo);
	
	public abstract List<Cart> getCartList(int odrNo);
	
}
