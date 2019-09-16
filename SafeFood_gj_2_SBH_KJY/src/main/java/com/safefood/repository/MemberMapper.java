package com.safefood.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.safefood.dto.Member;

@Mapper 
public interface MemberMapper {
	public List<Member> selectAll();
	public Member selectByPhone(String phone);
	public Member selectById(String id);
	public int insertMember(Member member);
	public int updateMember(Member member);
	public int deleteMember(String id);
}
