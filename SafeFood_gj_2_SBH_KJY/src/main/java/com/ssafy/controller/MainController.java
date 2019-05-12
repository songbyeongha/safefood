package com.ssafy.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.ssafy.dto.Food;
import com.ssafy.dto.Member;
import com.ssafy.dto.Myintake;
import com.ssafy.service.AllergyService;
import com.ssafy.service.FoodService;
import com.ssafy.service.MemberService;
import com.ssafy.service.MyintakeService;

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
		switch (select) {
		case "name":
			list = foodService.selectByName("%"+input+"%");
			break;
		case "maker":
			list = foodService.selectByMaker("%"+input+"%");
			break;
		case "material":
			list = foodService.selectByMaterial("%"+input+"%");
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
	public String intake(Model model, String id) {
		List<Myintake> list = myintakeService.selectAll(id);
		List<Food> food = new ArrayList<>();
		logger.trace("list : "+ list);
		for (Myintake i : list) {
			Food tempFood = foodService.select(i.getCode());
			tempFood.setIntakeDate(i.getIntakeDate());
			food.add(tempFood);
			
		}
		model.addAttribute("data", gson.toJson(food));
		return "msg";
	}

	@PostMapping("/intakeInsert")
	public String intakeInsert(Model model, String id, String code) {
		logger.trace("asdfasdf : "+id+", code : "+ code);
		int result = myintakeService.insert(new Myintake(id, Integer.parseInt(code)));
		if (result == -1) {
			model.addAttribute("data", "이미 추가 되었습니다.");
		} else {
			model.addAttribute("data", "추가 되었습니다.");
		}
		return "msg";
	}

	@PostMapping("/intakeDel")
	public String intakeDelete(Model model, String id, String code, Date intakeDate) {
		int result = myintakeService.delete(new Myintake(id,intakeDate, Integer.parseInt(code)));
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
<<<<<<< HEAD

	///////////////////////// 준영쓰 ///////////////////////////////////

=======
	@RequestMapping("/")
	public String index(Model model) {
		return "redirect:/index.jsp";
	}
	
	
	/////////////////////////  준영쓰        ///////////////////////////////////
	
>>>>>>> branch 'master' of https://lab.ssafy.com/wnsdud00700/safefood_gj_02_sbh_kjy.git
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
			session.setAttribute("userInfo", result);
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
		
		return path;
	}

	@GetMapping("/findid")
	public String findidForm(Model model) {
		return "/log/findid";
	}

	@PostMapping("/findid")
	public String findid(Model model,String name,String phone) {
		String id = "";
		System.out.println("id : " +  " " + id);
		if(phone.equals(memberService.selectByPhone(phone))){
			id = memberService.selectByPhone(phone).getId();
		}
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
	public String findpass(Model model, String name, String phone) {
		return "/log/findpassword";
	}

	@GetMapping("/knowpass")
	public String knowpassForm(Model model, String name) {
		Member member = memberService.selectById(name);
		model.addAttribute("name", name);
		return "/log/knowpass";
	}

	@PostMapping("/knowpass")
	public String findpass(Model model, String name) {

		return "/log/knowid";
	}

	@GetMapping("/userInfo")
	public String userInfo(Model model) {
		return "/log/userInfo";
	}

//		// 유저정보기
//		@PostMapping("/userInfo")
//		public String modify(Model model, Member member, HttpSession session, RedirectAttributes redir) {
//			return "/log/userInfo";
//		}

	@GetMapping("/usermodify")
	public String modifyForm(Model model) {
		return "/log/usermodify";
	}

	// TODO: 20 회원 정보 수정 처리
	@PostMapping("/usermodify")
	public String modify(Model model, Member member, HttpSession session) {
		memberService.updateMember(member);
		session.setAttribute("userInfo", member);
		return "redirect:/log/userInfo";
	}

	@GetMapping("/userremove")
	public String removeForm(Model model) {
		return "/log/userremove";
	}

	// TODO: 20 회원 정보 수정 처리
	@PostMapping("/userremove")
	public String remove(Model model, String user_id, HttpSession session) {
		memberService.deleteMember(user_id);
		return "redirect:/index.jsp";
	}

}
