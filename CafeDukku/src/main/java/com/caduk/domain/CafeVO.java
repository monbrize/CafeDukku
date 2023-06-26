package com.caduk.domain;

import lombok.Data;

@Data
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
	
	private String tag_type;
	private String tag_name;
	private String img_type;
	private String img_name;
}
