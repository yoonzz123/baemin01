package com.spring.baemin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.baemin.domain.Product;
import com.spring.baemin.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/productInsertForm")
	public String productInsertForm(Model model, String storeNo) {
		model.addAttribute("storeNo", storeNo);
		return "product/productInsertForm";
	}
	
	@RequestMapping("/productDetailForm")
	public String productDetailForm(Model model, int storeNo, int productNo) {
		
		Product product = productService.getProduct(productNo);
		
		
		model.addAttribute("productNo", productNo);
		model.addAttribute("p", product);
		model.addAttribute("storeNo", storeNo);
		return "product/productDetailForm";
	}
	
	@RequestMapping(value="/productInsertProcess", method=RequestMethod.POST)
	public String productInsertProcess(RedirectAttributes reAttrs, Product product) {
		
		productService.productInsert(product);
		
		reAttrs.addAttribute("storeNo", product.getStoreNo());
		return "redirect:storeDetailForm";
	}
	
}
