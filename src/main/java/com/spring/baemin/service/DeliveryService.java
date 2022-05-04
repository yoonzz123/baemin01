package com.spring.baemin.service;

import java.util.Map;

import com.spring.baemin.domain.Delivery;

public interface DeliveryService {
	public abstract Map<String, Object> getDeliveryList(int storeNo);
	
	public abstract void deliveryInsert(Delivery delivery);

	public abstract void deliveryUpdate(Delivery delivery); 
	
	public abstract void deliveryDelete(int deliNo);
}
