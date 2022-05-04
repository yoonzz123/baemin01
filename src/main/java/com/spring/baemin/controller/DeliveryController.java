package com.spring.baemin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.baemin.domain.Delivery;
import com.spring.baemin.service.DeliveryService;

@Controller
public class DeliveryController {
	
	@Autowired
	private DeliveryService deliveryService;
	
	@RequestMapping("/storeDetailInfo")
	public String deliveryList(Model model,int storeNo) {
		
		Map<String, Object> mapModel = deliveryService.getDeliveryList(storeNo);
		model.addAllAttributes(mapModel);
		
		return "product/storeDetailInfo";
	}
	@RequestMapping("/deliveryInsertFrom")
	public String deliveryInsertForm(Model model, String storeNo) {
		model.addAttribute("storeNo",storeNo);
		
		return "product/deliveryInsertForm";
	}
	@RequestMapping(value="/deliveryInsertProcess", method=RequestMethod.POST)
	public String deliveryInsertProcess(RedirectAttributes reAttrs, Delivery delivery) {
		
		deliveryService.deliveryInsert(delivery);
		
		reAttrs.addAttribute("storeNo", delivery.getStoreNo());
		
		return "redirect:storeDetailForm";
	}
	@RequestMapping("/deliveryUpdateForm")
	public String deliveryUpdateForm(Model model, String storeNo,String deliNo) {
		model.addAttribute("storeNo",storeNo);
		model.addAttribute("deliNo", deliNo);
		
		return "product/deliveryUpdateForm";
	}
	@RequestMapping("/deliveryUpdateProcess")
	public String deliveryUpdateProcess(Model model,
			RedirectAttributes reAttrs,String storeNo,Delivery delivery,int deliNo,
			String deliArea,String deliPrice) {
			
		deliveryService.deliveryUpdate(delivery);
		
		model.addAttribute("deliPrice",deliPrice);
		model.addAttribute("deliArea", deliArea);
		reAttrs.addAttribute("storeNo", storeNo);
		model.addAttribute("deliNo", deliNo);
		System.out.println(delivery);
		
		return "redirect:storeDetailInfo";
	}
	
	@RequestMapping("/deliveryDelete")
	public String deleveryDelete(RedirectAttributes reAttrs,
			int deliNo,String storeNo) {
		
		deliveryService.deliveryDelete(deliNo);
		reAttrs.addAttribute("storeNo", storeNo);
		return "redirect:storeDetailInfo";
	}
	
}





