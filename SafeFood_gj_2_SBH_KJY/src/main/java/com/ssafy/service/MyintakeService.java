package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.Myintake;

public interface MyintakeService {
	int insert(Myintake myintake);
	int delete(Myintake myintake);
	public Myintake select(Myintake myintake);
	public List<Integer> selectAll(Integer id);
}
