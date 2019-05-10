package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dto.Allergy;
import com.ssafy.repository.AllergyMapper;

@Service
public class AllergyServiceImpl implements AllergyService{

	@Autowired
	AllergyMapper mapper;

	@Override
	public int insert(Allergy allergy) {
		return mapper.insert(allergy);
	}

	@Override
	public int delete(String userinfoId, String name) {
		return mapper.delete(userinfoId, name);
	}

	@Override
	public String select(String userinfoId, String name) {
		return mapper.select(userinfoId, name);
	}

	@Override
	public List<String> selectAll(String userinfoId) {
		return mapper.selectAll(userinfoId);
	}
	
	

}
