package com.spring.baemin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.baemin.dao.AddrDao;
import com.spring.baemin.domain.Address;

@Service
public class AddrServiceImpl implements AddrService {
	
	@Autowired
	private AddrDao addrDao;
	
	
	@Override
	public void addrInsert(String user_id, Address addr) {
		addrDao.addrInsert(user_id, addr);
	}

}
