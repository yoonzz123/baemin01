package com.spring.baemin.service;

import java.util.List;

import com.spring.baemin.domain.Store;

public interface WishService {
	int wishClick(Long store_no, String user_id);

	int wishCount(Long store_no);

	List<Store> wishList(String user_id);

	List<Object> wishPopularList(int catNo);
}
