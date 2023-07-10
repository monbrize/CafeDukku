package com.caduk.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.caduk.domain.EvaluationVO;
import com.caduk.service.EvalService;
import com.caduk.service.OCRJsonService;


@Controller
public class EvalController {

	
	@Autowired
	private OCRJsonService jService;
	@Autowired
	private EvalService eService;
	
	
	@PostMapping(value="/sendReceipt", produces="application/json; charset=utf-8")
	@ResponseBody
	public String sendReceipt(@RequestParam("imgReceipt") MultipartFile mf) {
		String dir="/Users/youreru/git/repository/CafeDukku/src/main/webapp/receipt_img";
		String filename="";
		if(!mf.isEmpty()) {
			UUID uid=UUID.randomUUID();
			filename=uid.toString();
			File file=new File(dir, filename);
			try {
				mf.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String response = this.jService.executeOCR(filename);
		//json 객체 key 값으로 오려내기  
		JSONObject jsonObject=new JSONObject(response);
		//square barcket[ ]
		JSONObject squareBarcket=jsonObject.getJSONArray("images").getJSONObject(0);
		//카페 등록 여부 체크 - 카페명 얻기
		JSONObject receipt=squareBarcket.getJSONObject("receipt").getJSONObject("result").getJSONObject("storeInfo").getJSONObject("name");	//curly bracket { }
		String cafename=receipt.getString("text");
		int cafechk=this.eService.cafeCheck(cafename);
		if(cafechk==0) {
			return null;
		}
		//반환할 결과 오려내기
		JSONObject result=squareBarcket.getJSONObject("receipt").getJSONObject("result");
		
		
		return result.toString();
	}
	
	@PostMapping("/evalReceipt")
	public String evalReceipt(Model model, @ModelAttribute EvaluationVO vo, @RequestParam("menu") List<String> menu, @RequestParam("rate") List<String> rate ) {
		int cafeid=this.eService.getCafeIdbyName(vo.getCafename());
		vo.setCafeid(cafeid);
		//날짜가 없는 경우 
		if(vo.getOrdertime()==null) {
			vo.setOrdertime(new Date());
		}
		
		List<EvaluationVO> list = new ArrayList<>();
		if(!menu.isEmpty()||menu!=null||!rate.isEmpty()||rate!=null) {
			for(int i=0; i<menu.size(); i++) {
				EvaluationVO eval=new EvaluationVO();
				eval.setCafeid(cafeid);
				eval.setMenu(menu.get(i));
				eval.setRate(Integer.parseInt(rate.get(i)));
				System.out.println("eval:::"+eval.toString());
				list.add(eval);
			}
		}
		int n=this.eService.evalMenu(list);
		int m=this.eService.evalCafe(vo);
		String msg=(n>0&&m>0)?"평가가 완료되었습니다.":"평가에 실패하였습니다. 다시 시도해주세요.";
		String loc=(n>0&&m>0)?"/viewCafe?cafeid="+cafeid:"javascript:history.back()";
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/message";
		
	}
}
	
