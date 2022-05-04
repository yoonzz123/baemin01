package com.spring.baemin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.baemin.dao.DeliveryDao;
import com.spring.baemin.dao.StoreDao;
import com.spring.baemin.domain.Delivery;
import com.spring.baemin.domain.Store;
@Service
public class DeilveryServiceImpl implements DeliveryService {
	
	@Autowired
	private StoreDao storeDao;
	@Autowired
	private DeliveryDao deliveryDao;
	@Override
	public Map<String, Object> getDeliveryList(int storeNo) {
		
		Map<String, Object> mapModel = new HashMap<String,Object>();
		List<Delivery> dList = new ArrayList<Delivery>();
		
		Store store = storeDao.getStore(storeNo);
		dList = deliveryDao.getDeliveryList(storeNo);
		
		
		mapModel.put("dList", dList);
		mapModel.put("store", store);
		
		return mapModel;
	}

	@Override
	public void deliveryInsert(Delivery delivery) {
		deliveryDao.deliveryInsert(delivery);
	}
	@Override
	public void deliveryUpdate(Delivery delivery) {
		deliveryDao.deliveryUpdate(delivery);
	}
	@Override
	public void deliveryDelete(int deliNo) {
		deliveryDao.deliveryDelete(deliNo);
	}
	
	
}
