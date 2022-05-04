package com.spring.baemin.dao;

import java.util.List;

import com.spring.baemin.domain.Delivery;

public interface DeliveryDao {
	public abstract List<Delivery> getDeliveryList(int storeNo);
	
	public abstract void insertDeliveryList(Delivery delivery,List<Delivery> list);

	public abstract void deliveryInsert(Delivery delivery);

	public abstract void deliveryUpdate(Delivery delivery);

	public abstract void deliveryDelete(int deliNo);

}
