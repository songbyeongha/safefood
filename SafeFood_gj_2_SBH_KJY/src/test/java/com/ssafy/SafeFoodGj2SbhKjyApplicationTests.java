package com.ssafy;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.ssafy.service.WishService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SafeFoodGj2SbhKjyApplicationTests {

	@Autowired
	WishService service;
	
	@Test
	public void test() {
		System.err.println("!");
		List<Map<String, Object> > list = service.selectsum("ssafy1@naver.com");
		System.err.println("가져온 리스트: " + list);
		for(Map<String, Object> item : list) 
		{
			item.entrySet().forEach(entry -> System.out.println(entry.getKey()+":"+entry.getValue()));
		}
	}

}
