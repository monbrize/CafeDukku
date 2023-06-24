package com.caduk.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.caduk.domain.MemberVO;
import com.caduk.mapper.MemberMapper;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public int newMember(MemberVO vo) {
		vo.setPwd(passwordEncoder.encode(vo.getPwd()));
		System.out.println("pwd encode ::::"+vo.getPwd());
		return this.memberMapper.newMember(vo);
	}

	@Override
	public int updateMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberVO getMember(String email) {
		return this.memberMapper.getMember(email);

	}

	@Override
	public List<MemberVO> listMember() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean idCheck(String email) {
		String id=this.memberMapper.getMember(email).getEmail();
		return (id!=null)?true:false;
	}
	@Override
	public boolean pwdCheck(String email, String pwd) {
		return passwordEncoder.matches(pwd, this.memberMapper.getMember(email).getPwd());
	}

}
