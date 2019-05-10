package com.ssafy.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AllergyMapper {
	public int insert(String userid, String name);
	public int delete(String userid, String name);
	public String select(String userid, String name);
	public List<String> selectAll(String userno);
}
