package com.spring.baemin.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.baemin.domain.Product;
import com.spring.baemin.domain.Store;
import com.spring.baemin.service.ProductService;
import com.spring.baemin.service.StoreService;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	@Autowired
	private ProductService productService;
	
	private final static String DEFAULT_PATH = "/resources/upload/";
	
	@RequestMapping(value="storeInsert", method=RequestMethod.POST)
	public String storeInsertProcess(Store store, String phone1, String phone2, String phone3,
			@RequestParam(value="storeImage", required=false) MultipartFile multipartFile, HttpServletRequest request) throws IOException{
		
		if(!multipartFile.isEmpty()) {
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
			
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "-" + multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			System.out.println("insertStore - newName : " + file.getName());
			
			multipartFile.transferTo(file);
			
			store.setStoreImg(saveName);
		}		
		
		store.setStorePhone(phone1 + "-" + phone2 + "-" + phone3);
		storeService.storeInsert(store);
		return "redirect:company";
	}
	
	@RequestMapping("storeListForm")
	public String storeList(Model model, String comId,int mainCat) {
		Map<String, Object> mapModel = storeService.getStoreList(comId, mainCat);
		model.addAllAttributes(mapModel);
		
		return "product/storeListForm";
	}
	
	@RequestMapping("storeDetailForm")
	public String getStore(Model model, Product product, String comId,Store store) throws Exception {
		Map<String, Object> mapModel = new HashMap<String, Object>();
		mapModel = productService.getProductList(product.getStoreNo());
		
		if(store.getStoreImg() != null) {
			model.addAttribute("fileName", URLEncoder.encode(store.getStoreImg(), "utf-8"));
		} 
		
		model.addAttribute("storeNo", product.getStoreNo());
		model.addAllAttributes(mapModel);
		
		return "product/storeDetailForm";
	}
	
	@RequestMapping("storeUpdateForm")
	public String storeUpdateForm(Model model, int storeNo) {
		
		Store store = storeService.storeUpdateForm(storeNo);
		String phone1 = "";
		String phone2 = "";
		String phone3 = "";
		
		if(store.getStorePhone() != null && store.getStorePhone().length() == 13) {
			phone1 = store.getStorePhone().substring(0, 3); 
			phone2 = store.getStorePhone().substring(4, 8);
			phone3 = store.getStorePhone().substring(9, 13);
		}
		
		model.addAttribute("store", store);
		model.addAttribute("phone1", phone1);
		model.addAttribute("phone2", phone2);
		model.addAttribute("phone3", phone3);
		
		return "store/storeInsertForm";
	}
	
	@RequestMapping(value="storeUpdate", method=RequestMethod.POST)
	public String storeUpdateProcess(Store store, String phone1, String phone2, String phone3,
			@RequestParam(value="storeImage", required=false) MultipartFile multipartFile, HttpServletRequest request) throws IOException{
		
		if(!multipartFile.isEmpty()) {
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
			
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "-" + multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			System.out.println("insertStore - newName : " + file.getName());
			
			multipartFile.transferTo(file);
			
			store.setStoreImg(saveName);
		}		
		store.getStoreNo();
		store.setStorePhone(phone1 + "-" + phone2 + "-" + phone3);
		storeService.storeUpdateProcess(store);
		return "redirect:company";
	}
	
	@RequestMapping("storeDelete")
	public String sotreDelete(int storeNo) {
		storeService.storeDelete(storeNo);
		return "redirect:company";
	}
	
}
