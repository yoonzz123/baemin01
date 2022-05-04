package com.spring.baemin.service;

import java.util.Map;

import com.spring.baemin.domain.User;

public interface UserService {

	void userJoinProcess(User user);

	public abstract Map<String, Object> userLoginProcess(String user_pass, String user_id);
	
	public abstract Map<String, Object> userFindId(String user_email, String user_name);

	Map<String, Object> userFindPass(String user_email, String user_name, String user_id);
	
	int idCheck(String user_id);
	
	Map<String, Object> userUpdate(String user_id, String user_email);
	
	User userLoginCheck(String user_id, String user_pass);
	public abstract User getUser(String user_id);
	public abstract void userUpdate1(User user);
}
