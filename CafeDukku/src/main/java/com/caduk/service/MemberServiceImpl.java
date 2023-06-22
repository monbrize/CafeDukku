package com.caduk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.caduk.domain.MemberVO;
import com.caduk.mapper.MemberMapper;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public int newMember(MemberVO vo) {
		return this.memberMapper.newMember(vo);
	}

	@Override
	public int updateMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberVO getMember(int idx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberVO> listMember() {
		// TODO Auto-generated method stub
		return null;
	}

}
