package com.ssafy.service;

import java.util.List;

public interface AllergyService {
	public int insert(String id, String name);
	public int delete(String id, String name);
	public String select(String id, String name);
	public List<String> selectId(String id);
}

