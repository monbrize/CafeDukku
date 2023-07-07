package com.caduk.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.caduk.domain.ListVO;
import com.caduk.domain.MemberVO;

@Mapper
public interface MemberMapper {

	int newMember(MemberVO vo);
	MemberVO getMember(String email);
	int idCheck(String email);
	
	int addFav(MemberVO vo);
	int cancelFav(MemberVO vo);
	boolean myFav(MemberVO vo);
	
	//ListVO
	List<ListVO> getMyFavList(int idx);
	List<ListVO> getMyEvalList(int idx);
}
