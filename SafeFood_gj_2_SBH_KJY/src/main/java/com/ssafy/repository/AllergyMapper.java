package com.ssafy.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.dto.Allergy;

@Mapper
public interface AllergyMapper {
	public int insert(Allergy allergy);
	public int delete(Allergy allergy);
	public String select(Allergy allergy);
	public List<String> selectAll(Integer userno);
}
