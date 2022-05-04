package com.spring.baemin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.baemin.domain.Store;
import com.spring.baemin.service.WishService;

@Controller
public class WishController {
	
	@Autowired private WishService wishService;
	
	@RequestMapping(value = "wishClick", method = RequestMethod.POST)
	@ResponseBody
	public int wishClick(@RequestParam Long store_no, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		
		if(user_id == null) {
			return -1;			
		} else {
			return wishService.wishClick(store_no, user_id);			
		}
		
	}
	
	@RequestMapping(value = "wishCount", method = RequestMethod.POST)
	@ResponseBody
	public int wishCount(@RequestParam Long store_no) {
		return wishService.wishCount(store_no);
	}
	
	@RequestMapping(value = "wishList", method = RequestMethod.POST)
	@ResponseBody
	public List<Object> wishList(@RequestParam int catNo) {
		return wishService.wishPopularList(catNo);
	}
	
	@RequestMapping(value = "userWishForm", method = RequestMethod.GET)
	public String wishList(HttpSession session, Model model) {
		String user_id = (String) session.getAttribute("user_id");
		List<Store> sList = wishService.wishList(user_id);
		model.addAttribute("sList", sList);
		return "user/myPage/userWishListForm";
	}
}
