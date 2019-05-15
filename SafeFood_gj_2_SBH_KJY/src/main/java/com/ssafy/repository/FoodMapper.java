package com.ssafy.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.dto.Food;

@Mapper 
public interface FoodMapper {
	public List<Food> selectAll();
	public List<Food> bestSelect();
	public Food select(int code);
	public List<Food> selectByName(String name);
	public List<Food> selectByMaker(String maker);
	public List<Food> selectByMaterial(String material);
	public int insertFood(Food food);
	public int updateFood(Food food);
	public int deleteFood(int code);
}
