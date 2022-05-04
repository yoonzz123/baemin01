package com.spring.baemin.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.baemin.domain.User;

@Repository
public class UserDaoImpl implements UserDao {

	private final String NAME_SPACE = "com.spring.baemin.mapper.UserMapper";

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void userJoinProcess(User user) {
		sqlSession.insert(NAME_SPACE + ".userJoinProcess", user);
	}

	@Override
	public String userLoginProcess(String user_id) {

		return sqlSession.selectOne(NAME_SPACE + ".userLoginProcess", user_id);

	}
	
	
	// ########### odrService - getUser() #########
	@Override
	public User getUser(String user_id) {
		return sqlSession.selectOne(NAME_SPACE + ".getUser", user_id);
	}

	
	
	@Override
	public int userEmailCheck(String user_email) {
		return sqlSession.selectOne(NAME_SPACE + ".userEmailCheck", user_email);
	}

	@Override
	public int userNameCheck(String user_email, String user_name) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_email", user_email);
		map.put("user_name", user_name);
		return sqlSession.selectOne(NAME_SPACE + ".userNameCheck", map);
	}

	@Override
	public String getUserId(String user_email) {
		System.out.println("@Repository1");
		return sqlSession.selectOne(NAME_SPACE + ".userFindId", user_email);
	}

	@Override
	public int userIdCheck(String user_email, String user_name, String user_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_email", user_email);
		map.put("user_name", user_name);
		map.put("user_id", user_id);
		
		return sqlSession.selectOne(NAME_SPACE + ".userIdCheck", map);
	}

	@Override 
	public String getUserPass(String user_email,String user_name, String user_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("user_email", user_email);
		map.put("user_name", user_name);
		map.put("user_id", user_id);
		return sqlSession.selectOne(NAME_SPACE + ".userFindPass", map); 
	}
	
	public int userPassCheck(String user_email, String user_name, String user_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("user_email", user_email);
		map.put("user_name", user_name);
		map.put("user_id", user_email);
		return sqlSession.selectOne(NAME_SPACE + ".userPassCheck" , map);
	}
	
	public int idCheck(String user_id) {
		
		int userId = sqlSession.selectOne(NAME_SPACE + ".idCheck", user_id);
		
		return userId;
	}
	
	public String userUpdate(String user_id, String user_email){
		
		
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("user_email", user_email);
		
		return sqlSession.selectOne(NAME_SPACE + ".userUpdate", map);
	}
	
	public User userLoginCheck(String user_id, String user_pass){
	
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("user_pass", user_pass);
		
		
		return sqlSession.selectOne(NAME_SPACE + ".userLoginCheck",map);
	}

	@Override
	public void userUpdate1(User user) {
		sqlSession.update(NAME_SPACE + ".update1", user);
	}

}
