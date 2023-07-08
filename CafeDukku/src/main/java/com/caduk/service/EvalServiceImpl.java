package com.caduk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.caduk.domain.EvaluationVO;
import com.caduk.mapper.EvalMapper;

@Service
public class EvalServiceImpl implements EvalService {
	
	@Autowired
	private EvalMapper evalMapper;

	@Override
	public int cafeCheck(String cafename) {
		return this.evalMapper.cafeCheck(cafename);
	}

	@Override
	public int evalCafe(EvaluationVO vo) {
		return this.evalMapper.evalCafe(vo);
	}

	@Override
	public int evalMenu(List<EvaluationVO> list) {
		return this.evalMapper.evalMenu(list);
	}

	@Override
	public int getCafeIdbyName(String cafename) {
		return this.evalMapper.getCafeIdbyName(cafename);
	}

}
