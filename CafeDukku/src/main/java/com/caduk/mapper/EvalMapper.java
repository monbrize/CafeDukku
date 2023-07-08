package com.caduk.mapper;


import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.caduk.domain.EvaluationVO;

@Mapper
public interface EvalMapper {
	
	int cafeCheck(String cafename);
	int getCafeIdbyName(String cafename);
	int evalCafe(EvaluationVO vo);
	int evalMenu(List<EvaluationVO> list);
	
}
