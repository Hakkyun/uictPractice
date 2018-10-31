package com.uict.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.uict.board.model.member.service.MemberService;
import com.uict.board.model.member.vo.Member;

@SessionAttributes(value = {"m"})
@Controller
public class MemberController {

	@Autowired
	MemberService mService;

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(@RequestParam String userId, @RequestParam String userPwd, Model model) {

		String msg = "";
		Member m = mService.selectMember(userId, userPwd);

		if (m != null) {
			msg = "로그인 성공!";
			model.addAttribute("m", m);
		} else {
			msg = "회원정보가 없습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("loc", "/main.do");

		return "common/msg";
	}

	@RequestMapping("logout.do")
	public String memberLogout(SessionStatus status, Model model) {

		if (!status.isComplete()) {
			status.setComplete();
		}
		
		model.addAttribute("msg", "로그아웃!!");
		model.addAttribute("loc", "/main.do");		
		
		return "common/msg";
	}

}
