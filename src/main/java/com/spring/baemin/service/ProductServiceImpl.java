package com.spring.baemin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.baemin.dao.ProductDao;
import com.spring.baemin.dao.StoreDao;
import com.spring.baemin.domain.Product;
import com.spring.baemin.domain.Store;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDao productDao;
	@Autowired
	private StoreDao storeDao;
	
	@Override
	public void productInsert(Product product) {
		productDao.productInsert(product);
	}
	@Override
	public Map<String, Object> getProductList(int storeNo) {
		
		Map<String, Object> mapModel = new HashMap<String, Object>();
		List<Product> pList = new ArrayList<Product>();
		Store store = storeDao.getStore(storeNo);
		
		pList = productDao.getProductList(storeNo);

		mapModel.put("pList", pList);
		mapModel.put("store", store);

		return mapModel;
	}
	@Override
	public Product getProduct(int productNo) {
		
		return productDao.getProduct(productNo);
	}
	
	
	
	
}
