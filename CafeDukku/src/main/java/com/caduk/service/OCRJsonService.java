package com.caduk.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class OCRJsonService {
	static String apiURL = "https://yyqnct9n25.apigw.ntruss.com/custom/v1/23587/28c9f063b51303334314143c87864304e804e4771ef28382f53715e4e0dbe55d/document/receipt";
	static String secretKey = "cVBkSWhFWmFlSndVV2xsTWtWUlR3d3hla2dBZHp1em8=";
	static String imageDir = "/Users/youreru/git/repository/CafeDukku/src/main/webapp/receipt_img/";

		public String executeOCR(String imgUrl) {
			
			try {
				URL url = new URL(apiURL);
				HttpURLConnection con = (HttpURLConnection)url.openConnection();
				con.setUseCaches(false);
				con.setDoInput(true);
				con.setDoOutput(true);
				con.setRequestMethod("POST");
				con.setRequestProperty("Content-Type", "application/json; charset=utf-8");
				con.setRequestProperty("X-OCR-SECRET", secretKey);

				JSONObject json = new JSONObject();
				json.put("version", "V2");
				json.put("requestId", UUID.randomUUID().toString());
				json.put("timestamp", System.currentTimeMillis());
				JSONObject image = new JSONObject();
				image.put("format", "jpg");
				FileInputStream inputStream = new FileInputStream(imageDir+imgUrl);
				byte[] buffer = new byte[inputStream.available()];
				inputStream.read(buffer);
				inputStream.close();
				image.put("data", buffer);
				image.put("name", "demo");
				JSONArray images = new JSONArray();
				images.put(image);
				json.put("images", images);
				String postParams = json.toString();

				DataOutputStream wr = new DataOutputStream(con.getOutputStream());
				wr.writeBytes(postParams);
				wr.flush();
				wr.close();

				int responseCode = con.getResponseCode();
				BufferedReader br;
				if (responseCode == 200) {
					br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else {
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				String inputLine;
				StringBuffer response = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					response.append(inputLine);
				}
				br.close();

				return response.toString();
			} catch (Exception e) {
				System.out.println(e);
			}
			return null;
		}

	
	

}
