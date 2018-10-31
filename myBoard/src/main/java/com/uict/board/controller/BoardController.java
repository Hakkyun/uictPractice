package com.uict.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.uict.board.model.board.service.BoardService;
import com.uict.board.model.board.vo.Board;
import com.uict.board.model.member.vo.Member;

@SessionAttributes(value={"m"})
@Controller
public class BoardController {
	
	Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	BoardService bService;
	
	@RequestMapping("main.do")
	public String main(HttpSession session){
		return "main";
	}

	@RequestMapping("board.do")
	public String board(@RequestParam(defaultValue="1") int currentPage, Model model){
		
/*		int listCount = bService.boardListCount();
		
		Pagination pagination = new Pagination(listCount, currentPage);
		
		 이상 페이징 처리 부분 */
		
		List<Board> list = bService.getBoardList();
				
		if(list != null) model.addAttribute("list", list);
		
		return "board/boardList";
	}
	
	@RequestMapping("writing.do")
	public String writing(HttpSession session, Model model){	
		
		Member m = (Member)session.getAttribute("m");
		
		String msg = "";
		String tar = "board/writing";
				
		if(m == null) {
			msg = "글쓰기는 로그인 후 가능합니다.";
		    model.addAttribute("msg", msg);
		    model.addAttribute("loc", "/board.do");
		    tar = "common/msg";
		}
		
		return tar;
	}
	
	
	@RequestMapping(value="enrollBoard.do", method=RequestMethod.POST)
	public String enrollBoard(HttpSession session, @RequestParam String title, @RequestParam String content, Model model) {
		
		String writer = ((Member)session.getAttribute("m")).getmName();
		Board b = new Board();
		b.setbTitle(title);
		b.setbWriter(writer);
		b.setbContent(content);
				
		int result = bService.enrollBoard(b);
		
		List<Board> list = bService.getBoardList();
		model.addAttribute("list", list);
		
		return "board/boardList";
	}
	
	@RequestMapping(value="boardDetail.do", method=RequestMethod.POST)
	public String boardDetail(@RequestParam int bNum, Model model) {
		
		Board b = bService.selectOne(bNum);
		
		if(b != null) model.addAttribute("b", b);
		
		return "board/boardDetail";
	}
	
	@RequestMapping(value="editText.do", method=RequestMethod.POST)
	public String editText(@RequestParam int bNum, Model model) {
	
		Board b = bService.selectOne(bNum);
		
		if(b != null) model.addAttribute("b", b);		
		
		return "board/editText";
	}

	@RequestMapping(value="editComplete.do", method=RequestMethod.POST)
	public String editComplete(@RequestParam int bNum, @RequestParam String title, @RequestParam String content, Model model) {
			
		Board b = new Board();
		b.setBno(bNum);
		b.setbTitle(title);
		b.setbContent(content);
		
		int result = bService.editComplete(b);
		
		if(result > 0) {
			b = bService.selectOne(bNum);
			model.addAttribute("b", b);		
		}
		
		return "board/boardDetail";
	}

	@RequestMapping("delText.do")
	public String delText(@RequestParam int bNum, Model model) {
		
		int result = bService.delText(bNum);
		
		List<Board> list = bService.getBoardList();
		
		if(list != null) model.addAttribute("list", list);
		
		return "board/boardList";
	}
	
	@ResponseBody
	@RequestMapping("ajaxBoard.do")
	public List<Board> ajaxBoard(){
		return bService.getBoardList();
	}

	@ResponseBody
	@RequestMapping("ajaxDetail.do")
	public Board ajaxDetail(@RequestParam int bNum){
		return bService.selectOne(bNum);
	}

	@ResponseBody
	@RequestMapping("ajaxEnroll.do")
	public List<Board> enrollBoard(@RequestParam String title, @RequestParam String writer, @RequestParam String content) {
		
		Board b = new Board();
		b.setbTitle(title);
		b.setbWriter(writer);
		b.setbContent(content);
				
		bService.enrollBoard(b);
		
		return bService.getBoardList();
	}

	@ResponseBody
	@RequestMapping("ajaxDelete.do")
	public List<Board> ajaxDelete(@RequestParam int bNum) {
		
		bService.delText(bNum);
		
		List<Board> list = bService.getBoardList();
		
		return list;
	}

	
}
