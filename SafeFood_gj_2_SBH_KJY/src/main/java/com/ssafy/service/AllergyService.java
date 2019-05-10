package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.Allergy;

public interface AllergyService {
	public String select(Allergy allergy);
	public List<String> selectAll(Integer userno);
	public int insert(Allergy allergy);
	public int delete(Allergy allergy);
}
