package com.spring.baemin.dao;

import java.util.List;

import com.spring.baemin.domain.Store;

public interface SearchDao {

	List<Store> storeSearch(String searchKey);

	void insertSearchKey(String user_id, String searchKey);

	List<String> recentSearches(String user_id);

	List<Object> popularSearch();
	
}
