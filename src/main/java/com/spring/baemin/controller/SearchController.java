package com.spring.baemin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.baemin.domain.Store;
import com.spring.baemin.service.SearchService;

@Controller
public class SearchController {

	@Autowired
	private SearchService searchService;
	
	@RequestMapping(value = "storeSearch", method = RequestMethod.POST)
	@ResponseBody
	public List<Store> storeSearch(@RequestParam String searchKey, HttpSession session) {
		
		String user_id = (String) session.getAttribute("user_id");
		List<Store> storeSerchesList = searchService.storeSerch(searchKey);
		
		if(user_id != null && !storeSerchesList.isEmpty()) {
			searchService.insertSearchKey(user_id, searchKey);
		}
		
		return storeSerchesList;
	}
	
	@RequestMapping(value = "searchForm", method = RequestMethod.GET)
	public String searchForm(HttpSession session) {
		return "search/searchForm";
	}
	
	@RequestMapping(value = "recentSearches", method = RequestMethod.POST)
	@ResponseBody
	public List<String> recentSearchesList(HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		
		if(user_id != null) {
			return searchService.recentSearches(user_id);
		} else {
			return null;
		}
	} 
	
	@RequestMapping(value = "popularSearch", method = RequestMethod.POST)
	@ResponseBody
	public List<Object> popularSearch(HttpSession session) {
			return searchService.popularSearch();
	} 
	
}