package com.spring.baemin.dao;

import com.spring.baemin.domain.Address;

public interface AddrDao {
	public abstract void addrInsert(String user_id, Address addr);
}
