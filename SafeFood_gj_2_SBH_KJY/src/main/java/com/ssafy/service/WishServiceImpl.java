package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.dto.Myintake;
import com.ssafy.dto.Wish;
import com.ssafy.repository.MyintakeMapper;
import com.ssafy.repository.WishMapper;

@Service
@Transactional
public class WishServiceImpl implements WishService{

	@Autowired
	WishMapper mapper;

	@Override
	public int insert(Wish wish) {
		// TODO Auto-generated method stub
		return mapper.insert(wish);
	}

	@Override
	public int delete(Wish wish) {
		// TODO Auto-generated method stub
		return mapper.delete(wish);
	}

	@Override
	public Wish select(Wish wish) {
		// TODO Auto-generated method stub
		return mapper.select(wish);
	}

	@Override
	public List<Wish> selectAll(String id) {
		// TODO Auto-generated method stub
		return mapper.selectAll(id);
	}



}
