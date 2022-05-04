package com.spring.baemin.ajax;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.baemin.domain.Cart;
import com.spring.baemin.service.CartService;

@Controller
public class CartAjaxController {
	
	@Autowired
	private CartService cartService;
	
	@RequestMapping("cartInsert")
	@ResponseBody
	public void cartInsert(int productNo, int cartCnt, int cartAmt, 
				HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		
		Cart cart = new Cart();
		cart.setUser_id(user_id);
		cart.setProductNo(productNo);
		cart.setCartCnt(cartCnt);
		cart.setCartAmt(cartAmt);
		
		cartService.cartAdd(cart);
		
	}
	
	@RequestMapping("cartUpdate.ajax")
	@ResponseBody
	public void cartDelete(HttpSession session, int cartCnt) {
		String user_id = (String) session.getAttribute("user_id");
		int storeNo = (int) session.getAttribute("storeNo");
		int cartNo = 0;
		
		cartService.cartDelete(cartNo, user_id);
		session.removeAttribute("storeNo");
		session.removeAttribute("cartCnt");
		session.setAttribute("storeNo", storeNo);
		session.setAttribute("cartCnt", cartCnt);
		
	}
	
}
