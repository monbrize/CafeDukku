package com.caduk.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.caduk.domain.MemberVO;
import com.caduk.service.MemberServiceImpl;

@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl memberService;
	
	
	@PostMapping("/join")
	public String newMember(Model m, @ModelAttribute MemberVO vo) {
		
		int n=this.memberService.newMember(vo);
		String str=(n>0)?"회원가입 완료 - 로그인 하세요":"가입 실패, 다시 시도해주세요.";
		String loc=(n>0)?"home":"javascript:history.back()";
		m.addAttribute("msg", str);
		m.addAttribute("loc", loc);
		return "message";
		
	}
	@PostMapping("/login")
	public String loginProcess(HttpSession session, HttpServletResponse res, 
				@ModelAttribute("member") MemberVO vo, @RequestParam(defaultValue = "off") String saveId)
	throws Exception{
		boolean idCheck=this.memberService.idCheck(vo.getEmail());
		boolean pwdCheck = this.memberService.pwdCheck(vo.getEmail(), vo.getPwd());
		MemberVO loginUser = this.memberService.getMember(vo.getEmail());
		if(!idCheck||!pwdCheck) {	//없는 아이디 일 때 
			return "redirect:signIn";
		}else {
			session.setAttribute("loginUser", loginUser);
			Cookie ck=new Cookie("uid", loginUser.getEmail());
			if(saveId.equals("on")) {
				ck.setMaxAge(7*24*60*60);
			}else {
				ck.setMaxAge(0);
			}
			ck.setPath("/");
			res.addCookie(ck);
		}
		return "redirect:home";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home";
	}
}
