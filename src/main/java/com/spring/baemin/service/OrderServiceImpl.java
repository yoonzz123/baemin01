package com.spring.baemin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.baemin.dao.CartDao;
import com.spring.baemin.dao.ODetailDao;
import com.spring.baemin.dao.OrderDao;
import com.spring.baemin.dao.ProductDao;
import com.spring.baemin.dao.StoreDao;
import com.spring.baemin.dao.UserDao;
import com.spring.baemin.domain.Cart;
import com.spring.baemin.domain.Order;
import com.spring.baemin.domain.Product;
import com.spring.baemin.domain.Store;
import com.spring.baemin.domain.User;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDao odrDao;
	@Autowired
	private ODetailDao oDetailDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private CartDao cartDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private StoreDao storeDao;
	
	
	@Override
	public User odrForm(String user_id) {
		User user = userDao.getUser(user_id);		
		return user;
	}

	@Override
	public Map<String, Object> odrInsert(Order odr) {
		
		String user_id = odr.getUser_id();
		
		// odrInsert(oDetailInsert에 들어갈 odrNo, cartNoList setting)
		// odr Insert & odrNo setting
		int odrNo = odrDao.odrInsert(odr);
				
		// cartNoList setting
		List<Cart> cartList = cartDao.getCartList(user_id);

		// oDetailInsert
		oDetailDao.oDetailInsert(odrNo, cartList);
		
		// getOdrList
		int productNo = cartDao.getCartList(user_id).get(0).getProductNo(); 
		int storeNo = productDao.getProduct(productNo).getStoreNo();
		
		// cartDelete
		cartDao.cartUpdate(user_id);
		
		Store oStore = storeDao.getStore(storeNo);
	
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		modelMap.put("oStore", oStore);
		return null;
	}

	@Override
	public Map<String, Object> getOrderList(String user_id) {
		
		// 폼 전송을 위한 List 생성
		List<Order> oList = new ArrayList<Order>();
		List<Cart> cList = new ArrayList<Cart>();
		List<Product> pList = new ArrayList<Product>();
		List<Store> sList = new ArrayList<Store>();
		
		// 유저별 주문 목록 요청
		oList = odrDao.getOrderList(user_id);
		
		if(oList.size() != 0) {
			for(int i = 0; i < oList.size(); i++) {
				
				// 주문별 카트, 프로덕트 리스트 요청
				int odrNo = oList.get(i).getOdrNo();
				
				cList = odrDao.getCartList(odrNo);
				pList = odrDao.getProductList(odrNo);
				
				System.out.println("cartNo : " + cList.get(i).getCartNo());
				System.out.println("productNo : " + pList.get(i).getProductNo());
				
				// 주문리스트 2차원 배열 생성 
				oList.get(i).setcList(cList);
				oList.get(i).setpList(pList);
				
				// 주문별 상점 정보 요청
				int storeNo = pList.get(i).getStoreNo();
				Store s = storeDao.getStore(storeNo);
				
				// 주문별 상점 정보 입력
				sList.add(s);
			}
			// 맵 생성 및 주문, 상정 목록 맵 전달
			Map<String, Object> odrListMap = new HashMap<String, Object>();
			odrListMap.put("oList", oList);
			odrListMap.put("sList", sList);
			odrListMap.put("odrListCheck", true);
			
			return odrListMap;
		} else {
			 Map<String, Object> odrListMap = new HashMap<String, Object>();
			 odrListMap.put("odrListCheck", false);
			 return odrListMap;
		}
	}

}
