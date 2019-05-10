package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dto.Allergy;
import com.ssafy.repository.allergyMapper;

@Service
public class allergyServiceImpl implements allergyService {

	@Autowired
	allergyMapper mapper;

	@Override
	public List<Allergy> selectAll() {
		return mapper.selectAll();
	}

	@Override
	public List<Allergy> select(String id, String name) {
		return mapper.select(id, name);
	}

	@Override
	public int insert(Allergy allergy) {
		return mapper.insert(allergy);
	}

	@Override
	public int delete(String id) {
		return mapper.delete(id);
	}

	
	
}
