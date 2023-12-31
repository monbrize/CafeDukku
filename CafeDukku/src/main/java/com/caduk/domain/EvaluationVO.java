package com.caduk.domain;


import java.util.Date;

import lombok.Data;

@Data
public class EvaluationVO {

	private int cafeid;
	private int idx;
	private double kindness;
	private double clean;
	private double mood;
	private double price;
	private double comfort;
	private String cafename;
	
	private int rateid;
	private String heretogo;
	private String waiting;
	private Date ordertime; 
	private String menu;
	private int rate;
	private double menu_rate_avg;
}
