package com.ssafy.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AllergyMapper {
<<<<<<< HEAD
	public int insert(String userinfoId, String name);
	public int delete(String userinfoId, String name);
	public String select(String userinfoId, String name);
	public List<String> selectAll(String userinfoId);
=======
	public int insert(String id, String name);
	public int delete(String id, String name);
	public String select(String id, String name);
	public List<String> selectAll(String id);
>>>>>>> branch 'master' of https://lab.ssafy.com/wnsdud00700/safefood_gj_02_sbh_kjy.git
}
