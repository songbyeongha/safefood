package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.Allergy;

public interface AllergyService {
	public int insert(Allergy allergy);
	public int delete(String userinfoId, String name);
	public String select(String userinfoId, String name);
	public List<String> selectAll(String userinfoId);
}

