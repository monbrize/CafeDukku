package com.caduk.domain;

import lombok.Data;

@Data
public class MemberVO {

	private int idx;
	private String email;
	private String pwd;
	private String name;
	private String phone;
	private String status;
	private String roll;
	private int cafeid;
	private String memo;
	
	private String img_name;
	private String cafename;
	private String cafename2;
	private int eachFavTotal;
}
