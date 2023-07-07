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

}
