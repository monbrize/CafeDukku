package com.caduk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.caduk.domain.CafeVO;
import com.caduk.mapper.CafeMapper;

@Service("CafeService")
public class CafeServiceImpl implements CafeService {

	@Autowired
	private CafeMapper cafeMapper;
	
	@Override
	public int createCafe(CafeVO vo) {
		int n=this.cafeMapper.updateOwner(vo.getIdx());
		return (n>0)?this.cafeMapper.createCafe(vo):0;
	}

	@Override
	public int updateCafe(CafeVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCafe(int cafeId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CafeVO viewCafe(int cafeId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CafeVO searchCafe(String key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateOwner(int idx) {
		return this.cafeMapper.updateOwner(idx);
	}

}
