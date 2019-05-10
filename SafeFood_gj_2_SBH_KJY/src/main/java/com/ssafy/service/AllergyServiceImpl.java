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
	public String select(Allergy allergy) {
		return mapper.select(allergy);
	}

	@Override
	public List<String> selectAll(Integer userno) {
		return mapper.selectAll(userno);
	}

	@Override
	public int insert(Allergy allergy) {
		return mapper.insert(allergy);
	}

	@Override
	public int delete(Allergy allergy) {
		return mapper.delete(allergy);
	}

}
