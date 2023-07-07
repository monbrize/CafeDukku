package com.caduk.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.caduk.domain.ListVO;
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
		return this.memberMapper.newMember(vo);
	}

	@Override
	public MemberVO getMember(String email) {
		return this.memberMapper.getMember(email);
		
	}
	@Override
	public int updateMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<MemberVO> listMember() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean idCheck(String email) {
		int res=this.memberMapper.idCheck(email);
		return (res==0)?false:true;
	}
	@Override
	public boolean pwdCheck(String email, String pwd) {
		int res=this.memberMapper.idCheck(email);
		if(res==0) return false;
		
		return passwordEncoder.matches(pwd, this.memberMapper.getMember(email).getPwd());
	}

	@Override
	public int addFav(MemberVO vo) {
		return this.memberMapper.addFav(vo);
	}

	@Override
	public int cancelFav(MemberVO vo) {
		return this.memberMapper.cancelFav(vo);
	}

	@Override
	public boolean myFav(int idx, int cafeid) {
		MemberVO vo=new MemberVO();
		vo.setIdx(idx);
		vo.setCafeid(cafeid);
		return this.memberMapper.myFav(vo);
	}

	@Override
	public List<ListVO> getMyFavList(int idx) {
		return this.memberMapper.getMyFavList(idx);
	}

	@Override
	public List<ListVO> getMyEvalList(int idx) {
		return this.memberMapper.getMyEvalList(idx);
	}

}
