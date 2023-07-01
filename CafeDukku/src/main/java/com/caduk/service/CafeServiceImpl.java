package com.caduk.service;

import java.util.ArrayList;
import java.util.List;

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
		return this.cafeMapper.updateCafe(vo);
	}

	@Override
	public int deleteCafe(int cafeId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CafeVO viewCafe(int idx) {
		return this.cafeMapper.viewCafe(idx);
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

	@Override
	public int addImg(CafeVO vo) {
		return this.cafeMapper.addImg(vo);
	}

	@Override
	public int removeImg(int imgid) {
		return this.cafeMapper.removeImg(imgid);
	}

	@Override
	public List<CafeVO> cafeImg(int cafeid) {
		List<CafeVO> res =this.cafeMapper.cafeImg(cafeid);
		System.out.println("service.toString():::"+res.toString());
		System.out.println("cafeid :::"+cafeid);
		return res;
	}

	@Override
	public int addTag(CafeVO vo) {
		return this.cafeMapper.addTag(vo);
	}

	@Override
	public int removeTag(CafeVO vo) {
		return this.cafeMapper.removeTag(vo);
	}

	@Override
	public List<CafeVO> cafeTag(int cafeid) {
		return this.cafeMapper.cafeTag(cafeid);
	}

	@Override
	public CafeVO cafeImgbyId(int imgid) {
		return this.cafeMapper.cafeImgbyId(imgid);
	}

}
