package com.uict.board.model.member.dao;

import java.util.Map;

import com.uict.board.model.member.vo.Member;

public interface MemberDao {

	public Member selectMember(Map<String, Object> data);
	
}
