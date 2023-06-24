package com.caduk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.caduk.domain.MemberVO;

@Mapper
public interface MemberMapper {

	int newMember(MemberVO vo);
	int updateMember(MemberVO vo);
	int idCheck(String email);
	MemberVO getMember(String email);
	List<MemberVO> listMember();
}
