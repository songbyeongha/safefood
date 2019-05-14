package com.ssafy.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AllergyMapper {
	public int insert(String id, String name);
	public int delete(String id);
	public String select(String id, String name);
	public List<String> selectId(String id);
}
