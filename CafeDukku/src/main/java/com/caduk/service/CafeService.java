package com.caduk.service;

import com.caduk.domain.CafeVO;

public interface CafeService {

	int createCafe(CafeVO vo);
	int updateCafe(CafeVO vo);
	int deleteCafe(int cafeId);
	CafeVO viewCafe(int cafeId);
	CafeVO searchCafe(String key);
	int updateOwner(int idx);
}
