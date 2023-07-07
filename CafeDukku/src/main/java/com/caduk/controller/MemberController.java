package com.caduk.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.caduk.domain.CafeVO;
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
		return "common/message";
		
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
	
	@GetMapping("/signOut")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home";
	}
	
	@GetMapping("/myPage")
	public String goMyPage(HttpSession session, Model m) {
		MemberVO vo=(MemberVO) session.getAttribute("loginUser");
		List<CafeVO> favList=this.memberService.getMyFavList(vo.getIdx());
		List<CafeVO> evalList=this.memberService.getMyEvalList(vo.getIdx());
		m.addAttribute("fav", favList);
		m.addAttribute("favCnt", favList.size());
		m.addAttribute("eval", evalList);
		m.addAttribute("evalCnt", evalList.size());
		return "myPage";
	}
	
	@PutMapping("/addfav")
	public ResponseEntity<String> addFav(@RequestParam int idx, @RequestParam int cafeid) {
		MemberVO vo=new MemberVO();
		vo.setCafeid(cafeid);
		vo.setIdx(idx);
		int n=this.memberService.addFav(vo);
		
		return (n>0)?new ResponseEntity<>("success", HttpStatus.OK):new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	@DeleteMapping("/cancelfav")
	public ResponseEntity<String> cacelFav(@RequestParam int idx, @RequestParam int cafeid) {
		MemberVO vo=new MemberVO();
		vo.setCafeid(cafeid);
		vo.setIdx(idx);
		int n=this.memberService.cancelFav(vo);
		
		return (n>0)?new ResponseEntity<>("success", HttpStatus.OK):new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
