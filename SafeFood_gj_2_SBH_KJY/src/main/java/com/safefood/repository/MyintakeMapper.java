package com.safefood.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.safefood.dto.Myintake;

@Mapper 
public interface MyintakeMapper {
	int insert(Myintake myintake);
	int delete(Myintake myintake);
	int deleteId(String id);
	public List<Myintake> total(String id, String startDate, String endDate);
	public Myintake select(Myintake myintake);
	public List<Myintake> selectAll(String id);
	public List<Myintake> selectPaging(String id, String startDate, String endDate, Integer page);
}
