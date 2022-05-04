package com.spring.baemin.service;

import java.util.List;

import com.spring.baemin.domain.Store;

public interface SearchService {
	List<Store> storeSerch(String searchKey);

	void insertSearchKey(String user_id, String searchKey);

	List<String> recentSearches(String user_id);

	List<Object> popularSearch();
}
