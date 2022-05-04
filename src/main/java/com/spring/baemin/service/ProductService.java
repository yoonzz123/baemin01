package com.spring.baemin.service;

import java.util.Map;

import com.spring.baemin.domain.Product;

public interface ProductService {
	public abstract void productInsert(Product product);
	public abstract Map<String, Object> getProductList(int storeNo);
	public abstract Product getProduct(int productNo);
}

