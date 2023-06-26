package com.caduk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/home")
	public String goHome() {
		return "home";
	}
	
	@GetMapping("/signUp")
	public String goSignUp() {
		return "signUp";
	}
	@GetMapping("/signIn")
	public String goSignIn() {
		return "signIn";
	}
	@GetMapping("/eval")
	public String goEval() {
		return "evaluation";
	}
	@GetMapping("/viewCafe")
	public String goViewCafe() {
		return "viewCafe";
	}
	@GetMapping("/newCafe")
	public String goNewCafe() {
		return "newCafe";
	}

}
