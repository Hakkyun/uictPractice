package com.uict.board.model.member.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uict.board.model.member.dao.MemberDao;
import com.uict.board.model.member.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao mDao;
	
	@Override
	public Member selectMember(String userId, String userPwd) {
		
		Map<String, Object> data = new HashMap<String, Object>();
		
		data.put("userId", userId);
		data.put("userPwd", userPwd);
		
		Member m = mDao.selectMember(data);
		
		return m;
	}



}
