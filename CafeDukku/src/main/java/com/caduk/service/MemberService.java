package com.caduk.service;

import java.util.List;

import com.caduk.domain.ListVO;
import com.caduk.domain.MemberVO;

public interface MemberService {

	int newMember(MemberVO vo);
	MemberVO getMember(String email);
	boolean idCheck(String email);
	boolean pwdCheck(String email, String pwd);
	//--------
	int updateMember(MemberVO vo);
	List<MemberVO> listMember();
	//--------
	
	int addFav(MemberVO vo);
	int cancelFav(MemberVO vo);
	boolean myFav(int idx, int cafeid);
	
	List<ListVO> getMyFavList(int idx);
	List<ListVO> getMyEvalList(int idx);
	
}
