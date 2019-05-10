package com.ssafy.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.dto.Allergy;

@Mapper
public interface allergyMapper {
	public List<Allergy> selectAll();
	public List<Allergy> select(String id, String name);
	public int insert(Allergy allergy);
	public int delete(String id);
}
