package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.Allergy;

public interface allergyService {
	public List<Allergy> selectAll();
	public List<Allergy> select(String id, String name);
	public int insert(Allergy allergy);
	public int delete(String id);
}
