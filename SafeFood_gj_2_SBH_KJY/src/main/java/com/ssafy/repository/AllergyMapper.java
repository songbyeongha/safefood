package com.ssafy.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
<<<<<<< HEAD
public interface AllergyMapper {
=======
public interface AllergyMapper {
>>>>>>> branch 'master' of https://lab.ssafy.com/wnsdud00700/safefood_gj_02_sbh_kjy.git
	public int insert(String id, String name);
	public int delete(String id, String name);
	public String select(String id, String name);
<<<<<<< HEAD
	public List<String> selectAll(String id);
=======
	public List<String> selectAll(String id);
>>>>>>> branch 'master' of https://lab.ssafy.com/wnsdud00700/safefood_gj_02_sbh_kjy.git
}
