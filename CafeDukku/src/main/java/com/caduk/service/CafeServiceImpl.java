package com.caduk.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.caduk.domain.CafeVO;
import com.caduk.domain.EvaluationVO;
import com.caduk.domain.ListVO;
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
	public int deleteCafe(int cafeid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getCafeIdbyIdx(int idx) {
		return this.cafeMapper.getCafeIdbyIdx(idx);
	}
	
	@Override
	public CafeVO viewCafe(int cafeid) {
		return this.cafeMapper.viewCafe(cafeid);
	}
	@Override
	public CafeVO viewMyCafe(int idx) {
		return this.cafeMapper.viewMyCafe(idx);
	}

	@Override
	public List<CafeVO> getSearchCafe(String key) {
		return this.cafeMapper.getSearchCafe(key);
	}

	@Override
	public List<CafeVO> getAllCafe() {
		return this.cafeMapper.getAllCafe();
	}

	@Override
	public List<CafeVO> getCafebyTag(String tag) {
		return this.cafeMapper.getCafebyTag(tag);
	}

	@Override
	public int getFavCnt(int cafeid) {
		return this.cafeMapper.getFavCnt(cafeid);
	}

	@Override
	public List<ListVO> getOpenCafe() {
		return this.cafeMapper.getOpenCafe();
	}
	
	@Override
	public List<ListVO> getTopEval() {
		return this.cafeMapper.getTopEval();
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

	@Override
	public int evalCafe(EvaluationVO vo) {
		return this.cafeMapper.evalCafe(vo);
	}

	@Override
	public double getMyTotalEval(int cafeid) {
		int cnt=this.cafeMapper.isEval(cafeid);
		return (cnt==0)?0:this.cafeMapper.getMyTotalEval(cafeid);
	}

	@Override
	public EvaluationVO getMyEval(int cafeid) {
		return this.cafeMapper.getMyEval(cafeid);
	}

	@Override
	public List<EvaluationVO> getTopMenu(int cafeid) {
		return this.cafeMapper.getTopMenu(cafeid);
	}

	@Override
	public List<CafeVO> getAllMap() {
		return this.cafeMapper.getAllMap();
	}








}
