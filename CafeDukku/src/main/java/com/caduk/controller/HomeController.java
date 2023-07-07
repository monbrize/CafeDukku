package com.caduk.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.caduk.domain.ListVO;
import com.caduk.service.CafeService;

@Controller
public class HomeController {

	@Autowired
	private CafeService cService;
	
	@GetMapping("/")
	@ResponseBody
	public ModelAndView goHome() {
		ModelAndView mv = new ModelAndView();
		List<ListVO> newCafe = this.cService.getOpenCafe();
		List<ListVO> topRank=this.cService.getTopEval();
		
		mv.addObject("newCafe", newCafe);
		mv.addObject("topRank", topRank);
		
		mv.setViewName("home");
		return mv;
	}
	
	@GetMapping("/signUp")
	public String goSignUp() {
		return "signUp";
	}
	@GetMapping("/signIn")
	public String goSignIn() {
		return "signIn";
	}
	
	@GetMapping("/signOutIn")
	public String gotoSignIn(HttpSession session) {
		session.invalidate();
		return "signIn";
	}

	@GetMapping("/newCafe")
	public String goNewCafe() {
		return "newCafe";
	}


}
