package com.spring.baemin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.baemin.dao.SearchDao;
import com.spring.baemin.domain.Store;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchDao searchDao;
	
	@Override
	public List<Store> storeSerch(String searchKey) {
		return searchDao.storeSearch(searchKey);
	}

	@Override
	public void insertSearchKey(String user_id, String searchKey) {
		searchDao.insertSearchKey(user_id, searchKey);
	}

	@Override
	public List<String> recentSearches(String user_id) {
		return searchDao.recentSearches(user_id);
	}

	@Override
	public List<Object> popularSearch() {
		return searchDao.popularSearch();
	}

}
