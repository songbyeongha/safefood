package com.ssafy.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.dto.Allergy;

@Mapper
public interface AllergyMapper {
	public int insert(Allergy allergy);
	public int delete(String userid, String name);
	public String select(String userid, String name);
	public List<String> selectAll(String userno);
}
