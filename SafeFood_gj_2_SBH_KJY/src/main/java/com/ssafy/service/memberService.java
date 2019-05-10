package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.Member;

public interface memberService {
	public List<Member> selectAll();
	public List<Member> selectByName(String name);
	public List<Member> selectById(String id);
	public int insertMember(Member member);
	public int updateMember(Member member);
	public int deleteMember(String id);
}
