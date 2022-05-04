package com.spring.baemin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.baemin.dao.DeliveryDao;
import com.spring.baemin.dao.StoreDao;
import com.spring.baemin.domain.Store;


@Service
public class StoreServiceImpl implements StoreService {
	
	public StoreDao storeDao;
	public DeliveryDao deliveryDao;
	@Autowired
	public void setStoreDao(StoreDao storeDao) {
		this.storeDao = storeDao;
	}
	@Autowired
	public void setDeliveryDao(DeliveryDao deliveryDao) {
		this.deliveryDao = deliveryDao;
	}

	@Override
	public void storeInsert(Store store) {
		storeDao.storeInsert(store);
	}

	@Override
	public Map<String, Object> getStoreList(String comId, int mainCat) {
		
		List<Store> sList = new ArrayList<Store>();
		sList = storeDao.getStoreList(comId,mainCat);
		
		
		Map<String, Object> mapModel = new HashMap<String, Object>();
		mapModel.put("sList", sList);		
		
		return mapModel;
	}
	@Override
	public Store storeUpdateForm(int storeNo) {
		return storeDao.getStore(storeNo);
	}
	@Override
	public void storeUpdateProcess(Store store) {
		storeDao.storeUpdateProcess(store);	
	}
	@Override
	public void storeDelete(int storeNo) {
		storeDao.storeDelete(storeNo);
	}
}
