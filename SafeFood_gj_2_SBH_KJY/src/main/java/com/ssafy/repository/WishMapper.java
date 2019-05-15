package com.ssafy.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.dto.Wish;

@Mapper 
public interface WishMapper {
	int insert(Wish wish);
	int delete(Wish wish);
	public Wish select(Wish wish);
	public List<Wish> selectAll(String id);
	public List<Map<String, Object> > selectsum(String id);
}
