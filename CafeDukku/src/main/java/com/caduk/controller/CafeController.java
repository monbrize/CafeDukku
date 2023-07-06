package com.caduk.controller;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.constraints.Null;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.caduk.domain.CafeVO;
import com.caduk.domain.EvaluationVO;
import com.caduk.domain.MemberVO;
import com.caduk.service.CafeService;
import com.caduk.service.MemberService;

import lombok.extern.log4j.Log4j2;


@Controller
@Log4j2
public class CafeController {
	
	@Autowired
	private CafeService cafeService;
	
	@Autowired
	private MemberService memberService;


	@PostMapping("/createCafe")
	public String createCafe(Model m, @ModelAttribute CafeVO vo, HttpSession session) {
		int n=cafeService.createCafe(vo);

		String str=(n>0)?"카페 등록이 완료되었습니다. 다시 로그인 해주세요.":"요청이 실패하였습니다. 다시 시도해주세요.";
		String loc=(n>0)?"/signOut":"javascript:history.back()";
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
	public int getCafeid(MemberVO member) {
		int idx=member.getIdx();
		CafeVO cafe=cafeService.viewCafe(idx);
		int cafeid=cafe.getCafeid();
		return cafeid;
	}
	
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
		String upDir="/Users/youreru/git/repository/CafeDukku/src/main/webapp/logo_img";		

		//파일 업로드
		MultipartHttpServletRequest mr=(MultipartHttpServletRequest)req;
		if(mr!=null) {
		List<MultipartFile> menu_img_list=mr.getFiles("menu_img");
		if(menu_img_list.size()>0 && !menu_img_list.get(0).getOriginalFilename().equals("")) {
			System.out.println("menu_img_list::"+menu_img_list.size());
			fileUpload(menu_img_list, "menu", vo.getCafeid());
		}
		List<MultipartFile> cafe_img_list=mr.getFiles("cafe_img");
		if(cafe_img_list.size()>0 && !cafe_img_list.get(0).getOriginalFilename().equals("")) {
			fileUpload(cafe_img_list, "cafe", vo.getCafeid());
		}
		List<MultipartFile> logo_img_list=mr.getFiles("logo_img");
		if(logo_img_list.size()>0 && !logo_img_list.get(0).getOriginalFilename().equals("")) {
			System.out.println("logo_img_list::"+logo_img_list.size());
			fileUpload(logo_img_list, "logo", vo.getCafeid());
		}
		}
		int n=cafeService.updateCafe(vo);
		String str=(n>0)?"수정이 완료되었습니다.":"요청이 실패하였습니다. 다시 시도해주세요.";
		String loc=(n>0)?"home":"javascript:history.back()";
		m.addAttribute("msg", str);
		m.addAttribute("loc", loc);
		return "common/message";
	}
	@GetMapping("/viewCafe")
	@ResponseBody
	public ModelAndView viewCafe(HttpSession session, @RequestParam(defaultValue="0") int cafeid) {
		ModelAndView mv=new ModelAndView();
		CafeVO cafe=new CafeVO();
		List<CafeVO> imgs = new ArrayList<>();
		List<CafeVO> tags = new ArrayList<>();
		
		MemberVO member=(MemberVO) session.getAttribute("loginUser");	//로그인 한 유저 
		if(cafeid==0) {	//카페 아이디가 없을 때 내 카페 
			cafe=cafeService.viewMyCafe(member.getIdx());
			int mycafeid=cafe.getCafeid();
			cafe.setFavTotalCnt(this.memberService.getFavCnt(mycafeid));
			imgs= this.cafeService.cafeImg(mycafeid);
			tags=this.cafeService.cafeTag(mycafeid);
			member.setCafeid(mycafeid);
			
		} else { //기본 
			cafe=cafeService.viewCafe(cafeid);
			cafe.setFavTotalCnt(this.memberService.getFavCnt(cafeid));
			imgs= this.cafeService.cafeImg(cafeid);
			tags=this.cafeService.cafeTag(cafeid);
			//member.setCafeid(cafeid);
		}
		if(member !=null) {	//로그인 했을 때
			cafe.setMyFav(this.memberService.myFav(member));	//해당 유저가 즐겨찾기 했는지 			
		} 
		mv.addObject("cafe", cafe);
		mv.addObject("imgs", imgs);
		mv.addObject("tags", tags);
		mv.setViewName("viewCafe");
		
		return mv;
	}
	
	@GetMapping(value="/searchCafe", produces="application/json")
	public ModelAndView cafeList(@RequestParam(defaultValue="") String key, @RequestParam(defaultValue="") String tag){
		ModelAndView mv=new ModelAndView();
		List<CafeVO> arr=null;
		String text="";
		if(!tag.isEmpty()) {	//태그로 가져오기
			
			arr=this.cafeService.getCafebyTag(tag);
			text=tag;
		}
		if(key.isEmpty()) {	//key가 없다면 모든 카페 정보 가져오기 
			arr=this.cafeService.getAllCafe();
		}else {	//key 값으로 가져오기 
			arr=this.cafeService.getSearchCafe(key);
			text=key;
		}
		mv.addObject("cafe", arr);
		mv.addObject("text", text);
		mv.setViewName("searchResult");
		return mv;
	}
	@GetMapping("/eval")
	public String evalForm(@RequestParam int cafeid, Model m) {
		
		m.addAttribute("cafeid", cafeid);
		return "eval";
	}
	@PostMapping("/evalCafe")
	public String evalCafe(@ModelAttribute EvaluationVO vo, Model m) {
		int n=this.cafeService.evalCafe(vo);
		String str=(n>0)?"평가 완료 ":"실패, 다시 시도해주세요.";
		String loc=(n>0)?"/viewCafe":"javascript:history.back()";
		m.addAttribute("msg", str);
		m.addAttribute("loc", loc);
		return "common/message";
	}
	
	@PutMapping("/addTag")
	public  ResponseEntity<String> addtoTag(int cafeid, String tag_type,String tag_name ) {
		CafeVO vo=new CafeVO();
		vo.setCafeid(cafeid);
		vo.setTag_type(tag_type);
		vo.setTag_name(tag_name);
		int n=this.cafeService.addTag(vo);
		return (n>0)?new ResponseEntity<>("success", HttpStatus.OK):new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	@DeleteMapping(value="/deleteTag")
	public ResponseEntity<String> delTag(@RequestParam String tag_type, @RequestParam String tag_name, @RequestParam int cafeid) {
		CafeVO vo=new CafeVO();
		vo.setCafeid(cafeid);
		vo.setTag_type(tag_type);
		vo.setTag_name(tag_name);
		int n=this.cafeService.removeTag(vo);
		
		return (n>0)?new ResponseEntity<>("success", HttpStatus.OK):new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	@DeleteMapping("/delImg")
	public ResponseEntity<String> delImg(@RequestParam int imgid) {
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
	
	
}
