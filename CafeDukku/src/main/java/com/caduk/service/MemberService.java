package com.caduk.service;

import java.util.List;

import com.caduk.domain.MemberVO;

public interface MemberService {

	int newMember(MemberVO vo);
	int updateMember(MemberVO vo);
	MemberVO getMember(int idx);
	List<MemberVO> listMember();
	
}
