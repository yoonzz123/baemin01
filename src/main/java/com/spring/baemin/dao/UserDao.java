package com.spring.baemin.dao;

import java.util.HashMap;
import java.util.Map;

import com.spring.baemin.domain.User;

public interface UserDao {

	void userJoinProcess(User user);

	String userLoginProcess(String user_id);
	
	public abstract int userEmailCheck(String user_email);
	public abstract int userNameCheck(String user_email, String user_name);
	public abstract int userIdCheck(String user_email, String user_name, String user_id);
	public abstract String getUserId(String user_email);
	
	// ########### odrService - getUser() ##########
	public abstract User getUser(String user_id);

	String getUserPass(String user_email, String user_name, String user_id);
	
	int idCheck(String user_id);
	
	String userUpdate(String user_id, String user_email);
	
	User userLoginCheck(String user_id, String user_pass);
	
	public abstract void userUpdate1(User user);
	
}
