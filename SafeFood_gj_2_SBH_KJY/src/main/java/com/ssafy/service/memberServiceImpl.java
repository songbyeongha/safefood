package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dto.Member;
import com.ssafy.repository.memberMapper;

@Service
public class memberServiceImpl implements memberService {

	@Autowired
	memberMapper mapper;

	@Override
	public List<Member> selectAll() {
		return mapper.selectAll();
	}

	@Override
	public List<Member> selectByName(String name) {
		return mapper.selectByName(name);
	}

	@Override
	public List<Member> selectById(String id) {
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

	@Override
	public int deleteMember(String id) {
		return mapper.deleteMember(id);
	}
	
	
}
