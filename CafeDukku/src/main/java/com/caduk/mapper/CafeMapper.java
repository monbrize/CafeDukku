package com.caduk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.caduk.domain.CafeVO;

@Mapper
public interface CafeMapper {

	int createCafe(CafeVO vo);
	int updateCafe(CafeVO vo);
	int deleteCafe(int cafeId);
	CafeVO viewCafe(int idx);
	CafeVO searchCafe(String key);
	int updateOwner(int idx);
	
	int addImg(CafeVO vo);
	List<CafeVO> cafeImg(int cafeid);
	int removeImg(int imgid);

	int addTag(CafeVO vo);
	List<CafeVO> cafeTag(int cafeid);
	int removeTag(CafeVO vo);
	CafeVO cafeImgbyId(int imgid);
}
