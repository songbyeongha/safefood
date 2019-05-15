package com.ssafy.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.ssafy.dto.Food;
import com.ssafy.dto.Member;
import com.ssafy.dto.Myintake;
import com.ssafy.dto.Wish;
import com.ssafy.service.AllergyService;
import com.ssafy.service.FoodService;
import com.ssafy.service.MemberService;
import com.ssafy.service.MyintakeService;
import com.ssafy.service.WishService;

@Controller
public class MainController {

	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	MemberService memberService;
	@Autowired
	AllergyService allergyService;
	@Autowired
	FoodService foodService;
	@Autowired
	MyintakeService myintakeService;
	@Autowired
	WishService wishService;

	Gson gson = new Gson();

	@GetMapping("/searchAll")
	public String searchAll(Model model) {
		String str = gson.toJson(foodService.selectAll());
		model.addAttribute("data", str);
		return "msg";
	}
	
	@GetMapping("/bestSearch")
	public String bestSearch(Model model) {
		String str = gson.toJson(foodService.bestSelect());
		model.addAttribute("data", str);
		return "msg";
	}
	
	@PostMapping("/bestUp")
	public String bestUp(Model model, Food food) {
		food.setBestCount(food.getBestCount()+1);
		String str = gson.toJson(foodService.updateFood(food));
		model.addAttribute("data", str);
		return "msg";
	}

	@GetMapping("/search")
	public String foodSearch(Model model, String select, String input) {
		List<Food> list = null;
		switch (select) {
		case "name":
			list = foodService.selectByName("%" + input + "%");
			break;
		case "maker":
			list = foodService.selectByMaker("%" + input + "%");
			break;
		case "material":
			list = foodService.selectByMaterial("%" + input + "%");
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

	@PostMapping("/intakeInsert")
	public String intakeInsert(Model model, String id, String code) {
		logger.trace("asdfasdf : " + id + ", code : " + code);
		Food food = foodService.select(Integer.parseInt(code));
		
		int result = myintakeService.insert(new Myintake(id, Integer.parseInt(code)));
		if (result == -1) {
			model.addAttribute("data", "식품이 섭취되지 않았습니다.");
		} else {
			food.setBestCount(food.getBestCount()+1);
			foodService.updateFood(food);
			model.addAttribute("data", "섭취 성공");
		}
		return "msg";
	}

	@PostMapping("/intakeDel")
	public String intakeDelete(Model model, String id, String code, Date intakeDate) {
		int result = myintakeService.delete(new Myintake(id, intakeDate, Integer.parseInt(code)));
		if (result == 0) {
			model.addAttribute("data", "삭제되지 않았습니다.");
		} else {
			model.addAttribute("data", "삭제 되었습니다.");
		}
		return "msg";
	}
	
	@GetMapping("/wish")
	public String wish(Model model, String id) {
		List<Wish> list = wishService.selectAll(id);
		List<Food> food = new ArrayList<>();
		logger.trace("list : " + list);
		for (Wish i : list) {
			Food tempFood = foodService.select(i.getCode());
			food.add(tempFood);

		}
		model.addAttribute("data", gson.toJson(food));
		return "msg";
	}

	@PostMapping("/wishInsert")
	public String wishInsert(Model model, String id, String code) {
		Wish item = wishService.select(new Wish(id, Integer.parseInt(code)));
		int result = -1;
		if(item==null)
			result = wishService.insert(new Wish(id, Integer.parseInt(code)));
		if (result == -1) {
			model.addAttribute("data", "이미 추가 되었습니다.");
		} else {
			model.addAttribute("data", "추가 되었습니다.");
		}
		return "msg";
	}

	@PostMapping("/wishDel")
	public String wishDelete(Model model, String id, String code) {
		int result = wishService.delete(new Wish(id, Integer.parseInt(code)));
		if (result == 0) {
			model.addAttribute("data", "삭제되지 않았습니다.");
		} else {
			model.addAttribute("data", "삭제 되었습니다.");
		}
		return "msg";
	}
	
	@GetMapping("/allergy")
	public String allergy(Model model, String id, String text) {
		logger.trace("text : {}", text);
		
		List<String> list = allergyService.selectid(id);
		logger.trace("list : {}", list);
		List<String> find = new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			logger.trace("list.get : {}. {}",i, list.get(i));
			if (text.contains(list.get(i))) {
				find.add(list.get(i));
			}
		}
		model.addAttribute("data", gson.toJson(find));
		return "/msg";
	}
	
	@GetMapping("/foodWish")
	public String foodWish(Model model) {
		return "food/wish_list";
	}

	@GetMapping("/foodDetail")
	public String foodDetail(Model model) {
		return "food/food_detail";
	}

	@GetMapping("/intake")
	public ResponseEntity<Map<String, Object>> intakeList(Model model,String id, String startDate, String endDate, Integer page){

		List<Myintake> list = myintakeService.selectPaging(id, startDate.trim()+" 00:00:00", endDate.trim()+" 23:59:59", (page-1)*10);
		List<Food> food = new ArrayList<>();
		for (Myintake i : list) { 
			Food tempFood = foodService.select(i.getCode());
			tempFood.setIntakeDate(i.getIntakeDate());
			food.add(tempFood);
		} 
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("data", food);
		resultMap.put("maxpage", (myintakeService.total(id, startDate.trim()+" 00:00:00", endDate.trim()+" 23:59:59")-1)/10+1);
		
		ResponseEntity<Map<String, Object>> ent = null;
		if(list.size()>0) {
			ent = new ResponseEntity<Map<String, Object>>(resultMap,HttpStatus.OK);			//200
		}else {
			ent = new ResponseEntity<Map<String, Object>>(resultMap,HttpStatus.NO_CONTENT);	//204
		}
		return ent;
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
	
	@GetMapping("/notice")
	public String notice(Model model) {
		return "notice/notice";
	}
	
	//모범 음식점 연결
	@GetMapping("/foodmap")
	public String foodmapForm(Model model) {
		return "map/restaurant";
	}
	
	@RequestMapping("/")
	public String index(Model model) {
		return "redirect:/index.jsp";
	}

	///////////////////////// 준영쓰 ///////////////////////////////////

	// 로그인 폼 제공
	@GetMapping("/login")
	public String loginForm(Model model, @CookieValue(required = false) String loginUser, HttpSession session) {
		logger.trace("login cookie: {}", loginUser);
		// 쿠키가 있다? --> 로그인 경험 있다. --> 세션 등록 후 main으로

		if (loginUser != null) {
			Member member = memberService.selectById(loginUser);
			session.setAttribute("userInfo", member);
		
			logger.trace("김준영 1 {}", loginUser);
			return "index";
		} else {
			// 쿠키가 없다? --> 로그인 필요. --> 폼 제공 --> TODO 15
			logger.trace("김준영 2 {}", loginUser);
			return "log/login";
		}
	}

	// TODO 16
	@PostMapping("/login")
	public String login(Model model, String user_id, String password, HttpServletResponse res, HttpSession session) {

		Member result = memberService.login(user_id, password);
		
		if (result != null) {
			logger.trace("authority : {}", result.getAuthority());
			if(result.getAuthority() == 1) {
				session.setAttribute("admininfo", result);
				logger.trace("result : {}", result);
			}
			else if(result.getAuthority() == 2){
				session.setAttribute("userInfo", result);
				List<String> allergy = allergyService.selectId(result.getId());
				logger.trace("result : {}", result);
				logger.trace("allergy : {}", allergy);
				session.setAttribute("allergy", allergy);
			}
			
		} else {
			return "redirect:loginfail";
		}
		return "redirect:/index.jsp";
	}

	@GetMapping("/loginfail")
	public String loginFail(Model model) {
		return "/log/loginfail";
	}

	@RequestMapping("/logout")
	public String doLogout(Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("userInfo");
		logger.trace("logout: {}", member.getId());
		session.invalidate();
		return "/log/logout";
	}

	@GetMapping("/joinus")
	public String joinusForm(Model model) {
		return "/log/joinus";
	}

	// 회원가입 처리
	@PostMapping("/joinus")
	public String joinus(Model model, RedirectAttributes redir, Member member, String[] allergy) {
		int result = memberService.joinDayTime(member);
		logger.trace("allergy {}", allergy);
		String path = "/log/joinus.jsp";
		if (result == 1) {
			for (String data : allergy) {
				allergyService.insert(member.getId(), data);
			}
			logger.trace("result {}", result);

			path = "redirect:/index.jsp";
			return path;
		}
		redir.addAttribute("alarm", "회원가입되었습니다. 로그인해주세요.");
		return path;
	}

	@GetMapping("/findid")
	public String findidForm(Model model) {
		return "/log/findid";
	}

	@PostMapping("/findid")
	public String findid(Model model, String phone) {
		String id = memberService.selectByPhone(phone).getId();
		model.addAttribute("id", id);
		return "/log/knowid";
	}

	@GetMapping("/knowid")
	public String knowidForm(Model model) {
		return "/log/knowid";
	}

	/*
	 * @PostMapping("/knowid") public String findid(Model model, String name) {
	 * 
	 * return "/log/knowid"; }
	 */

	@GetMapping("/findpassword")
	public String findpassForm(Model model) {
		return "/log/findpassword";
	}

	@PostMapping("/findpassword")
	public String findpass(Model model, String id, String name) {
		String password = memberService.selectById(id).getPassword();
		model.addAttribute("password", password);
		return "/log/knowpass";
	}

	@GetMapping("/knowpass")
	public String knowpassForm(Model model, String id) {

		return "/log/knowpass";
	}


	// 유저정보기
	@GetMapping("/userInfo")
	public String modify(Model model) {
		return "/log/userInfo";
	}
	
//	// 유저정보기
//	@PostMapping("/userInfo")
//	public String modify(Model model, Member member, HttpSession session, RedirectAttributes redir) {
//		
//		return "/log/userInfo";
//		
//	}

	@GetMapping("/usermodify")
	public String usermodifyForm(Model model) {
		return "/log/usermodify";
	}
	
	@PostMapping("/usermodify")
	public String usermodify(Model model, HttpSession session, Member member, String[] allergy) {
		int result = memberService.updateMember(member);
		session.setAttribute("userInfo", member);
		logger.trace("user : {}", member);
		String path =  "/log/userInfo";
		allergyService.delete(member.getId());
		if(result == 1) {
			for (String data : allergy) {
				allergyService.insert(member.getId(), data);
			}
		}
		List<String> allergy1 = allergyService.selectId(member.getId());
		session.setAttribute("allergy", allergy1);
		return path;

	}

	@GetMapping("/userremove")
	public String removeForm(Model model) {
		return "/log/userremove";
	}

	// TODO: 20 회원 정보 수정 처리
	@PostMapping("/userremove")
	public String remove(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		memberService.deleteMember(id);
		allergyService.delete(id);
		
		return "redirect:/index.jsp";
	}

	@RequestMapping(value="/log/login")
	public ModelAndView needLogin() throws Exception {
		ModelAndView mav = new ModelAndView("/log/login");
		mav.addObject("msg", "로그인 후 이용해 주세요.");
		
		return mav;
	}
	
	/////////////////////////////// 관리자
	
	@GetMapping("/adminlog")
	public String adminlogForm(Model model, @CookieValue(required = false) String loginUser, HttpSession session) {
		logger.trace("login cookie: {}", loginUser);

		if (loginUser != null) {
			Member member = memberService.selectById(loginUser);
			session.setAttribute("userInfo", member);
		
			logger.trace("김준영 1 {}", loginUser);
			return "/admin/adminpage";
		} else {
			// 쿠키가 없다? --> 로그인 필요. --> 폼 제공 --> TODO 15
			logger.trace("김준영 2 {}", loginUser);
			return "/admin/adminlog";
		}
	}

	@PostMapping("/adminlog")
	public String adminlog(Model model, String user_id, String password, HttpServletResponse res, HttpSession session) {

		Member result = memberService.login(user_id, password);
		if (result != null) {
			session.setAttribute("adminInfo", result);
			logger.trace("result : {}", result);
		} else {
			return "redirect:loginfail";
		}
		return "redirect:/adminpage";
	}

	@GetMapping("/adminpage")
	public String adminpageForm(Model model) {
		return "/admin/adminpage";
	}
	
	@GetMapping("/foodwishget")
	@ResponseBody
	public List<Map<String, Object> > wish_form(Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("userInfo");
		List<Map<String, Object>> wish = wishService.selectsum(member.getId());
		return wish;
	}
}