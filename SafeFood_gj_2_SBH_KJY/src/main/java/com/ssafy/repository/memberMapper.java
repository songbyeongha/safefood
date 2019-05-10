package com.ssafy.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.dto.Member;


@Mapper 
public interface memberMapper {
	public List<Member> selectAll();
	public List<Member> selectByName(String name);
	public List<Member> selectById(String id);
	public int insertMember(Member member);
	public int updateMember(Member member);
	public int deleteMember(String id);
}