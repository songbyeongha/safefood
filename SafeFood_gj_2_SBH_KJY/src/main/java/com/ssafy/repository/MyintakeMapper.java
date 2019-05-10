package com.ssafy.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.dto.Myintake;

@Mapper 
public interface MyintakeMapper {
	int insert(Myintake myintake);
	int delete(Myintake myintake);
	public Myintake select(Myintake myintake);
	public List<Integer> selectAll(Integer id);
}
