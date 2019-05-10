package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.Member;

public interface MemberService {
	public List<Member> selectAll();
	public Member selectByPhone(String phone);
	public Member selectById(String id);
	public int insertMember(Member member);
	public int updateMember(Member member);
	public int deleteMember(String id);
	public int joinDayTime(Member member);
	public Member login(String id, String password);
}


