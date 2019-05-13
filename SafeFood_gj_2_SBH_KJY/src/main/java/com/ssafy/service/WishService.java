package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.Wish;

public interface WishService {
	int insert(Wish wish);
	int delete(Wish wish);
	public Wish select(Wish wish);
	public List<Wish> selectAll(String id);
}
