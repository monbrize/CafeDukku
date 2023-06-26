package com.caduk.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.caduk.domain.CafeVO;
import com.caduk.service.CafeService;

@RestController
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
}
