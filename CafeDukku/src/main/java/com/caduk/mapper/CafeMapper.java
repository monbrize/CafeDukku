package com.caduk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.caduk.domain.CafeVO;
import com.caduk.domain.EvaluationVO;
import com.caduk.domain.ListVO;

@Mapper
public interface CafeMapper {

	int createCafe(CafeVO vo);
	int updateOwner(int idx);
	int updateCafe(CafeVO vo);
	
	int getCafeIdbyIdx(int idx);
	CafeVO viewCafe(int cafeid);
	CafeVO viewMyCafe(int idx);
	
	List<CafeVO> getSearchCafe(String key);
	List<CafeVO> getAllCafe();
	List<CafeVO> getCafebyTag(String tag);
	int getFavCnt(int cafeid);

	//home
	List<ListVO> getOpenCafe();	//최근 오픈 카페 리스트 
	List<ListVO> getTopEval();	//항목별 제일 점수가 높은 카페 리스트
	
	int addImg(CafeVO vo);
	List<CafeVO> cafeImg(int cafeid);
	CafeVO cafeImgbyId(int imgid);	//이미지 삭제시
	int removeImg(int imgid);

	int addTag(CafeVO vo);
	List<CafeVO> cafeTag(int cafeid);
	int removeTag(CafeVO vo);
	
	
	//eval
	int evalCafe(EvaluationVO vo);
	//평가리스트가 있는지 확인, 0이면 없음 
	int isEval(int cafeid);
	double getMyTotalEval(int cafeid);	//카페의 총점
	EvaluationVO getMyEval(int cafeid);		//카페의 항목별 점수

	//map
	List<CafeVO> getAllMap();
}
