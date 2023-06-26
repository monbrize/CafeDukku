package com.caduk.service;

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
		// TODO Auto-generated method stub
		return 0;
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
	public int addImg(int cafeid, String img_type, String img_name) {
		return this.cafeMapper.addImg(cafeid, img_type, img_name);
	}

	@Override
	public int removeImg(int cafeid, String img_type, String img_name) {
		// TODO Auto-generated method stub
		return this.cafeMapper.removeImg(cafeid, img_type, img_name);
	}

	@Override
	public int removeAllImg(int cafeid, String img_type) {
		// TODO Auto-generated method stub
		return this.cafeMapper.removeAllImg(cafeid, img_type);
	}

	@Override
	public String logoImg(int cafeid) {
		// TODO Auto-generated method stub
		return this.cafeMapper.logoImg(cafeid);
	}

	@Override
	public List<String> menuImg(int cafeid) {
		return this.cafeMapper.menuImg(cafeid);
	}

	@Override
	public List<String> cafeImg(int cafeid) {
		// TODO Auto-generated method stub
		return this.cafeMapper.cafeImg(cafeid);
	}

}
