package com.caduk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.caduk.domain.CafeVO;
import com.caduk.domain.EvaluationVO;

@Mapper
public interface CafeMapper {

	int createCafe(CafeVO vo);
	int updateCafe(CafeVO vo);
	int deleteCafe(int cafeid);
	CafeVO viewCafe(int cafeid);
	CafeVO viewMyCafe(int idx);
	List<CafeVO> getSearchCafe(String key);
	List<CafeVO> getAllCafe();
	List<CafeVO> getCafebyTag(String tag);
	int updateOwner(int idx);
	
	List<CafeVO> getOpenCafe();
	
	int addImg(CafeVO vo);
	List<CafeVO> cafeImg(int cafeid);
	int removeImg(int imgid);

	int addTag(CafeVO vo);
	List<CafeVO> cafeTag(int cafeid);
	int removeTag(CafeVO vo);
	CafeVO cafeImgbyId(int imgid);
	
	CafeVO getMySearchList(int cafeid);
	
	//eval
	int evalCafe(EvaluationVO vo);
	double getMyTotalEval(int cafeid);
	//평가리스트가 있는지 확인, 0이면 없음 
	int isEval(int cafeid);
	CafeVO getMyEval(int cafeid);
	List<CafeVO> getTopEval();

	//map
	List<CafeVO> getAllMap();
}
