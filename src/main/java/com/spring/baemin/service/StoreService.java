package com.spring.baemin.service;


import java.util.Map;

import com.spring.baemin.domain.Store;

public interface StoreService {
	
	public abstract void storeInsert(Store store);
	public abstract Map<String, Object> getStoreList(String comId,int mainCat);
	public abstract Store storeUpdateForm(int storeNo);
	public abstract void storeUpdateProcess(Store store);
	public abstract void storeDelete(int storeNo);
}
