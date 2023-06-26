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
	
	int addImg(int cafeid, String img_type, String img_name);
	int removeImg(int cafeid, String img_type, String img_name);
	int removeAllImg(int cafeid, String img_type);
	String logoImg(int cafeid);
	List<String> menuImg(int cafeid);
	List<String> cafeImg(int cafeid);
}
