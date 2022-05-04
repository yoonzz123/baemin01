package com.spring.baemin.ajax;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.baemin.domain.User;
import com.spring.baemin.service.UserService;

@Controller
public class UserAjaxProcessController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/userFindProcess.ajax")
	@ResponseBody
	public Map<String, Object> userFindId(String user_email, String user_name){
		System.out.println("@Controller1");
		return userService.userFindId(user_email, user_name);
	}
	
	
	@RequestMapping("/userFind.ajax")
	@ResponseBody
	public Map<String, Object> userFindPass(String user_email, String user_name, String user_id){
		
		return userService.userFindPass(user_email, user_name, user_id);
	}
	
	@RequestMapping("/idCheck.ajax")
	@ResponseBody
	public int idCheck(String user_id) {
		System.out.println(user_id);
		int result = userService.idCheck(user_id);
		
		return result;
	}
	
	@RequestMapping("/userLoginCheck")
	@ResponseBody
	public User userLoginCheck(String user_id, String user_pass){
		
		return userService.userLoginCheck(user_id, user_pass);
	}
	
}
