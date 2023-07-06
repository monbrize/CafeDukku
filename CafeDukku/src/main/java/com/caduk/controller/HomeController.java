package com.caduk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.caduk.domain.CafeVO;
import com.caduk.service.CafeService;

@Controller
public class HomeController {

	@Autowired
	private CafeService cService;
	
	@GetMapping("/home")
	@ResponseBody
	public ModelAndView goHome() {
		ModelAndView mv = new ModelAndView();
		List<CafeVO> newCafe = this.cService.getOpenCafe();
		mv.addObject("newCafe", newCafe);
		
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

	@GetMapping("/newCafe")
	public String goNewCafe() {
		return "newCafe";
	}


}
