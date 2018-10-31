package com.uict.board.model.member.service;

import com.uict.board.model.member.vo.Member;

public interface MemberService {

	Member selectMember(String userId, String userPwd);
	
}
