package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.dto.Food;
import com.ssafy.repository.FoodMapper;

@Service
@Transactional
public class FoodServiceImpl implements FoodService{

	@Autowired
	FoodMapper mapper;

	@Override
	public List<Food> selectAll() {
		// TODO Auto-generated method stub
		return mapper.selectAll();
	}

	@Override
	public Food select(int code) {
		// TODO Auto-generated method stub
		return mapper.select(code);
	}

	@Override
	public List<Food> selectByName(String name) {
		// TODO Auto-generated method stub
		return mapper.selectByName(name);
	}

	@Override
	public List<Food> selectByMaker(String maker) {
		// TODO Auto-generated method stub
		return mapper.selectByMaker(maker);
	}

	@Override
	public List<Food> selectByMaterial(String material) {
		// TODO Auto-generated method stub
		return mapper.selectByMaterial(material);
	}

	@Override
	public int insertFood(Food food) {
		// TODO Auto-generated method stub
		return mapper.insertFood(food);
	}

	@Override
	public int updateFood(Food food) {
		// TODO Auto-generated method stub
		return mapper.updateFood(food);
	}

	@Override
	public int deleteFood(int code) {
		// TODO Auto-generated method stub
		return mapper.deleteFood(code);
	}


}
