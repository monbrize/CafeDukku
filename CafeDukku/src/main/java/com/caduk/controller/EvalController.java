package com.caduk.controller;

import java.io.File;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.caduk.service.OCRJsonService;


@Controller
public class EvalController {

	
	@Autowired
	private OCRJsonService jService;
	
	
	@PostMapping(value="/sendReceipt", produces="application/json; charset=utf-8")
	@ResponseBody
	public String sendReceipt(@RequestParam("imgReceipt") MultipartFile mf, HttpServletRequest req) {
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
		//String response = "{\"images\": [{\"receipt\": {\"result\": {\"storeInfo\": {\"name\": {\"text\": \"시그니쳐로스터스\"},\"bizNum\": {\"text\": \"1381325631\"}},\"tel\": [{\"text\": \"07077838904\",\"formatted\": {\"value\": \"07077838904\"}}]},\"subResults\": [{\"items\": [{\"name\": {\"text\": \"I.바닐라라떼\",\"formatted\": {\"value\": \"I.바닐라라떼\"}}},{\"name\": {\"text\": \"콜롬비아 레드게\",\"formatted\": {\"value\": \"콜롬비아 레드게\"}}}]}]}}]}";
		JSONObject jsonObject=new JSONObject(response);
		JSONObject squareBarcket=jsonObject.getJSONArray("images").getJSONObject(0);//square barcket [ ]
		JSONObject receipt=squareBarcket.getJSONObject("receipt").getJSONObject("result").getJSONObject("storeInfo").getJSONObject("name");	//curly bracket { }
		System.out.println(receipt.getString("text"));
		
		
		
		return response;
	}
}
	
