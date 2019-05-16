package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.Myintake;

public interface MyintakeService {
	int insert(Myintake myintake);
	int delete(Myintake myintake);
	int deleteId(String id);
	public List<Myintake> total(String id, String startDate, String endDate);
	public Myintake select(Myintake myintake);
	public List<Myintake> selectAll(String id);
	public List<Myintake> selectPaging(String id, String startDate, String endDate, Integer page);
}
