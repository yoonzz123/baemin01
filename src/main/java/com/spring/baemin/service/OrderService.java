package com.spring.baemin.service;

import java.util.Map;

import com.spring.baemin.domain.Order;
import com.spring.baemin.domain.User;

public interface OrderService {
	public abstract User odrForm(String user_id);
	public abstract Map<String, Object> odrInsert(Order odr);
	public abstract Map<String, Object> getOrderList(String user_id);	
//	public abstract void odrDelete(int cartNo);
}
