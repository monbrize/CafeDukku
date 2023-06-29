package com.caduk.controller;


import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.caduk.domain.CafeVO;
import com.caduk.domain.MemberVO;
import com.caduk.service.CafeService;

import lombok.extern.log4j.Log4j2;


@Controller
@Log4j2
public class CafeController {
	
	@Autowired
	private CafeService cafeService;


	@PostMapping("/createCafe")
	public String createCafe(Model m, @ModelAttribute CafeVO vo) {
		int n=cafeService.createCafe(vo);
		String str=(n>0)?"카페 등록이 완료되었습니다.":"요청이 실패하였습니다. 다시 시도해주세요.";
		String loc=(n>0)?"home":"javascript:history.back()";
		m.addAttribute("msg", str);
		m.addAttribute("loc", loc);
		return "common/message";
	}
	@GetMapping("/editCafe")
	@ResponseBody
	public ModelAndView goEditCafe(HttpSession session) {
		ModelAndView mv=new ModelAndView();
		CafeVO cafe=new CafeVO();
		MemberVO member=(MemberVO) session.getAttribute("loginUser");
		System.out.println(member.toString());
		int idx=member.getIdx();
		cafe=cafeService.viewCafe(idx);
		mv.addObject("cafe", cafe);
		mv.setViewName("updateCafe");
		return mv;
	}
	public int getCafeid(MemberVO member) {
		int idx=member.getIdx();
		CafeVO cafe=cafeService.viewCafe(idx);
		int cafeid=cafe.getCafeid();
		return cafeid;
	}
	@PostMapping("/updateCafe")
	public String updateCafe(Model m, @ModelAttribute CafeVO vo) {
		int n=cafeService.updateCafe(vo);
		System.out.println("inform::::"+vo.getInform());
		String str=(n>0)?"수정이 완료되었습니다.":"요청이 실패하였습니다. 다시 시도해주세요.";
		String loc=(n>0)?"home":"javascript:history.back()";
		m.addAttribute("msg", str);
		m.addAttribute("loc", loc);
		return "common/message";
	}
	@GetMapping("/viewCafe")
	@ResponseBody
	public ModelAndView viewCafe(HttpSession session) {
		ModelAndView mv=new ModelAndView();
		CafeVO cafe=new CafeVO();
		MemberVO member=(MemberVO) session.getAttribute("loginUser");
		System.out.println(member.toString());
		int idx=member.getIdx();
		cafe=cafeService.viewCafe(idx);
		mv.addObject("cafe", cafe);
		mv.setViewName("viewCafe");
		
		
		return mv;
	}
	
	
	@GetMapping(value="/addTag", produces="application/json")
	@ResponseBody
	public ModelMap addtoTag(int cafeid, String tag_type,String tag_name ) {
		CafeVO vo=new CafeVO();
		vo.setCafeid(cafeid);
		vo.setTag_type(tag_type);
		vo.setTag_name(tag_name);
		System.out.println(vo.toString());
		int n=this.cafeService.addTag(vo);
		String res=(n>0)?"success":"failed";
		System.out.println("n::::"+n+"/res:::::"+res);
		ModelMap map=new ModelMap("result",res);
		return map;
	}
	@GetMapping(value="/deleteTag")
	@ResponseBody
	public String removeTag(@RequestParam String tag_type, @RequestParam String tag_name, @RequestParam int cafeid) {
		CafeVO vo=new CafeVO();
		vo.setCafeid(cafeid);
		vo.setTag_type(tag_type);
		vo.setTag_name(tag_name);
		System.out.println(vo.toString());
		int n=this.cafeService.removeTag(vo);
		String res=(n>0)?"success":"failed";
		return res;
	}
	
	@PostMapping("/addLogoImg")
	public String addLogoImg(@RequestParam(value="logoFile",required = false) MultipartFile multi, HttpServletRequest req, HttpSession session) {
		System.out.println("add Logo Img controller===========");
		MemberVO vo = (MemberVO)session.getAttribute("loginUser");
		int cafeid=getCafeid(vo);
		CafeVO cafe=new CafeVO();
		cafe.setCafeid(cafeid);
		cafe.setImg_type("logo");
		String upDir="/Users/youreru/git/repository/CafeDukku/src/main/webapp/logo_img";		
		int n=0;
		if(!multi.isEmpty()) { //첨부했다면 
			String filename=multi.getOriginalFilename(); //파일명 
			System.out.println("filename::"+filename);
			cafe.setImg_name(cafeid+"_"+filename);
			try {
				multi.transferTo(new File(upDir, cafe.getImg_name()));
				n=this.cafeService.addImg(cafe);
				System.out.println("n :::::"+n);
			}catch(IOException e) {
				log.info("업로드 실패 : "+e);
			}
		}
		return (n>0)?"success":"failed";
		
	}
	
}
