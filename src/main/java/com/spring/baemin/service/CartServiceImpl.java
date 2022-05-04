package com.spring.baemin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.baemin.dao.CartDao;
import com.spring.baemin.dao.ProductDao;
import com.spring.baemin.domain.Cart;
import com.spring.baemin.domain.Product;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDao cartDao;
	@Autowired
	private ProductDao productDao;
	
	@Override
	public void cartAdd(Cart cart) {

		int result = cartDao.isProductCheck(cart);
		cartDao.cartAdd(cart, result);
	}

	@Override
	public Map<String, Object> getCartList(String user_id) {
		int productNo = 0;
		int totalAmt = 0;
		int totalCnt = 0;
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		Cart cart = new Cart();
		cart.setUser_id(user_id);
		cart.setProductNo(productNo);
	
		int cartCnt = cartDao.isProductCheck(cart);
		boolean cartListCheck = false;
		
		if(cartCnt != 0) {
			cartListCheck= true;
			
			List<Product> pList = productDao.getCartList(user_id);
			List<Cart> cList = cartDao.getCartList(user_id);
			modelMap.put("pList", pList);
			modelMap.put("cList", cList);
			for(int i = 0; i < cList.size(); i++) {
				totalAmt += cList.get(i).getCartAmt();
				totalCnt += cList.get(i).getCartCnt();
			}
		}
		modelMap.put("cartListCheck", cartListCheck);
		modelMap.put("totalAmt", totalAmt);
		modelMap.put("totalCnt", totalCnt);
		
		return modelMap;
	}

	@Override
	public void cartDelete(int cartNo, String user_id) {
		
		cartDao.cartDelete(cartNo, user_id);
	}
	
	

}
