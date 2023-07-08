package com.caduk.service;

import java.util.List;

import com.caduk.domain.CafeVO;
import com.caduk.domain.EvaluationVO;
import com.caduk.domain.ListVO;

public interface CafeService {

	int createCafe(CafeVO vo);
	int updateCafe(CafeVO vo);
	//---------
	int deleteCafe(int cafeid);
	//---------
	int getCafeIdbyIdx(int idx);
	CafeVO viewCafe(int cafeid);
	CafeVO viewMyCafe(int idx);
	List<CafeVO> getSearchCafe(String key);
	List<CafeVO> getAllCafe();
	List<CafeVO> getCafebyTag(String tag);
	int getFavCnt(int cafeid);
	
	List<ListVO> getOpenCafe();
	List<ListVO> getTopEval();	//home

	int addImg(CafeVO vo);
	List<CafeVO> cafeImg(int cafeid);
	CafeVO cafeImgbyId(int imgid);
	int removeImg(int imgid);

	int addTag(CafeVO vo);
	List<CafeVO> cafeTag(int cafeid);
	int removeTag(CafeVO vo);
	
	//eval
	int evalCafe(EvaluationVO vo);
	double getMyTotalEval(int cafeid);	//searchList
	EvaluationVO getMyEval(int cafeid);	//mycafe
	
	List<EvaluationVO> getTopMenu(int cafeid);
	
	//map
	List<CafeVO> getAllMap();
	
	
}
