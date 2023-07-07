package com.caduk.controller;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.caduk.domain.CafeVO;
import com.caduk.domain.EvaluationVO;
import com.caduk.domain.MemberVO;
import com.caduk.service.CafeService;
import com.caduk.service.MemberService;

@Controller
public class CafeController {
	
	@Autowired
	private CafeService cafeService;
	
	@Autowired
	private MemberService memberService;


	@PostMapping("/createCafe")
	public String createCafe(Model m, @ModelAttribute CafeVO vo) {
		int n=cafeService.createCafe(vo);
		String str=(n>0)?"카페 등록이 완료되었습니다. 다시 로그인 해주세요.":"카페 등록이 실패하였습니다.";
		String loc=(n>0)?"/signOutIn":"javascript:history.back()";
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
		int idx=member.getIdx();
		cafe=cafeService.viewMyCafe(idx);
		List<CafeVO> imgs=this.cafeService.cafeImg(cafe.getCafeid());
		List<CafeVO> tags=this.cafeService.cafeTag(cafe.getCafeid());
		
		mv.addObject("imgs", imgs);
		mv.addObject("tags", tags);
		mv.addObject("cafe", cafe);
		mv.setViewName("updateCafe");
		return mv;
	}
	
	//파일 업로드 메소드 
	public void fileUpload(List<MultipartFile> files, String type, int cafeid) {
		String upDir="/Users/youreru/git/repository/CafeDukku/src/main/webapp/"+type+"_img";
		CafeVO vo=new CafeVO();
		vo.setCafeid(cafeid);
		vo.setImg_type(type);
		if(files!=null) {
			for(int i=0; i<files.size(); i++) {
				MultipartFile mf=files.get(i);
				//랜덤한 문자열_파일명 
				UUID uid=UUID.randomUUID();
				String uidStr=uid.toString();
				String realname=mf.getOriginalFilename();
				String fname=uidStr+realname;
				vo.setImg_name(fname);
				vo.setImg_name_origin(realname);
				try {
					mf.transferTo(new File(upDir,fname));
					this.cafeService.addImg(vo);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	} 
	@PostMapping("/updateCafe")
	public String updateCafe(Model m, @ModelAttribute CafeVO vo, HttpServletRequest req) {
		//파일 업로드
		
		MultipartHttpServletRequest mr=(MultipartHttpServletRequest)req;
		if(mr!=null) {
			//메뉴 
			List<MultipartFile> menu_img_list=mr.getFiles("menu_img");
			//이미지가 안들어 갈 경우 예외처리... 파일이 없어도 size()는 1 
			if(menu_img_list.size()>0 && !menu_img_list.get(0).getOriginalFilename().equals("")) {
				fileUpload(menu_img_list, "menu", vo.getCafeid());
			}
			//카페 
			List<MultipartFile> cafe_img_list=mr.getFiles("cafe_img");
			if(cafe_img_list.size()>0 && !cafe_img_list.get(0).getOriginalFilename().equals("")) {
				fileUpload(cafe_img_list, "cafe", vo.getCafeid());
			}
			//로고
			List<MultipartFile> logo_img_list=mr.getFiles("logo_img");
			if(logo_img_list.size()>0 && !logo_img_list.get(0).getOriginalFilename().equals("")) {
				fileUpload(logo_img_list, "logo", vo.getCafeid());
			}
		}
		int n=cafeService.updateCafe(vo);
		String str=(n>0)?"수정이 완료되었습니다.":"수정에 실패하였습니다. 다시 시도해주세요.";
		String loc=(n>0)?"/viewCafe?cafeid="+vo.getCafeid():"javascript:history.back()";
		m.addAttribute("msg", str);
		m.addAttribute("loc", loc);
		return "common/message";
	}
	
	@GetMapping("/viewCafe")
	@ResponseBody
	public ModelAndView viewCafe(HttpSession session, @RequestParam(value="cafeid", required=false, defaultValue="0") int cafeid) {
		ModelAndView mv=new ModelAndView();
		CafeVO cafe=new CafeVO();
		List<CafeVO> imgs = new ArrayList<>();
		List<CafeVO> tags = new ArrayList<>();
		MemberVO member=(MemberVO) session.getAttribute("loginUser");	//로그인 한 유저 -멤버 정보만 갖고있음. 
		if(member !=null) {	//로그인 했다면
			System.out.println("login!");
			int idx=member.getIdx();	//로그인한 유저의 idx
			if(cafeid==0) {	//카페 아이디가 없을 때 내 카페로 이동 
				cafe=cafeService.viewMyCafe(idx);	//로그인한 유저가 가진 내 카페 정보 -이카페가 내카페인지!!
				cafeid=cafe.getCafeid();	//idx로 카페 아이디 알아냄.
			}else {
				cafe = cafeService.viewCafe(cafeid);	//내 카페가 아닌 카페 
			}
			cafe.setMyFav(this.memberService.myFav(idx, cafeid));	//해당 유저가 즐겨찾기 했는지 -cafeid와 idx로 즐겨찾기 여부 반환 	
			
		}else {	//로그인 안 했을때 파라미터로 가져오기 
			cafe = cafeService.viewCafe(cafeid);
			//즐겨찾기 여부 필요없음
		}
		
		//카페아이디로 카페의 하트갯수 get
		cafe.setFavTotalCnt(this.cafeService.getFavCnt(cafeid));
		//해당 카페의 다섯가지 평가 항목의 평균스코어를 가져옴
		EvaluationVO evals=this.cafeService.getMyEval(cafeid);
		//카페의 별점 
		cafe.setTotalScore(this.cafeService.getMyTotalEval(cafeid));
		
		imgs = this.cafeService.cafeImg(cafeid);
		tags = this.cafeService.cafeTag(cafeid);
		mv.addObject("evals", evals);
		mv.addObject("cafe", cafe);
		mv.addObject("imgs", imgs);
		mv.addObject("tags", tags);
		mv.setViewName("viewCafe");
		
		return mv;
	}
	
	@GetMapping("/searchCafe")
	@ResponseBody
	public ModelAndView cafeList(@RequestParam(defaultValue="") String key, @RequestParam(defaultValue="") String tag){
		ModelAndView mv=new ModelAndView();
		List<CafeVO> arr=null;
		String text="";
		if(!tag.isEmpty()) {	//태그로 가져오기
			arr=this.cafeService.getCafebyTag(tag);
			text=tag;
		}else if(!key.isEmpty()) {	//key 값으로 가져오기 
			arr=this.cafeService.getSearchCafe(key);
			text=key;
		}else {		//key가 없다면 모든 카페 정보 가져오기 
			arr=this.cafeService.getAllCafe();
			text="All";
		}
		mv.addObject("cafe", arr);
		mv.addObject("text", text);
		mv.addObject("cnt", arr.size());
		mv.setViewName("searchResult");
		return mv;
	}
	@PostMapping("/evalCafe")
	public String evalCafe(@ModelAttribute EvaluationVO vo, Model m) {
		int n=this.cafeService.evalCafe(vo);
		String str=(n>0)?"평가 완료 ":"실패, 다시 시도해주세요.";
		String loc=(n>0)?"/viewCafe?cafeid="+vo.getCafeid():"javascript:history.back()";
		m.addAttribute("msg", str);
		m.addAttribute("loc", loc);
		return "common/message";
	}
	
	@PutMapping("/addTag")
	public  ResponseEntity<String> addtoTag(@ModelAttribute CafeVO vo) {
		int n=this.cafeService.addTag(vo);
		return (n>0)?new ResponseEntity<>("success", HttpStatus.OK):new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	@DeleteMapping(value="/deleteTag")
	public ResponseEntity<String> delTag(@ModelAttribute CafeVO vo) {
		int n=this.cafeService.removeTag(vo);
		
		return (n>0)?new ResponseEntity<>("success", HttpStatus.OK):new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	@DeleteMapping("/delImg")
	public ResponseEntity<String> delImg(@RequestParam("imgid") int imgid) {
		int res=0;
		CafeVO cafe=new CafeVO();
		cafe=this.cafeService.cafeImgbyId(imgid);
		Path file=Paths.get("/Users/youreru/git/repository/CafeDukku/src/main/webapp/"+cafe.getImg_type()
				+"_img/"+cafe.getImg_name());
		try {
			Files.deleteIfExists(file);
			res=this.cafeService.removeImg(imgid);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return (res>0)?new ResponseEntity<>("success", HttpStatus.OK):new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/searchbyMap")
	public ModelAndView getMapbyKey(@RequestParam(value="key", required=false, defaultValue="") String key) {
		ModelAndView mv=new ModelAndView();
		List<CafeVO> list=this.cafeService.getAllMap();
		mv.addObject("key", key);
		mv.addObject("list", list);
		mv.setViewName("searchMap");
		return mv;
	}
	
}
