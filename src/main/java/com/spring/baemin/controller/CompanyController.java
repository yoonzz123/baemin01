package com.spring.baemin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.baemin.domain.Company;
import com.spring.baemin.service.ComService;
import com.spring.baemin.service.StoreService;

@Controller
@SessionAttributes("company")
public class CompanyController {

	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);

	@Autowired
	private ComService comService;
	@Autowired
	private StoreService storeService;
	
	@RequestMapping("companyLoginForm")
	public String userLoginForm() {
		logger.info("사장 로그인폼 들어옴.");
	
		return "company/companyLoginForm";
	}

	@RequestMapping("companyLoginProcess")
	public String companyLoginProcess(String comId, String comPass,
			Model model, HttpSession session) {
		
		logger.info("사장 로그인폼 들어옴.");
		String result = comService.comPassCheck(comId);
		boolean isCompany = false;
		if(result.equals(comPass)) {
			isCompany = true;
		}
		session.setAttribute("isCompany", isCompany);
		session.setAttribute("comId", comId);
		
		return "redirect:/company";
	}
	
	@RequestMapping("company")
	public String company(Model model, HttpSession session,
			@RequestParam(value="mainCat", required=false, defaultValue="0")int mainCat) {
		logger.info("사장 메인화면 들어옴.");
		String comId = (String) session.getAttribute("comId");
		session.getAttribute("mainCat");
		
		Map<String, Object> mapModel = new HashMap<String, Object>();
		mapModel = storeService.getStoreList(comId,mainCat);
		
		model.addAllAttributes(mapModel);
		
		return "company/companyMain";
	}
	@RequestMapping("comLogout")
	public String comLogout(HttpSession session) {
		session.invalidate();
		return "company/companyMain";
	}
	@RequestMapping(value="comInsertProcess", method=RequestMethod.POST)
	public String comInsertProcess(Company company,
			String comEmail, String domain,String comPhone1,
			String comPhone2,String comPhone3) {
		
		company.setComEmail(comEmail + "@" + domain);
		company.setComPhone(comPhone1 + "-" + comPhone2 + "-" +comPhone3);
		
		comService.insertCom(company);
		
		
		return "company/companyLoginForm";
	}
	@RequestMapping("companyUpdateProcess")
	public String companyUpdate(Model model, Company company,
			String comPass, String comEmail, String domain, String comPhone1,String comPhone2,String comPhone3
			) {
		company.setComPass(comPass);
		company.setComEmail(comEmail + "@" + domain);
		company.setComPhone(comPhone1 + "-" + comPhone2 + "-" + comPhone3);
		
		comService.updateCompany(company);
		
		model.addAttribute("company", company);
		
		return "company/companyMain";
	}
	@RequestMapping("companydeleteProcess")
	public String companyDelete(String comId,HttpSession session) {

		comService.deleteCompany(comId);
		session.invalidate();
		return "company/companyLoginForm";
	}
}
