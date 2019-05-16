package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.dto.Myintake;
import com.ssafy.repository.MyintakeMapper;

@Service
@Transactional
public class MyintakeServiceImpl implements MyintakeService{

	@Autowired
	MyintakeMapper mapper;

	@Override
	public int insert(Myintake myintake) {
		// TODO Auto-generated method stub
		return mapper.insert(myintake);
	}

	@Override
	public int delete(Myintake myintake) {
		// TODO Auto-generated method stub
		return mapper.delete(myintake);
	}

	@Override
	public Myintake select(Myintake myintake) {
		// TODO Auto-generated method stub
		return mapper.select(myintake);
	}

	@Override
	public List<Myintake> selectAll(String id) {
		// TODO Auto-generated method stub
		return mapper.selectAll(id);
	}

	@Override
	public List<Myintake> selectPaging(String id, String startDate, String endDate, Integer page) {
		// TODO Auto-generated method stub
		return mapper.selectPaging(id, startDate, endDate, page);
	}

	@Override
	public List<Myintake> total(String id, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return mapper.total(id,startDate,endDate);
	}

	@Override
	public int deleteId(String id) {
		return mapper.deleteId(id);
	}


}
