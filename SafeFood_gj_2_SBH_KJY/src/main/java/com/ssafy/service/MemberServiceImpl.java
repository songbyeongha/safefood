package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dto.Member;
import com.ssafy.repository.MemberMapper;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper mapper;

	@Override
	public List<Member> selectAll() {
		return mapper.selectAll();
	}


	public int deleteMember(String id) {
		return mapper.deleteMember(id);
	}
	

	@Override
	public int joinDayTime(Member member) {
		int result = mapper.insertMember(member);
		Member selected = mapper.selectById(member.getId());
		return result;
	}

	@Override
	public Member login(String id, String password) {
		Member member = mapper.selectById(id);
		if (member != null && member.getPassword().equals(password)) {
			return member;
		} else {
			return null;
		}
	}


	@Override
	public Member selectByPhone(String phone) {
		return mapper.selectByPhone(phone);
	}


	@Override
	public Member selectById(String id) {
		return mapper.selectById(id);
	}


	@Override
	public int insertMember(Member member) {
		return mapper.insertMember(member);
	}


	@Override
	public int updateMember(Member member) {
		return mapper.updateMember(member);
	}


	
}
