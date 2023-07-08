package com.caduk.service;

import java.util.List;
import com.caduk.domain.EvaluationVO;

public interface EvalService {

	//카페 아이디 존재 여부
	int cafeCheck(String cafename);
	int getCafeIdbyName(String cafename);
	//항목 insert
	int evalCafe(EvaluationVO vo);
	//메뉴 insert
	int evalMenu(List<EvaluationVO> list);
	
	
	
}
