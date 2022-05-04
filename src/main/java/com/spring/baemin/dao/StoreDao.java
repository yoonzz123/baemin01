package com.spring.baemin.dao;

import java.util.List;

import com.spring.baemin.domain.Store;

public interface StoreDao {
	public abstract void storeInsert(Store store);
	public abstract Store getStore(int storeNo);
	public abstract List<Store> getStoreList(String comId, int mainCat);
	public abstract void storeUpdateProcess(Store store);
	public abstract void storeDelete(int storeNo);
}
