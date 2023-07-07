package com.caduk.service;

import java.util.List;

import com.caduk.domain.CafeVO;
import com.caduk.domain.MemberVO;

public interface MemberService {

	int newMember(MemberVO vo);
	int updateMember(MemberVO vo);
	boolean idCheck(String email);
	boolean pwdCheck(String email, String pwd);
	MemberVO getMember(String email);
	List<MemberVO> listMember();
	
	int addFav(MemberVO vo);
	int cancelFav(MemberVO vo);
	int getFavCnt(int cafeid);
	boolean myFav(int idx, int cafeid);
	
	List<CafeVO> getMyFavList(int idx);
	List<CafeVO> getMyEvalList(int idx);
	
}
