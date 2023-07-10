package com.caduk.controller;

import java.util.List;

import javax.servlet.http.Cookie;
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

import com.caduk.domain.ListVO;
import com.caduk.domain.MemberVO;
import com.caduk.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	
	@PostMapping("/join")
	public String newMember(Model m, @ModelAttribute MemberVO vo) {
		int n=this.memberService.newMember(vo);
		String str=(n>0)?"회원가입 완료 - 로그인 하세요":"가입 실패, 다시 시도해주세요.";
		String loc=(n>0)?"/":"javascript:history.back()";
		m.addAttribute("msg", str);
		m.addAttribute("loc", loc);
		return "common/message";
		
	}
	@PostMapping("/login")
	public String loginProcess(HttpSession session, HttpServletResponse res, 
				@ModelAttribute("member") MemberVO vo, Model m, @RequestParam(defaultValue = "off") String saveId)
	throws Exception{
		boolean idCheck=this.memberService.idCheck(vo.getEmail());
		boolean pwdCheck = this.memberService.pwdCheck(vo.getEmail(), vo.getPwd());
		MemberVO loginUser = this.memberService.getMember(vo.getEmail());
		if(!idCheck) {	//아이디 없을 때 
			m.addAttribute("msg", "없는 아이디 입니다. 다시 입력해주세요.");
			m.addAttribute("loc", "javascript:history.back()");
			return "common/message";
		}else if(!pwdCheck) {	//비밀번호가 다를 때 
			m.addAttribute("msg", "비밀번호가 틀립니다. 다시 입력해주세요.");
			m.addAttribute("loc", "javascript:history.back()");
			return "common/message";
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
		return "redirect:/";
	}
	
	@GetMapping("/signOut")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/myPage")
	public String goMyPage(Model m, HttpSession session, @RequestParam("idx") int idx) {
		List<ListVO> favList=this.memberService.getMyFavList(idx);
		List<ListVO> evalList=this.memberService.getMyEvalList(idx);
		
		m.addAttribute("fav", favList);
		m.addAttribute("favCnt", favList.size());   
		m.addAttribute("eval", evalList);           
		m.addAttribute("evalCnt", evalList.size()); 
		return "myPage";
	}
	
	@PostMapping("/updateMember")
	public String updateMember(Model m, @ModelAttribute MemberVO vo) {
		int n=this.memberService.updateMember(vo);
		String str=(n>0)?"회원정보 수정이 완료되었습니다. 다시 로그인해주세요.":"회원정보 수정이 실패하였습니다.";
		String loc=(n>0)?"/signOutIn":"javascript:history.back()";
		m.addAttribute("msg", str);
		m.addAttribute("loc", loc);
		
		return "common/message";
		
	}
	
	@PutMapping("/addfav")
	public ResponseEntity<String> addFav(@ModelAttribute MemberVO vo) {
		int n=this.memberService.addFav(vo);
		return (n>0)?new ResponseEntity<>("success", HttpStatus.OK):new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	@DeleteMapping("/cancelfav")
	public ResponseEntity<String> cacelFav(@ModelAttribute MemberVO vo) {
		int n=this.memberService.cancelFav(vo);
		return (n>0)?new ResponseEntity<>("success", HttpStatus.OK):new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
