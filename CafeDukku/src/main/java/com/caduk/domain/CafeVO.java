package com.caduk.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CafeVO {
	private int cafeid;
	private int idx;
	private String cafename;
	private String cafename2;
	private String inform;
	private String notice;
	private String sns_url;
	private String call;
	private String postcode;
	private String loc1; 
	private String loc2;
	private String mapcode1;
	private String mapcode2;
	private String status;
	private int fav_cnt;
	private double score;
	private String scoreType;
	
	private double totalScore;	//카페의 별점 토탈 
	//home
	private double kindScore;
	private double cleanScore;
	private double moodScore;
	private double priceScore;
	private double comfortScore;
	
	private int favTotalCnt;	//카페의 하트 계 
	private boolean myFav;		//회원 하트 여부 
	
	private String tag_type;
	private String tag_name;
	
	private int imgid;
	private String img_type;
	private String img_name;
	private String img_name_origin;
}
