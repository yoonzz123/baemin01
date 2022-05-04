package com.spring.baemin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.baemin.domain.Address;
import com.spring.baemin.domain.User;
import com.spring.baemin.service.AddrService;
import com.spring.baemin.service.UserService;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;
	@Autowired
	private AddrService addrService;
	
	@RequestMapping("/home")
	public String Home() {
		return "user/main";
	}
	
	
	@RequestMapping("userJoinForm")
	public String userJoinForm() {
		logger.info("회원가입폼 입장.");

		return "user/userJoinForm";
	}

	@RequestMapping(value = "userJoinProcess", method = RequestMethod.POST)
	public String userJoinProcess(@RequestParam HashMap<String, String> param) {
		logger.info("회원가입시도 {}", param);

		User user = new User();
		user.setUser_id(param.get("user_id"));
		user.setUser_pass(param.get("user_pass"));
		user.setUser_name(param.get("user_name"));
		user.setUser_email(param.get("user_email"));
		user.setUser_nick(param.get("user_nick"));
		user.setUser_isadult(1);
		user.setUser_isclause(1);
		user.setUser_phone(param.get("user_phone"));

		userService.userJoinProcess(user);

		return "redirect:/";
	}

	@RequestMapping("userLoginForm")
	public String userLoginForm() {
		logger.info("로그인폼 들어옴.");

		return "user/userLoginForm";
	}

	@RequestMapping("userLoginProcess")
	public String userLoginProcess(HttpSession session, 
			String user_id, String user_pass) {
		logger.info("로그인시도.");

		Map<String, Object> modelMap = userService.userLoginProcess(user_pass, user_id);
		
		if((boolean)modelMap.get("isLogin") == true) {
			session.setAttribute("isLogin", (boolean)modelMap.get("isLogin"));
			session.setAttribute("user_id", modelMap.get("user_id"));
			session.setAttribute("cartCnt", modelMap.get("cartCnt"));
			session.setAttribute("productNo", modelMap.get("productNo"));
			session.setAttribute("storeNo", modelMap.get("storeNo"));
			logger.info("{}로그인함.", user_id);
	
			return "redirect:/";
		} else {
			
			return "redirect:/user/LoginForm";
		}
		
	}

	@RequestMapping("userLogoutProcess")
	public String userLogoutProcess(HttpServletRequest request) {
		logger.info("로그아웃");

		HttpSession session = request.getSession();
		session.invalidate();

		return "redirect:/";
	}
	
	@RequestMapping("/userFind")
	public String userFind(boolean userCheck, Model model) {
		
		model.addAttribute("userCheck", userCheck);
		
		return "user/userFind";
	}

	@RequestMapping("/userUpdateForm")
	public String userUpdate(String user_id, String user_email,
			Model model) {
		User user = userService.getUser(user_id);
		
		model.addAttribute("user", user);
		return "user/myPage/userUpdateForm";
	}
	
	@RequestMapping("updateProcess")
	public String userUpdate(User user, Address addr) {
		userService.userUpdate1(user);
		addrService.addrInsert(user.getUser_id(), addr);
		
		return "user/myPage/myBaeminForm";
	}

}
