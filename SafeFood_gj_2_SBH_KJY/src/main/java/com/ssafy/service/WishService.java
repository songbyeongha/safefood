package com.ssafy.service;

import java.util.List;
import java.util.Map;

import com.ssafy.dto.Wish;

public interface WishService {
	int insert(Wish wish);
	int delete(Wish wish);
	int deleteId(String id);
	public Wish select(Wish wish);
	public List<Wish> selectAll(String id);
	public List<Map<String, Object> > selectsum(String id);
}
