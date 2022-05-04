package com.spring.baemin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.baemin.dao.CartDao;
import com.spring.baemin.dao.ProductDao;
import com.spring.baemin.dao.UserDao;
import com.spring.baemin.domain.Cart;
import com.spring.baemin.domain.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	@Autowired
	private CartDao cartDao;
	@Autowired
	private ProductDao productDao;
	
	@Override
	public void userJoinProcess(User user) {
		userDao.userJoinProcess(user);
	}

	@Override
	public Map<String, Object> userLoginProcess(String user_pass, String user_id) {
		
		
		int cartCnt = 0;
		int productNo = 0;
		int storeNo = 0;
		boolean isLogin = false;
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Cart> cartList = new ArrayList<Cart>();
		
		if(user_pass.equals(userDao.userLoginProcess(user_id))) {
			isLogin = true;
			map.put("user_id", user_id);
			// 로그인 성공 시 카트 DAO 호출
			cartCnt = cartDao.cartCnt(user_id);
			System.out.println(cartCnt);
			if(cartCnt != 0) {
				cartList = cartDao.getCartList(user_id);
				productNo = cartList.get(0).getProductNo();
				storeNo = productDao.getProduct(productNo).getStoreNo();
				
				// Map 카트 정보 저장
				
			} 
		}		
		System.out.println(storeNo);
		map.put("isLogin", isLogin);
		map.put("cartCnt", cartCnt);  
		map.put("productNo", productNo);
		map.put("storeNo", storeNo);
		return map;
	}

	@Override
	public Map<String, Object> userFindId(String user_email, String user_name) {
		int result = -1;

		int emailCheck = userDao.userEmailCheck(user_email);
		int nameCheck = userDao.userNameCheck(user_email, user_name);
		String user_id = "";
		
		if(emailCheck == 1 && nameCheck == 0) {
			result = 0;
		} 
		if(nameCheck == 1 && nameCheck ==1) {
			result = 1;
			user_id = userDao.getUserId(user_email);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("user_id", user_id);
		map.put("result", result);
		
		return map;
	}
	
	@Override
	public Map<String, Object> userFindPass(String user_email, String user_name, String user_id){
	 
		int result = -1;
	 
		int emailCheck = userDao.userEmailCheck(user_email);
		int nameCheck = userDao.userNameCheck(user_email, user_name);
		int idCheck = userDao.userIdCheck(user_email, user_name, user_id); 
		String user_pass = "";
	
		if(emailCheck == 1 && nameCheck == 0 && idCheck == 0) { 
			result = 0;
		}
		else if(emailCheck == 1 && nameCheck == 1 && idCheck == 0) {
			result = 1;
		}
		else if(emailCheck == 1 && nameCheck == 1 && idCheck == 1) {
			result = 3; 
			user_pass = userDao.getUserPass(user_email,user_name, user_id);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("user_pass", user_pass);
		map.put("result", result);
	
	 
		return map;
	
	}
	
	public int idCheck(String user_id) {
		
		int result = userDao.idCheck(user_id);
		
		return result;
	}
	
	public Map<String, Object> userUpdate(String user_id, String user_email){
		
		String result = userDao.userUpdate(user_id,user_email);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("user_id", user_id);
		map.put("user_email", user_email);
		map.put("result", result);
		
		return map;
	}
	
	public User userLoginCheck(String user_id, String user_pass){
		
		User user = userDao.userLoginCheck(user_id, user_pass);
	
		return user;
	}

	@Override
	public User getUser(String user_id) {
		return userDao.getUser(user_id);
	}

	@Override
	public void userUpdate1(User user) {
		userDao.userUpdate1(user);
	}

}
