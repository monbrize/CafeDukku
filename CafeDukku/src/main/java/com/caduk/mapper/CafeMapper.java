package com.caduk.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.caduk.domain.CafeVO;

@Mapper
public interface CafeMapper {

	int createCafe(CafeVO vo);
	int updateCafe(CafeVO vo);
	int deleteCafe(int cafeId);
	CafeVO viewCafe(int cafeId);
	CafeVO searchCafe(String key);
	int updateOwner(int idx);
}
