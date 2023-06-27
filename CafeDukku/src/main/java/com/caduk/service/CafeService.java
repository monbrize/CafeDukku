package com.caduk.service;

import java.util.List;

import com.caduk.domain.CafeVO;

public interface CafeService {

	int createCafe(CafeVO vo);
	int updateCafe(CafeVO vo);
	int deleteCafe(int cafeId);
	CafeVO viewCafe(int idx);
	CafeVO searchCafe(String key);
	int updateOwner(int idx);
	
	//cafeid, tag_type, tag_name
	int addImg(int cafeid, String img_type, String img_name);
	int removeImg(int cafeid, String img_type, String img_name);
	int removeAllImg(int cafeid, String img_type);	//타입별 전체삭제
	String logoImg(int cafeid);
	List<String> menuImg(int cafeid);
	List<String> cafeImg(int cafeid);
	
	int addTag(CafeVO vo);
	int removeTag(CafeVO vo);
}
