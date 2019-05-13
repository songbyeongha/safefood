package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.repository.AllergyMapper;

@Service
public class AllergyServiceImpl implements AllergyService{

	@Autowired
	AllergyMapper mapper;

	@Override
	public int insert(String id, String name) {
		return mapper.insert(id, name);
	}

	@Override
	public int delete(String id, String name) {
		return mapper.delete(id, name);
	}

	@Override
	public String select(String id, String name) {
		return mapper.select(id, name);
	}

	@Override
	public List<String> selectId(String id) {
		return mapper.selectId(id);
	}
	
	

}
