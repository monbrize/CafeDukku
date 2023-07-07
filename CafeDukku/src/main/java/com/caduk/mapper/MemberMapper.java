package com.caduk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.caduk.domain.CafeVO;
import com.caduk.domain.MemberVO;

@Mapper
public interface MemberMapper {

	int newMember(MemberVO vo);
	int updateMember(MemberVO vo);
	int idCheck(String email);
	MemberVO getMember(String email);
	List<MemberVO> listMember();
	
	int addFav(MemberVO vo);
	int cancelFav(MemberVO vo);
	int getFavCnt(int cafeid);
	boolean myFav(MemberVO vo);
	
	List<CafeVO> getMyFavList(int idx);
	List<CafeVO> getMyEvalList(int idx);
}
