package com.ssafy.service;

import java.util.List;

public interface AllergyService {
	public int insert(String id, String name);
	public int delete(String id);
	public String select(String id, String name);
	public List<String> selectId(String id);
	public List<String> selectid(String id);
}

