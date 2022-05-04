package com.spring.baemin.dao;

import java.util.List;

import com.spring.baemin.domain.Store;

public interface WishDao {

	void wishInsert(Long store_no, String user_id);
	int wishCheck(Long store_no, String user_id);
	void wishDelete(Long store_no, String user_id);
	int wishCount(Long store_no);
	List<Store> wishList(String user_id);
	List<Object> wishPopularList(int catNo);
	
}
