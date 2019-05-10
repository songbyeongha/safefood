package com.ssafy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class NormalController {
	
	@GetMapping("/hello")
	@ResponseBody
	public String sayHello() {
		return "Hello 안녕";
	}
	
	@GetMapping("/map")
	@ResponseBody
	public Map<String, Object> sayMap(){
		Map<String, Object> map = new HashMap<>();
		map.put("name", "andy");
		map.put("age", 10);
		return map;
	}
	
	@GetMapping("/list")
	@ResponseBody
	public List<Object> sayList(){
		List<Object> list = new ArrayList<>();
		list.add("hello");
		list.add(10);
		return list;
	}
}
