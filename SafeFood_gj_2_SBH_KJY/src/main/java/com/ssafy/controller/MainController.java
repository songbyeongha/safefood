package com.ssafy.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.ssafy.dto.Food;
import com.ssafy.dto.Myintake;
import com.ssafy.service.MyintakeService;
import com.ssafy.service.FoodService;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	FoodService foodService;
	@Autowired
	MyintakeService myintakeService;

	Gson gson = new Gson();
	
	@GetMapping("/searchAll")
	public String searchAll(Model model) {
		String str = gson.toJson(foodService.selectAll());
		model.addAttribute("data", str);
		return "msg";
	}

	@GetMapping("/search")
	public String foodSearch(Model model, String select, String input) {
		List<Food> list = null;
		switch(select) {
		case "name":
			list = foodService.selectByName(input);
			break;
		case "maker":
			list = foodService.selectByMaker(input);
			break;
		case "material":
			list = foodService.selectByMaterial(input);
			break;
		}
		String str = gson.toJson(list);
		model.addAttribute("data", str);
		return "msg";
	}

	@GetMapping("/foodList")
	public String foodList(Model model) {
		return "food/food_list";
	}

	@GetMapping("/detail")
	public String detail(Model model, String code) {
		String str = gson.toJson(foodService.select(Integer.parseInt(code)));
		model.addAttribute("data", str);
		return "msg";
	}


	@GetMapping("/intake")
	public String intake(Model model, String userno) {
		List<Integer> list = myintakeService.selectAll(Integer.parseInt(userno));
		List<Food> food = new ArrayList<>();
		for (Integer i : list) {
			food.add(foodService.select(i));
		}
		model.addAttribute("data", gson.toJson(food));
		return "msg";
	}

	@PostMapping("/intakeInsert")
	public String intakeInsert(Model model, String userno, String code) {
		int result = myintakeService.insert(new Myintake(userno, Integer.parseInt(code)));
		if (result == -1) {
			model.addAttribute("data", "이미 추가 되었습니다.");
		} else {
			model.addAttribute("data", "추가 되었습니다.");
		}
		return "msg";
	}

	@PostMapping("/intakeDel")
	public String intakeDelete(Model model, String userno, String code) {
		int result = myintakeService.delete(new Myintake(userno, Integer.parseInt(code)));
		if (result == 0) {
			model.addAttribute("data", "삭제되지 않았습니다.");
		} else {
			model.addAttribute("data", "삭제 되었습니다.");
		}
		return "msg";
	}

	@GetMapping("/foodDetail")
	public String foodDetail(Model model) {
		return "food/food_detail";
	}

	@GetMapping("/foodIntake")
	public String foodIntake(Model model) {
		return "food/intake_list";
	}
	
	// 에러 페이지 연결
	@RequestMapping("/myerror")
	public String errorHandling(Model model) {
		return "Error";
	}

}
