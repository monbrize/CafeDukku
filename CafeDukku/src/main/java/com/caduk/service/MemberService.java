package com.caduk.service;

import java.util.List;

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
	boolean myFav(MemberVO vo);
	
	List<MemberVO> getMyFavList(int idx);
	
}
