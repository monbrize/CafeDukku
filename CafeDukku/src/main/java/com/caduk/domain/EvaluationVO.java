package com.caduk.domain;

import java.util.Date;

import lombok.Data;

@Data
public class EvaluationVO {

	private int rateid;
	private int cafeid;
	private Date ordertime; 
	private int idx;
	private String heretogo;
	private String waiting;
	private int kindness;
	private int clean;
	private int mood;
	private int price;
	private int comfort;
	

	
	
	private String menu;
	private int rate;
	
}
