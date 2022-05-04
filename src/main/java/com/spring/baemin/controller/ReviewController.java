package com.spring.baemin.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.baemin.domain.Review;
import com.spring.baemin.domain.Store;
import com.spring.baemin.service.ProductService;
import com.spring.baemin.service.ReviewService;

@Controller
public class ReviewController {
	
	private ProductService productService;
	private ReviewService reviewService;
	
	@Autowired
	public ReviewController(ProductService productService, ReviewService reviewService) {
		this.productService = productService;
		this.reviewService = reviewService;
	}
	
	@RequestMapping(value = "review", method = RequestMethod.GET)
	public String reviewList(@RequestParam int storeNo, Model model, Store store) throws Exception {
		Map<String, Object> mapModel = new HashMap<String, Object>();
		mapModel = productService.getProductList(storeNo);
		
		if(store.getStoreImg() != null) {
			model.addAttribute("fileName", URLEncoder.encode(store.getStoreImg(), "utf-8"));
		}
		
		model.addAllAttributes(mapModel);
		
		return "review/review";
	}
	

	@RequestMapping(value = "review/insert", method = RequestMethod.POST)
	@ResponseBody
	public List<Review> insertReview(Review review, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		review.setUser_id(user_id);
		reviewService.insertReview(review);
		return reviewService.selectReview(review.getProduct_no());
	}

	@RequestMapping(value = "review/reviewList", method = RequestMethod.POST)
	@ResponseBody
	public List<Review> insertReview(@RequestParam int store_no) {
		return reviewService.selectReview(store_no);
	}
	
}
