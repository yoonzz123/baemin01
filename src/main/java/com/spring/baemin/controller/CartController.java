package com.spring.baemin.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.baemin.service.CartService;

@Controller                 
public class CartController {
	
	@Autowired
	private CartService cartService;
		
	@RequestMapping("cartForm")
	public String  getCartList(Model model, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		
		Map<String, Object> modelMap = cartService.getCartList(user_id);
		System.out.println(modelMap);
		model.addAllAttributes(modelMap);
		return "cart/cartListForm";
	}
	
	@RequestMapping("cartDelete")
	public String cartDelete(HttpSession session, int cartNo) {
		String user_id = (String) session.getAttribute("user_id");
		cartService.cartDelete(cartNo, user_id);
		return "redirect:cartForm";
	}
	
}
